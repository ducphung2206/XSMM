-- ============================================
-- XSMM Copilot - Extended Schema
-- Phase 1: Materials, Contractors, Pricing
-- ============================================

-- Enable UUID extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- 1. SUPPLIERS - Nhà cung cấp vật liệu
-- ============================================
CREATE TABLE IF NOT EXISTS suppliers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50) NOT NULL CHECK (type IN ('material', 'contractor', 'both')),
    contact JSONB DEFAULT '{}',
    -- Example: {"phone": "0901234567", "email": "abc@gmail.com", "address": "Q7, HCM"}
    rating DECIMAL(2,1) DEFAULT 0 CHECK (rating >= 0 AND rating <= 5),
    notes TEXT,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index for quick lookup
CREATE INDEX idx_suppliers_type ON suppliers(type);
CREATE INDEX idx_suppliers_active ON suppliers(is_active);

-- ============================================
-- 2. MATERIALS - Catalog vật liệu
-- ============================================
CREATE TABLE IF NOT EXISTS materials (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    category VARCHAR(100) NOT NULL,
    -- 'Gạch lát', 'Gạch ốp', 'Sơn', 'Xi măng', 'Thép', 'Gỗ', etc.
    subcategory VARCHAR(100),
    -- 'Gạch ceramic', 'Gạch porcelain', etc.
    brand VARCHAR(100),
    -- 'Vietceramic', 'Prime', 'Taicera', 'Dulux', etc.
    product_code VARCHAR(100),
    -- 'VC-6060A', 'PR-MATT-600'
    name VARCHAR(255) NOT NULL,
    -- 'Gạch lát men matt 600x600mm'
    specs JSONB DEFAULT '{}',
    -- {"size": "600x600", "thickness": "10mm", "finish": "matt", "color": "grey"}
    unit VARCHAR(30) NOT NULL,
    -- 'm2', 'viên', 'kg', 'lít', 'thùng', 'bộ'
    unit_conversion JSONB DEFAULT '{}',
    -- {"viên/m2": 2.78, "thùng/m2": 0.07}
    base_price DECIMAL(15,2),
    -- Giá niêm yết (chưa chiết khấu)
    supplier_id UUID REFERENCES suppliers(id),
    work_item_codes TEXT[],
    -- Array of XSMM codes this material applies to: ['9.1.3', '9.1.4']
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_materials_category ON materials(category);
CREATE INDEX idx_materials_brand ON materials(brand);
CREATE INDEX idx_materials_product_code ON materials(product_code);
CREATE INDEX idx_materials_active ON materials(is_active);

-- Full text search for materials
CREATE INDEX idx_materials_search ON materials 
USING gin(to_tsvector('simple', name || ' ' || COALESCE(brand, '') || ' ' || COALESCE(product_code, '')));

-- ============================================
-- 3. CONTRACTORS - Nhà thầu thi công
-- ============================================
CREATE TABLE IF NOT EXISTS contractors (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    company_name VARCHAR(255),
    specialty VARCHAR(100) NOT NULL,
    -- 'Xây thô', 'Nội thất', 'Điện', 'Nước', 'Sơn', 'Đa năng'
    skill_level VARCHAR(20) DEFAULT 'mid' CHECK (skill_level IN ('junior', 'mid', 'senior', 'expert')),
    contact JSONB DEFAULT '{}',
    -- {"phone": "...", "zalo": "...", "address": "..."}
    rating DECIMAL(2,1) DEFAULT 0 CHECK (rating >= 0 AND rating <= 5),
    total_projects INT DEFAULT 0,
    -- Số dự án đã hoàn thành
    reliability_score DECIMAL(3,2) DEFAULT 1.0,
    -- 0.0 - 1.0, track đúng hẹn
    notes TEXT,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_contractors_specialty ON contractors(specialty);
CREATE INDEX idx_contractors_skill ON contractors(skill_level);
CREATE INDEX idx_contractors_active ON contractors(is_active);

-- ============================================
-- 4. LABOR_RATES - Đơn giá nhân công
-- ============================================
CREATE TABLE IF NOT EXISTS labor_rates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    work_item_code VARCHAR(30) NOT NULL,
    -- FK logical to work_items.code
    contractor_id UUID REFERENCES contractors(id),
    rate_per_unit DECIMAL(15,2) NOT NULL,
    unit VARCHAR(30) NOT NULL,
    -- m2, m3, md, cái, bộ
    includes_material BOOLEAN DEFAULT false,
    -- true nếu giá đã bao gồm vật tư phụ (đinh, keo, vữa...)
    valid_from DATE DEFAULT CURRENT_DATE,
    valid_to DATE,
    region VARCHAR(50) DEFAULT 'HCM',
    -- 'HCM', 'Binh Duong', 'Dong Nai', 'Tinh'
    notes TEXT,
    source VARCHAR(100),
    -- 'Báo giá thầu Minh 01/2026', 'Dự án ABC'
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_labor_rates_work_item ON labor_rates(work_item_code);
CREATE INDEX idx_labor_rates_contractor ON labor_rates(contractor_id);
CREATE INDEX idx_labor_rates_region ON labor_rates(region);
CREATE INDEX idx_labor_rates_valid ON labor_rates(valid_from, valid_to);

-- ============================================
-- 5. MATERIAL_PRICES - Lịch sử giá vật liệu
-- ============================================
CREATE TABLE IF NOT EXISTS material_prices (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    material_id UUID REFERENCES materials(id) NOT NULL,
    price DECIMAL(15,2) NOT NULL,
    discount_percent DECIMAL(5,2) DEFAULT 0,
    final_price DECIMAL(15,2) NOT NULL,
    -- price * (1 - discount_percent/100)
    supplier_id UUID REFERENCES suppliers(id),
    valid_from DATE DEFAULT CURRENT_DATE,
    valid_to DATE,
    source VARCHAR(100),
    -- 'Báo giá NCC', 'Hóa đơn dự án X'
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index
CREATE INDEX idx_material_prices_material ON material_prices(material_id);
CREATE INDEX idx_material_prices_valid ON material_prices(valid_from, valid_to);

-- ============================================
-- 6. PROJECTS - Dự án
-- ============================================
CREATE TABLE IF NOT EXISTS projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(50) UNIQUE,
    -- 'PRJ-2026-001'
    name VARCHAR(255) NOT NULL,
    client_name VARCHAR(255),
    client_contact JSONB DEFAULT '{}',
    address TEXT,
    project_type VARCHAR(50),
    -- 'Biệt thự', 'Nhà phố', 'Chung cư', 'Văn phòng'
    total_area DECIMAL(10,2),
    -- m2
    status VARCHAR(20) DEFAULT 'draft' 
        CHECK (status IN ('draft', 'quoting', 'approved', 'active', 'completed', 'cancelled')),
    start_date DATE,
    end_date DATE,
    notes TEXT,
    created_by UUID,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_projects_status ON projects(status);
CREATE INDEX idx_projects_code ON projects(code);

-- ============================================
-- 7. PROJECT_BOQ_ITEMS - Chi tiết BOQ dự án
-- ============================================
CREATE TABLE IF NOT EXISTS project_boq_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE NOT NULL,
    sort_order INT DEFAULT 0,
    
    -- XSMM Reference
    work_item_code VARCHAR(30),
    -- FK logical to work_items.code
    custom_description TEXT,
    -- Mô tả tùy chỉnh nếu khác XSMM
    
    -- Khối lượng
    quantity DECIMAL(15,3) NOT NULL,
    unit VARCHAR(30) NOT NULL,
    
    -- Vật liệu đã chọn
    material_id UUID REFERENCES materials(id),
    material_name VARCHAR(255),
    -- Lưu snapshot tên VL
    material_unit_price DECIMAL(15,2),
    material_quantity DECIMAL(15,3),
    -- Có thể khác quantity (hao hụt)
    material_total DECIMAL(15,2),
    
    -- Nhân công
    contractor_id UUID REFERENCES contractors(id),
    contractor_name VARCHAR(255),
    labor_unit_price DECIMAL(15,2),
    labor_total DECIMAL(15,2),
    
    -- Tổng
    subtotal DECIMAL(15,2),
    -- material_total + labor_total
    markup_percent DECIMAL(5,2) DEFAULT 0,
    total DECIMAL(15,2),
    -- subtotal * (1 + markup_percent/100)
    
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_boq_project ON project_boq_items(project_id);
CREATE INDEX idx_boq_work_item ON project_boq_items(work_item_code);
CREATE INDEX idx_boq_sort ON project_boq_items(project_id, sort_order);

-- ============================================
-- 8. PRICE_HISTORY - Theo dõi biến động giá
-- ============================================
CREATE TABLE IF NOT EXISTS price_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(20) NOT NULL CHECK (entity_type IN ('material', 'labor')),
    entity_id UUID NOT NULL,
    -- material_id hoặc labor_rate_id
    old_price DECIMAL(15,2),
    new_price DECIMAL(15,2) NOT NULL,
    change_percent DECIMAL(5,2),
    reason TEXT,
    changed_by UUID,
    changed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index
CREATE INDEX idx_price_history_entity ON price_history(entity_type, entity_id);
CREATE INDEX idx_price_history_date ON price_history(changed_at);

-- ============================================
-- TRIGGERS: Auto-update updated_at
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_suppliers_updated_at
    BEFORE UPDATE ON suppliers
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER tr_materials_updated_at
    BEFORE UPDATE ON materials
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER tr_contractors_updated_at
    BEFORE UPDATE ON contractors
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER tr_labor_rates_updated_at
    BEFORE UPDATE ON labor_rates
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER tr_projects_updated_at
    BEFORE UPDATE ON projects
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER tr_boq_items_updated_at
    BEFORE UPDATE ON project_boq_items
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ============================================
-- VIEWS: Useful queries
-- ============================================

-- View: Materials with latest price
CREATE OR REPLACE VIEW v_materials_with_price AS
SELECT 
    m.*,
    mp.final_price as current_price,
    mp.valid_from as price_date,
    s.name as supplier_name
FROM materials m
LEFT JOIN LATERAL (
    SELECT * FROM material_prices 
    WHERE material_id = m.id 
    AND (valid_to IS NULL OR valid_to >= CURRENT_DATE)
    ORDER BY valid_from DESC 
    LIMIT 1
) mp ON true
LEFT JOIN suppliers s ON m.supplier_id = s.id
WHERE m.is_active = true;

-- View: Labor rates with contractor info
CREATE OR REPLACE VIEW v_labor_rates_full AS
SELECT 
    lr.*,
    c.name as contractor_name,
    c.specialty,
    c.skill_level,
    c.rating as contractor_rating,
    wi.name as work_item_name,
    wi.unit as work_item_unit
FROM labor_rates lr
LEFT JOIN contractors c ON lr.contractor_id = c.id
LEFT JOIN work_items wi ON lr.work_item_code = wi.code
WHERE (lr.valid_to IS NULL OR lr.valid_to >= CURRENT_DATE);

-- View: Project BOQ Summary
CREATE OR REPLACE VIEW v_project_summary AS
SELECT 
    p.id,
    p.code,
    p.name,
    p.status,
    COUNT(b.id) as total_items,
    SUM(b.material_total) as total_material,
    SUM(b.labor_total) as total_labor,
    SUM(b.total) as grand_total
FROM projects p
LEFT JOIN project_boq_items b ON p.id = b.project_id
GROUP BY p.id, p.code, p.name, p.status;

-- ============================================
-- RLS Policies (Row Level Security)
-- ============================================
ALTER TABLE suppliers ENABLE ROW LEVEL SECURITY;
ALTER TABLE materials ENABLE ROW LEVEL SECURITY;
ALTER TABLE contractors ENABLE ROW LEVEL SECURITY;
ALTER TABLE labor_rates ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE project_boq_items ENABLE ROW LEVEL SECURITY;

-- Allow read access to all authenticated users
CREATE POLICY "Allow read access" ON suppliers FOR SELECT USING (true);
CREATE POLICY "Allow read access" ON materials FOR SELECT USING (true);
CREATE POLICY "Allow read access" ON contractors FOR SELECT USING (true);
CREATE POLICY "Allow read access" ON labor_rates FOR SELECT USING (true);
CREATE POLICY "Allow read access" ON projects FOR SELECT USING (true);
CREATE POLICY "Allow read access" ON project_boq_items FOR SELECT USING (true);

-- ============================================
-- FUNCTIONS: Search helpers
-- ============================================

-- Search materials by keyword
CREATE OR REPLACE FUNCTION search_materials(keyword TEXT)
RETURNS SETOF v_materials_with_price AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM v_materials_with_price
    WHERE 
        name ILIKE '%' || keyword || '%'
        OR brand ILIKE '%' || keyword || '%'
        OR product_code ILIKE '%' || keyword || '%'
        OR category ILIKE '%' || keyword || '%'
    ORDER BY category, brand, name;
END;
$$ LANGUAGE plpgsql;

-- Get labor rates for a work item
CREATE OR REPLACE FUNCTION get_labor_rates(p_work_item_code TEXT, p_region TEXT DEFAULT 'HCM')
RETURNS SETOF v_labor_rates_full AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM v_labor_rates_full
    WHERE work_item_code = p_work_item_code
    AND region = p_region
    ORDER BY rate_per_unit;
END;
$$ LANGUAGE plpgsql;
