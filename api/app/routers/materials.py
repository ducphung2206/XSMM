"""
XSMM Copilot - Materials Router
CRUD operations for materials catalog
"""
from typing import List, Optional
from uuid import UUID

from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy import select, func
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import selectinload

from app.core.database import get_db
from app.models.models import Material, MaterialPrice, Supplier
from app.models.schemas import (
    MaterialCreate,
    MaterialUpdate,
    MaterialResponse,
    MaterialWithPrice,
)

router = APIRouter(prefix="/materials", tags=["Materials"])


@router.get("/", response_model=List[MaterialWithPrice])
async def list_materials(
    category: Optional[str] = None,
    brand: Optional[str] = None,
    search: Optional[str] = None,
    is_active: bool = True,
    limit: int = Query(50, ge=1, le=200),
    offset: int = Query(0, ge=0),
    db: AsyncSession = Depends(get_db),
):
    """List materials with optional filtering"""
    query = select(Material).where(Material.is_active == is_active)
    
    if category:
        query = query.where(Material.category == category)
    
    if brand:
        query = query.where(Material.brand == brand)
    
    if search:
        query = query.where(
            Material.name.ilike(f"%{search}%") |
            Material.product_code.ilike(f"%{search}%") |
            Material.brand.ilike(f"%{search}%")
        )
    
    query = query.order_by(Material.category, Material.brand, Material.name)
    query = query.limit(limit).offset(offset)
    
    result = await db.execute(query)
    materials = result.scalars().all()
    
    # Enrich with current prices
    enriched = []
    for mat in materials:
        price_query = (
            select(MaterialPrice.final_price)
            .where(MaterialPrice.material_id == mat.id)
            .order_by(MaterialPrice.valid_from.desc())
            .limit(1)
        )
        price_result = await db.execute(price_query)
        current_price = price_result.scalar_one_or_none()
        
        mat_dict = {
            **mat.__dict__,
            "current_price": current_price,
        }
        enriched.append(mat_dict)
    
    return enriched


@router.get("/categories")
async def list_material_categories(db: AsyncSession = Depends(get_db)):
    """Get list of unique material categories"""
    query = select(Material.category).distinct().order_by(Material.category)
    result = await db.execute(query)
    return {"categories": result.scalars().all()}


@router.get("/brands")
async def list_material_brands(
    category: Optional[str] = None,
    db: AsyncSession = Depends(get_db),
):
    """Get list of unique brands, optionally filtered by category"""
    query = select(Material.brand).distinct().where(Material.brand.isnot(None))
    
    if category:
        query = query.where(Material.category == category)
    
    query = query.order_by(Material.brand)
    result = await db.execute(query)
    return {"brands": result.scalars().all()}


@router.get("/{material_id}", response_model=MaterialWithPrice)
async def get_material(material_id: UUID, db: AsyncSession = Depends(get_db)):
    """Get material by ID with current price"""
    query = select(Material).where(Material.id == material_id)
    result = await db.execute(query)
    material = result.scalar_one_or_none()
    
    if not material:
        raise HTTPException(status_code=404, detail="Material not found")
    
    # Get current price
    price_query = (
        select(MaterialPrice.final_price)
        .where(MaterialPrice.material_id == material_id)
        .order_by(MaterialPrice.valid_from.desc())
        .limit(1)
    )
    price_result = await db.execute(price_query)
    current_price = price_result.scalar_one_or_none()
    
    # Get supplier name
    supplier_name = None
    if material.supplier_id:
        supplier_query = select(Supplier.name).where(Supplier.id == material.supplier_id)
        supplier_result = await db.execute(supplier_query)
        supplier_name = supplier_result.scalar_one_or_none()
    
    return {
        **material.__dict__,
        "current_price": current_price,
        "supplier_name": supplier_name,
    }


@router.post("/", response_model=MaterialResponse)
async def create_material(
    material: MaterialCreate,
    db: AsyncSession = Depends(get_db),
):
    """Create a new material"""
    db_material = Material(**material.model_dump())
    db.add(db_material)
    await db.commit()
    await db.refresh(db_material)
    return db_material


@router.patch("/{material_id}", response_model=MaterialResponse)
async def update_material(
    material_id: UUID,
    material: MaterialUpdate,
    db: AsyncSession = Depends(get_db),
):
    """Update a material"""
    query = select(Material).where(Material.id == material_id)
    result = await db.execute(query)
    db_material = result.scalar_one_or_none()
    
    if not db_material:
        raise HTTPException(status_code=404, detail="Material not found")
    
    update_data = material.model_dump(exclude_unset=True)
    for key, value in update_data.items():
        setattr(db_material, key, value)
    
    await db.commit()
    await db.refresh(db_material)
    return db_material


@router.delete("/{material_id}")
async def delete_material(material_id: UUID, db: AsyncSession = Depends(get_db)):
    """Soft delete a material (set is_active=False)"""
    query = select(Material).where(Material.id == material_id)
    result = await db.execute(query)
    db_material = result.scalar_one_or_none()
    
    if not db_material:
        raise HTTPException(status_code=404, detail="Material not found")
    
    db_material.is_active = False
    await db.commit()
    
    return {"message": "Material deactivated"}


@router.get("/search/", response_model=List[MaterialWithPrice])
async def search_materials(
    q: str = Query(..., min_length=2),
    limit: int = Query(20, ge=1, le=100),
    db: AsyncSession = Depends(get_db),
):
    """Search materials by name, brand, or product code"""
    query = (
        select(Material)
        .where(
            Material.is_active == True,
            Material.name.ilike(f"%{q}%") |
            Material.brand.ilike(f"%{q}%") |
            Material.product_code.ilike(f"%{q}%")
        )
        .order_by(Material.category, Material.name)
        .limit(limit)
    )
    
    result = await db.execute(query)
    return result.scalars().all()
