"""
XSMM Copilot - Labor Rates Router
CRUD operations for labor rates
"""
from typing import List, Optional
from uuid import UUID

from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.database import get_db
from app.models.models import LaborRate, Contractor, WorkItem
from app.models.schemas import (
    LaborRateCreate,
    LaborRateUpdate,
    LaborRateResponse,
    LaborRateWithContractor,
)

router = APIRouter(prefix="/labor-rates", tags=["Labor Rates"])


@router.get("/", response_model=List[LaborRateWithContractor])
async def list_labor_rates(
    work_item_code: Optional[str] = None,
    contractor_id: Optional[UUID] = None,
    region: str = "HCM",
    limit: int = Query(50, ge=1, le=200),
    offset: int = Query(0, ge=0),
    db: AsyncSession = Depends(get_db),
):
    """List labor rates with optional filtering"""
    query = select(LaborRate).where(LaborRate.region == region)
    
    if work_item_code:
        query = query.where(LaborRate.work_item_code == work_item_code)
    
    if contractor_id:
        query = query.where(LaborRate.contractor_id == contractor_id)
    
    query = query.order_by(LaborRate.work_item_code, LaborRate.rate_per_unit)
    query = query.limit(limit).offset(offset)
    
    result = await db.execute(query)
    rates = result.scalars().all()
    
    # Enrich with contractor and work item info
    enriched = []
    for rate in rates:
        contractor_name = None
        contractor_rating = None
        
        if rate.contractor_id:
            c_query = select(Contractor.name, Contractor.rating).where(Contractor.id == rate.contractor_id)
            c_result = await db.execute(c_query)
            c_row = c_result.first()
            if c_row:
                contractor_name, contractor_rating = c_row
        
        # Get work item name
        wi_query = select(WorkItem.name).where(WorkItem.code == rate.work_item_code)
        wi_result = await db.execute(wi_query)
        work_item_name = wi_result.scalar_one_or_none()
        
        enriched.append({
            **rate.__dict__,
            "contractor_name": contractor_name,
            "contractor_rating": float(contractor_rating) if contractor_rating else None,
            "work_item_name": work_item_name,
        })
    
    return enriched


@router.get("/by-work-item/{work_item_code}", response_model=List[LaborRateWithContractor])
async def get_rates_for_work_item(
    work_item_code: str,
    region: str = "HCM",
    db: AsyncSession = Depends(get_db),
):
    """Get all labor rates for a specific work item"""
    # Verify work item exists
    wi_query = select(WorkItem).where(WorkItem.code == work_item_code)
    wi_result = await db.execute(wi_query)
    work_item = wi_result.scalar_one_or_none()
    
    if not work_item:
        raise HTTPException(status_code=404, detail=f"Work item {work_item_code} not found")
    
    query = (
        select(LaborRate)
        .where(
            LaborRate.work_item_code == work_item_code,
            LaborRate.region == region,
        )
        .order_by(LaborRate.rate_per_unit)
    )
    
    result = await db.execute(query)
    rates = result.scalars().all()
    
    # Enrich with contractor info
    enriched = []
    for rate in rates:
        contractor_name = None
        contractor_rating = None
        
        if rate.contractor_id:
            c_query = select(Contractor.name, Contractor.rating).where(Contractor.id == rate.contractor_id)
            c_result = await db.execute(c_query)
            c_row = c_result.first()
            if c_row:
                contractor_name, contractor_rating = c_row
        
        enriched.append({
            **rate.__dict__,
            "contractor_name": contractor_name,
            "contractor_rating": float(contractor_rating) if contractor_rating else None,
            "work_item_name": work_item.name,
        })
    
    return enriched


@router.get("/compare")
async def compare_rates(
    work_item_code: str,
    region: str = "HCM",
    db: AsyncSession = Depends(get_db),
):
    """Compare labor rates from different contractors for a work item"""
    query = (
        select(LaborRate, Contractor)
        .outerjoin(Contractor, LaborRate.contractor_id == Contractor.id)
        .where(
            LaborRate.work_item_code == work_item_code,
            LaborRate.region == region,
        )
        .order_by(LaborRate.rate_per_unit)
    )
    
    result = await db.execute(query)
    rows = result.all()
    
    if not rows:
        return {"work_item_code": work_item_code, "rates": [], "recommendation": None}
    
    rates = []
    for rate, contractor in rows:
        rates.append({
            "rate_id": str(rate.id),
            "contractor_name": contractor.name if contractor else "Unknown",
            "contractor_rating": float(contractor.rating) if contractor and contractor.rating else None,
            "rate_per_unit": float(rate.rate_per_unit),
            "unit": rate.unit,
            "includes_material": rate.includes_material,
            "notes": rate.notes,
        })
    
    # Find best value (lowest price with acceptable rating)
    best = min(rates, key=lambda x: x["rate_per_unit"])
    
    return {
        "work_item_code": work_item_code,
        "region": region,
        "rates": rates,
        "recommendation": {
            "contractor": best["contractor_name"],
            "rate": best["rate_per_unit"],
            "reason": "Giá thấp nhất" if best == rates[0] else "Cân đối giá và chất lượng",
        },
    }


@router.post("/", response_model=LaborRateResponse)
async def create_labor_rate(
    rate: LaborRateCreate,
    db: AsyncSession = Depends(get_db),
):
    """Create a new labor rate"""
    # Verify work item exists
    wi_query = select(WorkItem).where(WorkItem.code == rate.work_item_code)
    wi_result = await db.execute(wi_query)
    if not wi_result.scalar_one_or_none():
        raise HTTPException(status_code=404, detail=f"Work item {rate.work_item_code} not found")
    
    db_rate = LaborRate(**rate.model_dump())
    db.add(db_rate)
    await db.commit()
    await db.refresh(db_rate)
    return db_rate


@router.patch("/{rate_id}", response_model=LaborRateResponse)
async def update_labor_rate(
    rate_id: UUID,
    rate: LaborRateUpdate,
    db: AsyncSession = Depends(get_db),
):
    """Update a labor rate"""
    query = select(LaborRate).where(LaborRate.id == rate_id)
    result = await db.execute(query)
    db_rate = result.scalar_one_or_none()
    
    if not db_rate:
        raise HTTPException(status_code=404, detail="Labor rate not found")
    
    update_data = rate.model_dump(exclude_unset=True)
    for key, value in update_data.items():
        setattr(db_rate, key, value)
    
    await db.commit()
    await db.refresh(db_rate)
    return db_rate


@router.delete("/{rate_id}")
async def delete_labor_rate(rate_id: UUID, db: AsyncSession = Depends(get_db)):
    """Delete a labor rate"""
    query = select(LaborRate).where(LaborRate.id == rate_id)
    result = await db.execute(query)
    db_rate = result.scalar_one_or_none()
    
    if not db_rate:
        raise HTTPException(status_code=404, detail="Labor rate not found")
    
    await db.delete(db_rate)
    await db.commit()
    
    return {"message": "Labor rate deleted"}
