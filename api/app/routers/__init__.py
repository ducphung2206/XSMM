"""XSMM Copilot Routers"""
from app.routers.work_items import router as work_items_router
from app.routers.materials import router as materials_router
from app.routers.contractors import router as contractors_router
from app.routers.labor_rates import router as labor_rates_router
from app.routers.copilot import router as copilot_router

__all__ = [
    "work_items_router",
    "materials_router",
    "contractors_router",
    "labor_rates_router",
    "copilot_router",
]
