-- ============================================
-- XSMM Copilot - Sample Data
-- Demo data cho testing
-- ============================================

-- ============================================
-- SUPPLIERS
-- ============================================
INSERT INTO suppliers (id, name, type, contact, rating, notes) VALUES
('11111111-1111-1111-1111-111111111101', 'Công ty TNHH Minh Phát', 'material', 
 '{"phone": "0901234567", "email": "minhphat@gmail.com", "address": "Q7, HCM"}', 
 4.5, 'NCC gạch ốp lát, giá tốt'),

('11111111-1111-1111-1111-111111111102', 'Showroom Vật liệu Q10', 'material',
 '{"phone": "0909876543", "address": "123 CMT8, Q10, HCM"}',
 4.0, 'Showroom lớn, đa dạng sản phẩm'),

('11111111-1111-1111-1111-111111111103', 'NCC Đồng Tâm', 'material',
 '{"phone": "0283123456", "website": "dongtam.com.vn"}',
 4.2, 'Nhà máy trực tiếp'),

('11111111-1111-1111-1111-111111111104', 'Đại lý Sơn Dulux Tân Bình', 'material',
 '{"phone": "0908112233", "address": "456 Cộng Hòa, Tân Bình"}',
 4.3, 'Đại lý cấp 1 Dulux');

-- ============================================
-- MATERIALS - Gạch lát
-- ============================================
INSERT INTO materials (id, category, subcategory, brand, product_code, name, specs, unit, base_price, supplier_id, work_item_codes) VALUES
-- Gạch Ceramic
('22222222-2222-2222-2222-222222222201', 'Gạch lát', 'Ceramic', 'Vietceramic', 'VC-6060-MATT',
 'Gạch lát Vietceramic 600x600 matt', 
 '{"size": "600x600", "thickness": "10mm", "finish": "matt", "color": "grey"}',
 'm2', 185000, '11111111-1111-1111-1111-111111111101', ARRAY['9.1.3']),

('22222222-2222-2222-2222-222222222202', 'Gạch lát', 'Ceramic', 'Prime', 'PR-6060-POLISH',
 'Gạch lát Prime 600x600 bóng kính',
 '{"size": "600x600", "thickness": "10mm", "finish": "polished"}',
 'm2', 220000, '11111111-1111-1111-1111-111111111102', ARRAY['9.1.3', '9.2.1']),

('22222222-2222-2222-2222-222222222203', 'Gạch lát', 'Porcelain', 'Taicera', 'TC-6060-STONE',
 'Gạch lát Taicera 600x600 vân đá',
 '{"size": "600x600", "thickness": "11mm", "finish": "matt", "pattern": "stone"}',
 'm2', 350000, '11111111-1111-1111-1111-111111111102', ARRAY['9.1.3', '9.2.1']),

('22222222-2222-2222-2222-222222222204', 'Gạch lát', 'Ceramic', 'Đồng Tâm', 'DT-6060-BASIC',
 'Gạch lát Đồng Tâm 600x600 cơ bản',
 '{"size": "600x600", "thickness": "9mm", "finish": "matt"}',
 'm2', 165000, '11111111-1111-1111-1111-111111111103', ARRAY['9.1.3']),

-- Gạch ốp tường
('22222222-2222-2222-2222-222222222205', 'Gạch ốp', 'Ceramic', 'Vietceramic', 'VC-3060-WALL',
 'Gạch ốp Vietceramic 300x600 tường',
 '{"size": "300x600", "thickness": "8mm", "finish": "glossy"}',
 'm2', 175000, '11111111-1111-1111-1111-111111111101', ARRAY['10.1.3']),

('22222222-2222-2222-2222-222222222206', 'Gạch ốp', 'Ceramic', 'Prime', 'PR-3060-WC',
 'Gạch ốp Prime 300x600 WC',
 '{"size": "300x600", "thickness": "8mm", "finish": "glossy", "for": "bathroom"}',
 'm2', 195000, '11111111-1111-1111-1111-111111111102', ARRAY['10.1.3']);

-- ============================================
-- MATERIALS - Sơn
-- ============================================
INSERT INTO materials (id, category, subcategory, brand, product_code, name, specs, unit, base_price, supplier_id, work_item_codes) VALUES
('22222222-2222-2222-2222-222222222301', 'Sơn', 'Nội thất', 'Dulux', 'DULUX-INSPIRE-5L',
 'Sơn Dulux Inspire nội thất 5 lít',
 '{"volume": "5L", "coverage": "12m2/L/coat", "type": "interior"}',
 'thùng', 850000, '11111111-1111-1111-1111-111111111104', ARRAY['11.1.2', '11.1.3']),

('22222222-2222-2222-2222-222222222302', 'Sơn', 'Ngoại thất', 'Dulux', 'DULUX-WEATHERSHIELD-5L',
 'Sơn Dulux Weathershield ngoại thất 5 lít',
 '{"volume": "5L", "coverage": "10m2/L/coat", "type": "exterior"}',
 'thùng', 1200000, '11111111-1111-1111-1111-111111111104', ARRAY['11.2.2', '11.2.3']),

('22222222-2222-2222-2222-222222222303', 'Sơn', 'Nội thất', 'Nippon', 'NIPPON-ODORLESS-5L',
 'Sơn Nippon Odor-less nội thất 5 lít',
 '{"volume": "5L", "coverage": "11m2/L/coat", "type": "interior", "feature": "low-odor"}',
 'thùng', 780000, '11111111-1111-1111-1111-111111111104', ARRAY['11.1.2', '11.1.3']);

-- ============================================
-- CONTRACTORS
-- ============================================
INSERT INTO contractors (id, name, company_name, specialty, skill_level, contact, rating, total_projects, reliability_score, notes) VALUES
('33333333-3333-3333-3333-333333333301', 'Thầu Minh', 'Đội xây dựng Minh Tâm', 
 'Nội thất', 'senior',
 '{"phone": "0912345678", "zalo": "0912345678"}',
 4.5, 35, 0.95, 'Chuyên nội thất cao cấp, làm việc cẩn thận'),

('33333333-3333-3333-3333-333333333302', 'Thầu Hùng', NULL,
 'Đa năng', 'mid',
 '{"phone": "0923456789"}',
 3.8, 50, 0.80, 'Giá tốt, đôi khi trễ deadline'),

('33333333-3333-3333-3333-333333333303', 'Thầu Bình', 'Cty TNHH XD Bình An',
 'Xây thô', 'senior',
 '{"phone": "0934567890", "email": "thaubinhxd@gmail.com"}',
 4.3, 42, 0.90, 'Mạnh về phần thô, móng, bê tông'),

('33333333-3333-3333-3333-333333333304', 'Đội thợ điện Phát', NULL,
 'Điện', 'senior',
 '{"phone": "0945678901"}',
 4.6, 60, 0.98, 'Chuyên điện dân dụng, rất đúng hẹn'),

('33333333-3333-3333-3333-333333333305', 'Thợ sơn Tuấn', NULL,
 'Sơn', 'mid',
 '{"phone": "0956789012"}',
 4.0, 28, 0.85, 'Sơn đẹp, giá hợp lý');

-- ============================================
-- LABOR_RATES
-- ============================================
INSERT INTO labor_rates (id, work_item_code, contractor_id, rate_per_unit, unit, includes_material, region, source, notes) VALUES
-- Lát gạch 600x600
('44444444-4444-4444-4444-444444444401', '9.1.3', '33333333-3333-3333-3333-333333333301',
 80000, 'm2', false, 'HCM', 'Báo giá T01/2026', 'Bao gồm keo dán, ron'),
('44444444-4444-4444-4444-444444444402', '9.1.3', '33333333-3333-3333-3333-333333333302',
 65000, 'm2', false, 'HCM', 'Báo giá T01/2026', NULL),
 
-- Ốp gạch tường
('44444444-4444-4444-4444-444444444403', '10.1.3', '33333333-3333-3333-3333-333333333301',
 90000, 'm2', false, 'HCM', 'Báo giá T01/2026', NULL),
('44444444-4444-4444-4444-444444444404', '10.1.3', '33333333-3333-3333-3333-333333333302',
 75000, 'm2', false, 'HCM', 'Báo giá T01/2026', NULL),

-- Sơn nội thất
('44444444-4444-4444-4444-444444444405', '11.1.2', '33333333-3333-3333-3333-333333333305',
 25000, 'm2', false, 'HCM', 'Dự án Villa Q7', 'Sơn 2 lớp phủ'),
('44444444-4444-4444-4444-444444444406', '11.1.3', '33333333-3333-3333-3333-333333333305',
 32000, 'm2', false, 'HCM', 'Dự án Villa Q7', 'Sơn 3 lớp cao cấp'),

-- Bê tông móng băng
('44444444-4444-4444-4444-444444444407', '4.2.3', '33333333-3333-3333-3333-333333333303',
 150000, 'm3', true, 'HCM', 'Dự án NP Q9', 'Bao gồm cốt thép cơ bản'),

-- Xây tường 200mm
('44444444-4444-4444-4444-444444444408', '7.2.2', '33333333-3333-3333-3333-333333333303',
 180000, 'm2', true, 'HCM', 'Dự án NP Q9', 'Bao vữa xây'),
('44444444-4444-4444-4444-444444444409', '7.2.2', '33333333-3333-3333-3333-333333333302',
 150000, 'm2', true, 'HCM', 'Báo giá T12/2025', NULL),

-- Điện
('44444444-4444-4444-4444-444444444410', '17.3.1', '33333333-3333-3333-3333-333333333304',
 150000, 'bộ', false, 'HCM', 'Báo giá T01/2026', 'Đèn LED âm trần'),
('44444444-4444-4444-4444-444444444411', '17.4.1', '33333333-3333-3333-3333-333333333304',
 80000, 'cái', false, 'HCM', 'Báo giá T01/2026', 'Ổ cắm đơn');

-- ============================================
-- PROJECTS (Sample)
-- ============================================
INSERT INTO projects (id, code, name, client_name, address, project_type, total_area, status) VALUES
('55555555-5555-5555-5555-555555555501', 'PRJ-2025-042', 'Villa Thảo Điền', 
 'Anh Minh', '123 Thảo Điền, Q2, HCM', 'Biệt thự', 450, 'completed'),
 
('55555555-5555-5555-5555-555555555502', 'PRJ-2025-051', 'Nhà phố Q9',
 'Chị Hương', '456 Lê Văn Việt, Q9, HCM', 'Nhà phố', 180, 'active'),

('55555555-5555-5555-5555-555555555503', 'PRJ-2026-001', 'Căn hộ Masteri',
 'Anh Tùng', 'Căn A15.02 Masteri Thảo Điền', 'Chung cư', 85, 'quoting');

-- ============================================
-- MATERIAL_PRICES (Current prices)
-- ============================================
INSERT INTO material_prices (material_id, price, discount_percent, final_price, supplier_id, source) VALUES
('22222222-2222-2222-2222-222222222201', 185000, 5, 175750, '11111111-1111-1111-1111-111111111101', 'Báo giá T01/2026'),
('22222222-2222-2222-2222-222222222202', 220000, 3, 213400, '11111111-1111-1111-1111-111111111102', 'Showroom Q10'),
('22222222-2222-2222-2222-222222222203', 350000, 0, 350000, '11111111-1111-1111-1111-111111111102', 'Showroom Q10'),
('22222222-2222-2222-2222-222222222204', 165000, 8, 151800, '11111111-1111-1111-1111-111111111103', 'Đại lý Đồng Tâm'),
('22222222-2222-2222-2222-222222222301', 850000, 5, 807500, '11111111-1111-1111-1111-111111111104', 'Đại lý Dulux'),
('22222222-2222-2222-2222-222222222302', 1200000, 5, 1140000, '11111111-1111-1111-1111-111111111104', 'Đại lý Dulux'),
('22222222-2222-2222-2222-222222222303', 780000, 3, 756600, '11111111-1111-1111-1111-111111111104', 'Đại lý Dulux');
