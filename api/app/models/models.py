"""
XSMM Copilot - Database Models
SQLAlchemy ORM models for all entities
"""
from datetime import datetime, date
from typing import Optional, List
from uuid import uuid4

from sqlalchemy import String, Text, Integer, Numeric, Boolean, Date, ForeignKey, ARRAY
from sqlalchemy.dialects.postgresql import UUID, JSONB
from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy.sql import func

from app.core.database import Base


# ============================================
# XSMM Core Tables (từ schema.sql)
# ============================================

class Category(Base):
    """Phân loại công việc - Cấp 1"""
    __tablename__ = "categories"
    
    id: Mapped[str] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    code: Mapped[str] = mapped_column(String(10), unique=True, nullable=False)
    name: Mapped[str] = mapped_column(String(255), nullable=False)
    description: Mapped[Optional[str]] = mapped_column(Text)
    sort_order: Mapped[int] = mapped_column(Integer, default=0)
    created_at: Mapped[datetime] = mapped_column(default=func.now())
    updated_at: Mapped[datetime] = mapped_column(default=func.now(), onupdate=func.now())
    
    # Relationships
    work_types: Mapped[List["WorkType"]] = relationship(back_populates="category")


class WorkType(Base):
    """Loại công việc - Cấp 2"""
    __tablename__ = "work_types"
    
    id: Mapped[str] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    category_id: Mapped[str] = mapped_column(UUID(as_uuid=True), ForeignKey("categories.id"))
    code: Mapped[str] = mapped_column(String(20), unique=True, nullable=False)
    name: Mapped[str] = mapped_column(String(255), nullable=False)
    description: Mapped[Optional[str]] = mapped_column(Text)
    sort_order: Mapped[int] = mapped_column(Integer, default=0)
    created_at: Mapped[datetime] = mapped_column(default=func.now())
    updated_at: Mapped[datetime] = mapped_column(default=func.now(), onupdate=func.now())
    
    # Relationships
    category: Mapped["Category"] = relationship(back_populates="work_types")
    work_items: Mapped[List["WorkItem"]] = relationship(back_populates="work_type")


class WorkItem(Base):
    """Công việc chi tiết - Cấp 3"""
    __tablename__ = "work_items"
    
    id: Mapped[str] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    work_type_id: Mapped[str] = mapped_column(UUID(as_uuid=True), ForeignKey("work_types.id"))
    code: Mapped[str] = mapped_column(String(30), unique=True, nullable=False)
    name: Mapped[str] = mapped_column(String(255), nullable=False)
    unit: Mapped[str] = mapped_column(String(30), nullable=False)
    description: Mapped[Optional[str]] = mapped_column(Text)
    measurement_method: Mapped[Optional[str]] = mapped_column(Text)
    formula: Mapped[Optional[str]] = mapped_column(Text)
    notes: Mapped[Optional[str]] = mapped_column(Text)
    metadata_: Mapped[Optional[dict]] = mapped_column("metadata", JSONB, default={})
    sort_order: Mapped[int] = mapped_column(Integer, default=0)
    created_at: Mapped[datetime] = mapped_column(default=func.now())
    updated_at: Mapped[datetime] = mapped_column(default=func.now(), onupdate=func.now())
    
    # Relationships
    work_type: Mapped["WorkType"] = relationship(back_populates="work_items")
    labor_rates: Mapped[List["LaborRate"]] = relationship(back_populates="work_item")


# ============================================
# Copilot Extended Tables
# ============================================

class Supplier(Base):
    """Nhà cung cấp vật liệu"""
    __tablename__ = "suppliers"
    
    id: Mapped[str] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    name: Mapped[str] = mapped_column(String(255), nullable=False)
    type: Mapped[str] = mapped_column(String(50), nullable=False)  # material, contractor, both
    contact: Mapped[Optional[dict]] = mapped_column(JSONB, default={})
    rating: Mapped[Optional[float]] = mapped_column(Numeric(2, 1), default=0)
    notes: Mapped[Optional[str]] = mapped_column(Text)
    is_active: Mapped[bool] = mapped_column(Boolean, default=True)
    created_at: Mapped[datetime] = mapped_column(default=func.now())
    updated_at: Mapped[datetime] = mapped_column(default=func.now(), onupdate=func.now())
    
    # Relationships
    materials: Mapped[List["Material"]] = relationship(back_populates="supplier")


class Material(Base):
    """Catalog vật liệu"""
    __tablename__ = "materials"
    
    id: Mapped[str] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    category: Mapped[str] = mapped_column(String(100), nullable=False)
    subcategory: Mapped[Optional[str]] = mapped_column(String(100))
    brand: Mapped[Optional[str]] = mapped_column(String(100))
    product_code: Mapped[Optional[str]] = mapped_column(String(100))
    name: Mapped[str] = mapped_column(String(255), nullable=False)
    specs: Mapped[Optional[dict]] = mapped_column(JSONB, default={})
    unit: Mapped[str] = mapped_column(String(30), nullable=False)
    unit_conversion: Mapped[Optional[dict]] = mapped_column(JSONB, default={})
    base_price: Mapped[Optional[float]] = mapped_column(Numeric(15, 2))
    supplier_id: Mapped[Optional[str]] = mapped_column(UUID(as_uuid=True), ForeignKey("suppliers.id"))
    work_item_codes: Mapped[Optional[list]] = mapped_column(ARRAY(Text))
    is_active: Mapped[bool] = mapped_column(Boolean, default=True)
    created_at: Mapped[datetime] = mapped_column(default=func.now())
    updated_at: Mapped[datetime] = mapped_column(default=func.now(), onupdate=func.now())
    
    # Relationships
    supplier: Mapped[Optional["Supplier"]] = relationship(back_populates="materials")
    prices: Mapped[List["MaterialPrice"]] = relationship(back_populates="material")


class MaterialPrice(Base):
    """Lịch sử giá vật liệu"""
    __tablename__ = "material_prices"
    
    id: Mapped[str] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    material_id: Mapped[str] = mapped_column(UUID(as_uuid=True), ForeignKey("materials.id"), nullable=False)
    price: Mapped[float] = mapped_column(Numeric(15, 2), nullable=False)
    discount_percent: Mapped[float] = mapped_column(Numeric(5, 2), default=0)
    final_price: Mapped[float] = mapped_column(Numeric(15, 2), nullable=False)
    supplier_id: Mapped[Optional[str]] = mapped_column(UUID(as_uuid=True), ForeignKey("suppliers.id"))
    valid_from: Mapped[date] = mapped_column(Date, default=func.current_date())
    valid_to: Mapped[Optional[date]] = mapped_column(Date)
    source: Mapped[Optional[str]] = mapped_column(String(100))
    notes: Mapped[Optional[str]] = mapped_column(Text)
    created_at: Mapped[datetime] = mapped_column(default=func.now())
    
    # Relationships
    material: Mapped["Material"] = relationship(back_populates="prices")


class Contractor(Base):
    """Nhà thầu thi công"""
    __tablename__ = "contractors"
    
    id: Mapped[str] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    name: Mapped[str] = mapped_column(String(255), nullable=False)
    company_name: Mapped[Optional[str]] = mapped_column(String(255))
    specialty: Mapped[str] = mapped_column(String(100), nullable=False)
    skill_level: Mapped[str] = mapped_column(String(20), default="mid")
    contact: Mapped[Optional[dict]] = mapped_column(JSONB, default={})
    rating: Mapped[Optional[float]] = mapped_column(Numeric(2, 1), default=0)
    total_projects: Mapped[int] = mapped_column(Integer, default=0)
    reliability_score: Mapped[float] = mapped_column(Numeric(3, 2), default=1.0)
    notes: Mapped[Optional[str]] = mapped_column(Text)
    is_active: Mapped[bool] = mapped_column(Boolean, default=True)
    created_at: Mapped[datetime] = mapped_column(default=func.now())
    updated_at: Mapped[datetime] = mapped_column(default=func.now(), onupdate=func.now())
    
    # Relationships
    labor_rates: Mapped[List["LaborRate"]] = relationship(back_populates="contractor")


class LaborRate(Base):
    """Đơn giá nhân công"""
    __tablename__ = "labor_rates"
    
    id: Mapped[str] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    work_item_code: Mapped[str] = mapped_column(String(30), ForeignKey("work_items.code"), nullable=False)
    contractor_id: Mapped[Optional[str]] = mapped_column(UUID(as_uuid=True), ForeignKey("contractors.id"))
    rate_per_unit: Mapped[float] = mapped_column(Numeric(15, 2), nullable=False)
    unit: Mapped[str] = mapped_column(String(30), nullable=False)
    includes_material: Mapped[bool] = mapped_column(Boolean, default=False)
    valid_from: Mapped[date] = mapped_column(Date, default=func.current_date())
    valid_to: Mapped[Optional[date]] = mapped_column(Date)
    region: Mapped[str] = mapped_column(String(50), default="HCM")
    notes: Mapped[Optional[str]] = mapped_column(Text)
    source: Mapped[Optional[str]] = mapped_column(String(100))
    created_at: Mapped[datetime] = mapped_column(default=func.now())
    updated_at: Mapped[datetime] = mapped_column(default=func.now(), onupdate=func.now())
    
    # Relationships
    work_item: Mapped["WorkItem"] = relationship(back_populates="labor_rates")
    contractor: Mapped[Optional["Contractor"]] = relationship(back_populates="labor_rates")


class Project(Base):
    """Dự án"""
    __tablename__ = "projects"
    
    id: Mapped[str] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    code: Mapped[Optional[str]] = mapped_column(String(50), unique=True)
    name: Mapped[str] = mapped_column(String(255), nullable=False)
    client_name: Mapped[Optional[str]] = mapped_column(String(255))
    client_contact: Mapped[Optional[dict]] = mapped_column(JSONB, default={})
    address: Mapped[Optional[str]] = mapped_column(Text)
    project_type: Mapped[Optional[str]] = mapped_column(String(50))
    total_area: Mapped[Optional[float]] = mapped_column(Numeric(10, 2))
    status: Mapped[str] = mapped_column(String(20), default="draft")
    start_date: Mapped[Optional[date]] = mapped_column(Date)
    end_date: Mapped[Optional[date]] = mapped_column(Date)
    notes: Mapped[Optional[str]] = mapped_column(Text)
    created_by: Mapped[Optional[str]] = mapped_column(UUID(as_uuid=True))
    created_at: Mapped[datetime] = mapped_column(default=func.now())
    updated_at: Mapped[datetime] = mapped_column(default=func.now(), onupdate=func.now())
    
    # Relationships
    boq_items: Mapped[List["ProjectBOQItem"]] = relationship(back_populates="project")


class ProjectBOQItem(Base):
    """Chi tiết BOQ theo dự án"""
    __tablename__ = "project_boq_items"
    
    id: Mapped[str] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    project_id: Mapped[str] = mapped_column(UUID(as_uuid=True), ForeignKey("projects.id", ondelete="CASCADE"), nullable=False)
    sort_order: Mapped[int] = mapped_column(Integer, default=0)
    
    # XSMM Reference
    work_item_code: Mapped[Optional[str]] = mapped_column(String(30), ForeignKey("work_items.code"))
    custom_description: Mapped[Optional[str]] = mapped_column(Text)
    
    # Khối lượng
    quantity: Mapped[float] = mapped_column(Numeric(15, 3), nullable=False)
    unit: Mapped[str] = mapped_column(String(30), nullable=False)
    
    # Vật liệu
    material_id: Mapped[Optional[str]] = mapped_column(UUID(as_uuid=True), ForeignKey("materials.id"))
    material_name: Mapped[Optional[str]] = mapped_column(String(255))
    material_unit_price: Mapped[Optional[float]] = mapped_column(Numeric(15, 2))
    material_quantity: Mapped[Optional[float]] = mapped_column(Numeric(15, 3))
    material_total: Mapped[Optional[float]] = mapped_column(Numeric(15, 2))
    
    # Nhân công
    contractor_id: Mapped[Optional[str]] = mapped_column(UUID(as_uuid=True), ForeignKey("contractors.id"))
    contractor_name: Mapped[Optional[str]] = mapped_column(String(255))
    labor_unit_price: Mapped[Optional[float]] = mapped_column(Numeric(15, 2))
    labor_total: Mapped[Optional[float]] = mapped_column(Numeric(15, 2))
    
    # Tổng
    subtotal: Mapped[Optional[float]] = mapped_column(Numeric(15, 2))
    markup_percent: Mapped[float] = mapped_column(Numeric(5, 2), default=0)
    total: Mapped[Optional[float]] = mapped_column(Numeric(15, 2))
    
    notes: Mapped[Optional[str]] = mapped_column(Text)
    created_at: Mapped[datetime] = mapped_column(default=func.now())
    updated_at: Mapped[datetime] = mapped_column(default=func.now(), onupdate=func.now())
    
    # Relationships
    project: Mapped["Project"] = relationship(back_populates="boq_items")
