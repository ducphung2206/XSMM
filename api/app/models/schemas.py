"""
XSMM Copilot - Pydantic Schemas
Request/Response validation models
"""
from datetime import datetime, date
from typing import Optional, List, Any
from uuid import UUID

from pydantic import BaseModel, Field, ConfigDict


# ============================================
# Base Schemas
# ============================================

class BaseSchema(BaseModel):
    """Base schema with common config"""
    model_config = ConfigDict(from_attributes=True)


# ============================================
# Work Item Schemas
# ============================================

class WorkItemBase(BaseSchema):
    code: str
    name: str
    unit: str
    description: Optional[str] = None
    measurement_method: Optional[str] = None
    formula: Optional[str] = None


class WorkItemResponse(WorkItemBase):
    id: UUID
    work_type_id: UUID
    notes: Optional[str] = None
    metadata_: Optional[dict] = Field(None, alias="metadata")
    sort_order: int = 0


class WorkItemWithPrices(WorkItemResponse):
    """Work item with labor rates attached"""
    labor_rates: List["LaborRateResponse"] = []


# ============================================
# Supplier Schemas
# ============================================

class SupplierBase(BaseSchema):
    name: str
    type: str = Field(pattern="^(material|contractor|both)$")
    contact: Optional[dict] = {}
    rating: Optional[float] = Field(0, ge=0, le=5)
    notes: Optional[str] = None


class SupplierCreate(SupplierBase):
    pass


class SupplierUpdate(BaseSchema):
    name: Optional[str] = None
    type: Optional[str] = None
    contact: Optional[dict] = None
    rating: Optional[float] = None
    notes: Optional[str] = None
    is_active: Optional[bool] = None


class SupplierResponse(SupplierBase):
    id: UUID
    is_active: bool
    created_at: datetime
    updated_at: datetime


# ============================================
# Material Schemas
# ============================================

class MaterialBase(BaseSchema):
    category: str
    subcategory: Optional[str] = None
    brand: Optional[str] = None
    product_code: Optional[str] = None
    name: str
    specs: Optional[dict] = {}
    unit: str
    unit_conversion: Optional[dict] = {}
    base_price: Optional[float] = None
    work_item_codes: Optional[List[str]] = []


class MaterialCreate(MaterialBase):
    supplier_id: Optional[UUID] = None


class MaterialUpdate(BaseSchema):
    category: Optional[str] = None
    subcategory: Optional[str] = None
    brand: Optional[str] = None
    product_code: Optional[str] = None
    name: Optional[str] = None
    specs: Optional[dict] = None
    unit: Optional[str] = None
    base_price: Optional[float] = None
    supplier_id: Optional[UUID] = None
    is_active: Optional[bool] = None


class MaterialResponse(MaterialBase):
    id: UUID
    supplier_id: Optional[UUID]
    is_active: bool
    created_at: datetime
    updated_at: datetime


class MaterialWithPrice(MaterialResponse):
    """Material with current price"""
    current_price: Optional[float] = None
    supplier_name: Optional[str] = None


# ============================================
# Contractor Schemas
# ============================================

class ContractorBase(BaseSchema):
    name: str
    company_name: Optional[str] = None
    specialty: str
    skill_level: str = Field("mid", pattern="^(junior|mid|senior|expert)$")
    contact: Optional[dict] = {}
    rating: Optional[float] = Field(0, ge=0, le=5)
    notes: Optional[str] = None


class ContractorCreate(ContractorBase):
    pass


class ContractorUpdate(BaseSchema):
    name: Optional[str] = None
    company_name: Optional[str] = None
    specialty: Optional[str] = None
    skill_level: Optional[str] = None
    contact: Optional[dict] = None
    rating: Optional[float] = None
    notes: Optional[str] = None
    is_active: Optional[bool] = None


class ContractorResponse(ContractorBase):
    id: UUID
    total_projects: int
    reliability_score: float
    is_active: bool
    created_at: datetime
    updated_at: datetime


# ============================================
# Labor Rate Schemas
# ============================================

class LaborRateBase(BaseSchema):
    work_item_code: str
    rate_per_unit: float
    unit: str
    includes_material: bool = False
    region: str = "HCM"
    notes: Optional[str] = None
    source: Optional[str] = None


class LaborRateCreate(LaborRateBase):
    contractor_id: Optional[UUID] = None
    valid_from: Optional[date] = None
    valid_to: Optional[date] = None


class LaborRateUpdate(BaseSchema):
    rate_per_unit: Optional[float] = None
    includes_material: Optional[bool] = None
    region: Optional[str] = None
    valid_from: Optional[date] = None
    valid_to: Optional[date] = None
    notes: Optional[str] = None
    source: Optional[str] = None


class LaborRateResponse(LaborRateBase):
    id: UUID
    contractor_id: Optional[UUID]
    valid_from: date
    valid_to: Optional[date]
    created_at: datetime


class LaborRateWithContractor(LaborRateResponse):
    """Labor rate with contractor info"""
    contractor_name: Optional[str] = None
    contractor_rating: Optional[float] = None
    work_item_name: Optional[str] = None


# ============================================
# Project Schemas
# ============================================

class ProjectBase(BaseSchema):
    name: str
    code: Optional[str] = None
    client_name: Optional[str] = None
    client_contact: Optional[dict] = {}
    address: Optional[str] = None
    project_type: Optional[str] = None
    total_area: Optional[float] = None
    notes: Optional[str] = None


class ProjectCreate(ProjectBase):
    pass


class ProjectUpdate(BaseSchema):
    name: Optional[str] = None
    code: Optional[str] = None
    client_name: Optional[str] = None
    client_contact: Optional[dict] = None
    address: Optional[str] = None
    project_type: Optional[str] = None
    total_area: Optional[float] = None
    status: Optional[str] = None
    start_date: Optional[date] = None
    end_date: Optional[date] = None
    notes: Optional[str] = None


class ProjectResponse(ProjectBase):
    id: UUID
    status: str
    start_date: Optional[date]
    end_date: Optional[date]
    created_at: datetime
    updated_at: datetime


class ProjectSummary(ProjectResponse):
    """Project with BOQ summary"""
    total_items: int = 0
    total_material: Optional[float] = 0
    total_labor: Optional[float] = 0
    grand_total: Optional[float] = 0


# ============================================
# BOQ Item Schemas
# ============================================

class BOQItemBase(BaseSchema):
    work_item_code: Optional[str] = None
    custom_description: Optional[str] = None
    quantity: float
    unit: str
    notes: Optional[str] = None


class BOQItemCreate(BOQItemBase):
    project_id: UUID
    material_id: Optional[UUID] = None
    material_unit_price: Optional[float] = None
    contractor_id: Optional[UUID] = None
    labor_unit_price: Optional[float] = None
    markup_percent: float = 0


class BOQItemUpdate(BaseSchema):
    quantity: Optional[float] = None
    unit: Optional[str] = None
    material_id: Optional[UUID] = None
    material_unit_price: Optional[float] = None
    contractor_id: Optional[UUID] = None
    labor_unit_price: Optional[float] = None
    markup_percent: Optional[float] = None
    notes: Optional[str] = None


class BOQItemResponse(BOQItemBase):
    id: UUID
    project_id: UUID
    sort_order: int
    material_id: Optional[UUID]
    material_name: Optional[str]
    material_unit_price: Optional[float]
    material_quantity: Optional[float]
    material_total: Optional[float]
    contractor_id: Optional[UUID]
    contractor_name: Optional[str]
    labor_unit_price: Optional[float]
    labor_total: Optional[float]
    subtotal: Optional[float]
    markup_percent: float
    total: Optional[float]
    created_at: datetime


# ============================================
# AI/Chat Schemas
# ============================================

class ChatMessage(BaseSchema):
    """Chat message for AI Copilot"""
    role: str = Field(pattern="^(user|assistant|system)$")
    content: str


class CopilotRequest(BaseSchema):
    """Request to AI Copilot"""
    message: str
    context: Optional[dict] = {}  # Current Excel context
    history: Optional[List[ChatMessage]] = []


class CopilotResponse(BaseSchema):
    """Response from AI Copilot"""
    message: str
    suggestions: Optional[List[dict]] = []  # Work items, materials, rates
    calculations: Optional[dict] = {}  # Volume, area, etc.
    actions: Optional[List[dict]] = []  # Insert commands for Excel


# ============================================
# Search Schemas
# ============================================

class SearchRequest(BaseSchema):
    """Generic search request"""
    query: str
    category: Optional[str] = None
    limit: int = Field(20, ge=1, le=100)


class SearchResult(BaseSchema):
    """Generic search result"""
    type: str  # work_item, material, contractor
    id: UUID
    name: str
    code: Optional[str] = None
    metadata: Optional[dict] = {}
