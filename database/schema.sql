-- ============================================
-- XSMM Database Schema for Supabase (PostgreSQL)
-- Chuẩn hóa phương pháp bóc khối lượng - Xhome SG
-- ============================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- TABLE: categories (Cấp 1)
-- ============================================
CREATE TABLE IF NOT EXISTS categories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    sort_order INTEGER,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for faster lookups
CREATE INDEX idx_categories_code ON categories(code);

-- ============================================
-- TABLE: work_types (Cấp 2)
-- ============================================
CREATE TABLE IF NOT EXISTS work_types (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    code VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    sort_order INTEGER,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for faster lookups
CREATE INDEX idx_work_types_code ON work_types(code);
CREATE INDEX idx_work_types_category ON work_types(category_id);

-- ============================================
-- TABLE: work_items (Cấp 3 - Chi tiết nhất)
-- ============================================
CREATE TABLE IF NOT EXISTS work_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    work_type_id UUID NOT NULL REFERENCES work_types(id) ON DELETE CASCADE,
    code VARCHAR(30) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    description TEXT,
    measurement_method TEXT,
    formula TEXT,
    inclusion_rules JSONB DEFAULT '[]'::jsonb,
    exclusion_rules JSONB DEFAULT '[]'::jsonb,
    metadata JSONB DEFAULT '{}'::jsonb,
    sort_order INTEGER,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Indexes for faster lookups
CREATE INDEX idx_work_items_code ON work_items(code);
CREATE INDEX idx_work_items_work_type ON work_items(work_type_id);
CREATE INDEX idx_work_items_unit ON work_items(unit);

-- Full-text search index
CREATE INDEX idx_work_items_search ON work_items 
    USING GIN (to_tsvector('simple', name || ' ' || COALESCE(description, '')));

-- ============================================
-- TABLE: tags (Optional - for filtering)
-- ============================================
CREATE TABLE IF NOT EXISTS tags (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Junction table for work_items <-> tags
CREATE TABLE IF NOT EXISTS work_item_tags (
    work_item_id UUID REFERENCES work_items(id) ON DELETE CASCADE,
    tag_id UUID REFERENCES tags(id) ON DELETE CASCADE,
    PRIMARY KEY (work_item_id, tag_id)
);

-- ============================================
-- VIEWS: Hierarchical View
-- ============================================
CREATE OR REPLACE VIEW v_work_items_full AS
SELECT 
    wi.id,
    wi.code AS work_item_code,
    wi.name AS work_item_name,
    wi.unit,
    wi.description,
    wi.measurement_method,
    wi.formula,
    wi.inclusion_rules,
    wi.exclusion_rules,
    wt.code AS work_type_code,
    wt.name AS work_type_name,
    c.code AS category_code,
    c.name AS category_name
FROM work_items wi
JOIN work_types wt ON wi.work_type_id = wt.id
JOIN categories c ON wt.category_id = c.id
ORDER BY c.sort_order, wt.sort_order, wi.sort_order;

-- ============================================
-- FUNCTIONS: Search work items
-- ============================================
CREATE OR REPLACE FUNCTION search_work_items(search_query TEXT)
RETURNS TABLE (
    id UUID,
    code VARCHAR(30),
    name VARCHAR(255),
    unit VARCHAR(20),
    category_name VARCHAR(255),
    work_type_name VARCHAR(255)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        wi.id,
        wi.code,
        wi.name,
        wi.unit,
        c.name AS category_name,
        wt.name AS work_type_name
    FROM work_items wi
    JOIN work_types wt ON wi.work_type_id = wt.id
    JOIN categories c ON wt.category_id = c.id
    WHERE 
        wi.name ILIKE '%' || search_query || '%'
        OR wi.description ILIKE '%' || search_query || '%'
        OR wi.code ILIKE '%' || search_query || '%'
    ORDER BY 
        CASE WHEN wi.name ILIKE search_query || '%' THEN 0 ELSE 1 END,
        c.sort_order, wt.sort_order, wi.sort_order;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- RLS (Row Level Security) - Optional
-- ============================================
-- Enable RLS
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE work_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE work_items ENABLE ROW LEVEL SECURITY;

-- Policy: Allow read for everyone
CREATE POLICY "Allow read access" ON categories FOR SELECT USING (true);
CREATE POLICY "Allow read access" ON work_types FOR SELECT USING (true);
CREATE POLICY "Allow read access" ON work_items FOR SELECT USING (true);

-- ============================================
-- TRIGGER: Auto-update updated_at
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_categories_updated_at
    BEFORE UPDATE ON categories
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER trigger_work_types_updated_at
    BEFORE UPDATE ON work_types
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER trigger_work_items_updated_at
    BEFORE UPDATE ON work_items
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();
