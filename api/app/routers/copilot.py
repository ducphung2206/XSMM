"""
XSMM Copilot - AI Chat Router
Endpoints for AI Copilot interaction
"""
from typing import List, Optional

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.database import get_db
from app.models.schemas import CopilotRequest, CopilotResponse, ChatMessage
from app.services.copilot import CopilotService

router = APIRouter(prefix="/copilot", tags=["AI Copilot"])


@router.post("/chat", response_model=CopilotResponse)
async def chat_with_copilot(
    request: CopilotRequest,
    db: AsyncSession = Depends(get_db),
):
    """
    Chat with XSMM Copilot
    
    Send a message and receive:
    - AI response with analysis
    - Work item suggestions
    - Material/labor rate lookups
    - Calculation results
    - Excel actions (insert row, set cell)
    """
    copilot = CopilotService(db_session=db)
    
    history = [
        {"role": msg.role, "content": msg.content}
        for msg in (request.history or [])
    ]
    
    result = await copilot.chat(
        message=request.message,
        history=history,
        context=request.context,
    )
    
    return CopilotResponse(**result)


@router.get("/lookup/{code}")
async def quick_lookup(
    code: str,
    db: AsyncSession = Depends(get_db),
):
    """
    Quick lookup a work item by XSMM code
    
    Returns work item details with labor rates
    """
    copilot = CopilotService(db_session=db)
    result = await copilot.quick_lookup(code)
    
    if "error" in result:
        raise HTTPException(status_code=404, detail=result["error"])
    
    return result


@router.post("/calculate")
async def calculate_quantity(
    work_item_code: str,
    dimensions: dict,
    db: AsyncSession = Depends(get_db),
):
    """
    Calculate quantity for a work item based on dimensions
    
    Example dimensions:
    - {"length": 10, "width": 5, "height": 0.2} for volume
    - {"length": 10, "width": 5} for area
    - {"count": 100} for count
    """
    copilot = CopilotService(db_session=db)
    
    # Get work item
    item = await copilot.quick_lookup(work_item_code)
    if "error" in item:
        raise HTTPException(status_code=404, detail=item["error"])
    
    unit = item["unit"].lower()
    result = {"work_item": item, "dimensions": dimensions}
    
    # Calculate based on unit type
    if unit in ["m3", "m³"]:
        # Volume calculation
        length = dimensions.get("length", 0)
        width = dimensions.get("width", 0)
        height = dimensions.get("height", 0)
        quantity = length * width * height
        result["quantity"] = round(quantity, 3)
        result["formula"] = f"{length} × {width} × {height} = {quantity} m³"
        
    elif unit in ["m2", "m²"]:
        # Area calculation
        length = dimensions.get("length", 0)
        width = dimensions.get("width", 0)
        quantity = length * width
        result["quantity"] = round(quantity, 2)
        result["formula"] = f"{length} × {width} = {quantity} m²"
        
    elif unit in ["md", "m"]:
        # Length calculation
        length = dimensions.get("length", 0)
        result["quantity"] = round(length, 2)
        result["formula"] = f"{length} m"
        
    elif unit in ["cái", "bộ", "điểm"]:
        # Count
        count = dimensions.get("count", 0)
        result["quantity"] = count
        result["formula"] = f"{count} {unit}"
    
    else:
        result["quantity"] = dimensions.get("quantity", 0)
        result["formula"] = f"Custom: {dimensions}"
    
    # Calculate cost if rates available
    if item.get("labor_rates"):
        rates = item["labor_rates"]
        min_rate = min(r["rate"] for r in rates)
        max_rate = max(r["rate"] for r in rates)
        avg_rate = sum(r["rate"] for r in rates) / len(rates)
        
        result["cost_estimate"] = {
            "min": round(result["quantity"] * min_rate),
            "max": round(result["quantity"] * max_rate),
            "avg": round(result["quantity"] * avg_rate),
            "unit_rates": rates,
        }
    
    return result


@router.get("/suggestions")
async def get_suggestions(
    query: str,
    limit: int = 10,
    db: AsyncSession = Depends(get_db),
):
    """
    Get autocomplete suggestions for work items, materials, contractors
    """
    from sqlalchemy import select, union_all
    from app.models.models import WorkItem, Material, Contractor
    
    results = []
    
    # Search work items
    wi_query = (
        select(WorkItem.code, WorkItem.name)
        .where(
            WorkItem.name.ilike(f"%{query}%") |
            WorkItem.code.ilike(f"%{query}%")
        )
        .limit(limit)
    )
    wi_result = await db.execute(wi_query)
    for code, name in wi_result.all():
        results.append({
            "type": "work_item",
            "code": code,
            "name": name,
            "display": f"[{code}] {name}",
        })
    
    # Search materials
    mat_query = (
        select(Material.id, Material.name, Material.brand)
        .where(
            Material.is_active == True,
            Material.name.ilike(f"%{query}%") |
            Material.brand.ilike(f"%{query}%")
        )
        .limit(limit)
    )
    mat_result = await db.execute(mat_query)
    for id, name, brand in mat_result.all():
        results.append({
            "type": "material",
            "id": str(id),
            "name": name,
            "brand": brand,
            "display": f"{brand} - {name}" if brand else name,
        })
    
    # Search contractors
    con_query = (
        select(Contractor.id, Contractor.name, Contractor.specialty)
        .where(
            Contractor.is_active == True,
            Contractor.name.ilike(f"%{query}%")
        )
        .limit(limit)
    )
    con_result = await db.execute(con_query)
    for id, name, specialty in con_result.all():
        results.append({
            "type": "contractor",
            "id": str(id),
            "name": name,
            "specialty": specialty,
            "display": f"{name} ({specialty})",
        })
    
    return {"query": query, "results": results[:limit]}
