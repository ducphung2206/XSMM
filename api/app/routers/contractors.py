"""
XSMM Copilot - Contractors Router
CRUD operations for contractors
"""
from typing import List, Optional
from uuid import UUID

from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.database import get_db
from app.models.models import Contractor, LaborRate
from app.models.schemas import (
    ContractorCreate,
    ContractorUpdate,
    ContractorResponse,
    LaborRateResponse,
)

router = APIRouter(prefix="/contractors", tags=["Contractors"])


@router.get("/", response_model=List[ContractorResponse])
async def list_contractors(
    specialty: Optional[str] = None,
    skill_level: Optional[str] = None,
    is_active: bool = True,
    limit: int = Query(50, ge=1, le=200),
    offset: int = Query(0, ge=0),
    db: AsyncSession = Depends(get_db),
):
    """List contractors with optional filtering"""
    query = select(Contractor).where(Contractor.is_active == is_active)
    
    if specialty:
        query = query.where(Contractor.specialty == specialty)
    
    if skill_level:
        query = query.where(Contractor.skill_level == skill_level)
    
    query = query.order_by(Contractor.rating.desc(), Contractor.name)
    query = query.limit(limit).offset(offset)
    
    result = await db.execute(query)
    return result.scalars().all()


@router.get("/specialties")
async def list_specialties(db: AsyncSession = Depends(get_db)):
    """Get list of unique specialties"""
    query = select(Contractor.specialty).distinct().order_by(Contractor.specialty)
    result = await db.execute(query)
    return {"specialties": result.scalars().all()}


@router.get("/{contractor_id}", response_model=ContractorResponse)
async def get_contractor(contractor_id: UUID, db: AsyncSession = Depends(get_db)):
    """Get contractor by ID"""
    query = select(Contractor).where(Contractor.id == contractor_id)
    result = await db.execute(query)
    contractor = result.scalar_one_or_none()
    
    if not contractor:
        raise HTTPException(status_code=404, detail="Contractor not found")
    
    return contractor


@router.get("/{contractor_id}/rates", response_model=List[LaborRateResponse])
async def get_contractor_rates(
    contractor_id: UUID,
    db: AsyncSession = Depends(get_db),
):
    """Get all labor rates for a contractor"""
    query = (
        select(LaborRate)
        .where(LaborRate.contractor_id == contractor_id)
        .order_by(LaborRate.work_item_code)
    )
    result = await db.execute(query)
    return result.scalars().all()


@router.post("/", response_model=ContractorResponse)
async def create_contractor(
    contractor: ContractorCreate,
    db: AsyncSession = Depends(get_db),
):
    """Create a new contractor"""
    db_contractor = Contractor(**contractor.model_dump())
    db.add(db_contractor)
    await db.commit()
    await db.refresh(db_contractor)
    return db_contractor


@router.patch("/{contractor_id}", response_model=ContractorResponse)
async def update_contractor(
    contractor_id: UUID,
    contractor: ContractorUpdate,
    db: AsyncSession = Depends(get_db),
):
    """Update a contractor"""
    query = select(Contractor).where(Contractor.id == contractor_id)
    result = await db.execute(query)
    db_contractor = result.scalar_one_or_none()
    
    if not db_contractor:
        raise HTTPException(status_code=404, detail="Contractor not found")
    
    update_data = contractor.model_dump(exclude_unset=True)
    for key, value in update_data.items():
        setattr(db_contractor, key, value)
    
    await db.commit()
    await db.refresh(db_contractor)
    return db_contractor


@router.delete("/{contractor_id}")
async def delete_contractor(contractor_id: UUID, db: AsyncSession = Depends(get_db)):
    """Soft delete a contractor"""
    query = select(Contractor).where(Contractor.id == contractor_id)
    result = await db.execute(query)
    db_contractor = result.scalar_one_or_none()
    
    if not db_contractor:
        raise HTTPException(status_code=404, detail="Contractor not found")
    
    db_contractor.is_active = False
    await db.commit()
    
    return {"message": "Contractor deactivated"}
