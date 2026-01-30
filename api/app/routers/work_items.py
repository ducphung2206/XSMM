"""
XSMM Copilot - Work Items Router
CRUD operations for XSMM work items
"""
from typing import List, Optional
from uuid import UUID

from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy import select, func
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import selectinload

from app.core.database import get_db
from app.models.models import Category, WorkType, WorkItem, LaborRate
from app.models.schemas import WorkItemResponse, WorkItemWithPrices, SearchRequest

router = APIRouter(prefix="/work-items", tags=["Work Items"])


@router.get("/", response_model=List[WorkItemResponse])
async def list_work_items(
    category_code: Optional[str] = None,
    work_type_code: Optional[str] = None,
    search: Optional[str] = None,
    limit: int = Query(50, ge=1, le=200),
    offset: int = Query(0, ge=0),
    db: AsyncSession = Depends(get_db),
):
    """List work items with optional filtering"""
    query = select(WorkItem)
    
    if category_code:
        query = query.join(WorkType).join(Category).where(Category.code == category_code)
    
    if work_type_code:
        query = query.join(WorkType).where(WorkType.code == work_type_code)
    
    if search:
        query = query.where(
            WorkItem.name.ilike(f"%{search}%") | 
            WorkItem.code.ilike(f"%{search}%")
        )
    
    query = query.order_by(WorkItem.code).limit(limit).offset(offset)
    
    result = await db.execute(query)
    return result.scalars().all()


@router.get("/count")
async def count_work_items(db: AsyncSession = Depends(get_db)):
    """Get total count of work items"""
    result = await db.execute(select(func.count(WorkItem.id)))
    return {"count": result.scalar()}


@router.get("/{code}", response_model=WorkItemWithPrices)
async def get_work_item(code: str, db: AsyncSession = Depends(get_db)):
    """Get work item by code with labor rates"""
    query = (
        select(WorkItem)
        .options(selectinload(WorkItem.labor_rates))
        .where(WorkItem.code == code)
    )
    
    result = await db.execute(query)
    work_item = result.scalar_one_or_none()
    
    if not work_item:
        raise HTTPException(status_code=404, detail=f"Work item {code} not found")
    
    return work_item


@router.get("/search/", response_model=List[WorkItemResponse])
async def search_work_items(
    q: str = Query(..., min_length=2),
    limit: int = Query(20, ge=1, le=100),
    db: AsyncSession = Depends(get_db),
):
    """Search work items by name or code"""
    query = (
        select(WorkItem)
        .where(
            WorkItem.name.ilike(f"%{q}%") | 
            WorkItem.code.ilike(f"%{q}%") |
            WorkItem.description.ilike(f"%{q}%")
        )
        .order_by(WorkItem.code)
        .limit(limit)
    )
    
    result = await db.execute(query)
    return result.scalars().all()


@router.get("/by-category/{category_code}", response_model=List[WorkItemResponse])
async def get_work_items_by_category(
    category_code: str,
    db: AsyncSession = Depends(get_db),
):
    """Get all work items in a category"""
    query = (
        select(WorkItem)
        .join(WorkType)
        .join(Category)
        .where(Category.code == category_code)
        .order_by(WorkItem.code)
    )
    
    result = await db.execute(query)
    items = result.scalars().all()
    
    if not items:
        raise HTTPException(status_code=404, detail=f"Category {category_code} not found or empty")
    
    return items
