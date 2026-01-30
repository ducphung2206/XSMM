"""
XSMM Copilot - FastAPI Application
Main entry point
"""
from contextlib import asynccontextmanager

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.core.config import get_settings
from app.routers import (
    work_items_router,
    materials_router,
    contractors_router,
    labor_rates_router,
    copilot_router,
)

settings = get_settings()


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Application lifespan events"""
    # Startup
    print(f"🚀 Starting {settings.app_name} v{settings.app_version}")
    print(f"📍 Environment: {settings.environment}")
    yield
    # Shutdown
    print("👋 Shutting down...")


app = FastAPI(
    title=settings.app_name,
    version=settings.app_version,
    description="AI Copilot hỗ trợ QS tính giá thành trong Excel",
    docs_url="/docs" if settings.debug else None,
    redoc_url="/redoc" if settings.debug else None,
    lifespan=lifespan,
)

# CORS Middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Health check
@app.get("/health", tags=["Health"])
async def health_check():
    """Health check endpoint"""
    return {
        "status": "healthy",
        "app": settings.app_name,
        "version": settings.app_version,
        "environment": settings.environment,
    }


# API Info
@app.get("/", tags=["Info"])
async def root():
    """API information"""
    return {
        "name": settings.app_name,
        "version": settings.app_version,
        "description": "AI Copilot for QS price estimation",
        "docs": "/docs" if settings.debug else "Disabled in production",
    }


# Include routers
app.include_router(work_items_router, prefix="/api/v1")
app.include_router(materials_router, prefix="/api/v1")
app.include_router(contractors_router, prefix="/api/v1")
app.include_router(labor_rates_router, prefix="/api/v1")
app.include_router(copilot_router, prefix="/api/v1")
