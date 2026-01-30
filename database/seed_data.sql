-- XSMM Data Import Script
-- Generated from xsmm-complete.json

BEGIN;

-- ============================================
-- INSERT CATEGORIES
-- ============================================
INSERT INTO categories (code, name, description, sort_order)
VALUES ('1', 'Công tác chuẩn bị', 'Các công việc chuẩn bị mặt bằng, phá dỡ công trình cũ trước khi thi công', 1)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('2', 'Công tác đất', 'Đào, đắp, vận chuyển đất phục vụ thi công móng và nền', 2)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('3', 'Thi công cọc', 'Đóng, ép các loại cọc gia cố nền móng', 3)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('4', 'Công tác bê tông', 'Đổ bê tông các kết cấu móng, cột, dầm, sàn, cầu thang', 4)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('5', 'Công tác cốt thép', 'Gia công, lắp đặt cốt thép cho các kết cấu bê tông', 5)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('6', 'Công tác ván khuôn', 'Lắp dựng, tháo dỡ ván khuôn để đổ bê tông', 6)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('7', 'Công tác xây', 'Xây tường, trụ, bồn hoa bằng các loại gạch', 7)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('8', 'Công tác trát', 'Trát tường, trần, cột, dầm bằng vữa xi măng', 8)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('9', 'Công tác lát nền', 'Lát gạch, đá, sàn gỗ các loại cho sàn nhà', 9)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('10', 'Công tác ốp tường', 'Ốp gạch, đá, gỗ các loại cho tường', 10)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('11', 'Công tác sơn', 'Sơn tường, sơn gỗ, sơn sắt các loại', 11)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('12', 'Công tác chống thấm', 'Chống thấm sàn mái, WC, tầng hầm, bể nước', 12)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('13', 'Công tác mái', 'Lợp mái tôn, ngói, kính và khung xà gồ', 13)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('14', 'Công tác cửa', 'Lắp đặt cửa đi, cửa sổ các loại vật liệu', 14)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('15', 'Công tác lan can, cầu thang', 'Lắp đặt lan can, tay vịn, ốp bậc cầu thang', 15)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('16', 'Công tác trần', 'Lắp đặt trần thạch cao, trần nhựa, trần gỗ', 16)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('17', 'Điện dân dụng', 'Lắp đặt hệ thống điện cho nhà ở', 17)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('18', 'Cấp thoát nước', 'Lắp đặt hệ thống ống cấp, thoát nước', 18)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('19', 'Thiết bị vệ sinh', 'Lắp đặt thiết bị vệ sinh phòng tắm, WC', 19)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('20', 'Nội thất gỗ', 'Sản xuất, lắp đặt nội thất gỗ', 20)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('21', 'Điều hòa không khí', 'Lắp đặt hệ thống điều hòa không khí', 21)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('22', 'An ninh, thông minh', 'Lắp đặt hệ thống camera, khóa thông minh, smart home', 22)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO categories (code, name, description, sort_order)
VALUES ('23', 'Sân vườn, cảnh quan', 'Thi công sân vườn, hàng rào, cây xanh, tiểu cảnh', 23)
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;

-- ============================================
-- INSERT WORK TYPES
-- ============================================
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '1.1', 'Phá dỡ công trình cũ', 'Tháo dỡ, phá bỏ các kết cấu cũ để chuẩn bị mặt bằng thi công', 1
FROM categories c WHERE c.code = '1'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '1.2', 'Dọn dẹp mặt bằng', 'Thu dọn, san lấp, vận chuyển phế thải', 2
FROM categories c WHERE c.code = '1'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '1.3', 'Công tác tạm', 'Lắp đặt các công trình tạm phục vụ thi công', 3
FROM categories c WHERE c.code = '1'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '2.1', 'Đào đất', '', 1
FROM categories c WHERE c.code = '2'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '2.2', 'Đắp đất', '', 2
FROM categories c WHERE c.code = '2'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '2.3', 'Vận chuyển đất', '', 3
FROM categories c WHERE c.code = '2'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '3.1', 'Cọc tre', '', 1
FROM categories c WHERE c.code = '3'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '3.2', 'Cọc cừ tràm', '', 2
FROM categories c WHERE c.code = '3'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '3.3', 'Cọc bê tông cốt thép', '', 3
FROM categories c WHERE c.code = '3'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '3.4', 'Cọc khoan nhồi', '', 4
FROM categories c WHERE c.code = '3'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '4.1', 'Bê tông lót', '', 1
FROM categories c WHERE c.code = '4'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '4.2', 'Bê tông móng', '', 2
FROM categories c WHERE c.code = '4'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '4.3', 'Bê tông cột', '', 3
FROM categories c WHERE c.code = '4'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '4.4', 'Bê tông dầm', '', 4
FROM categories c WHERE c.code = '4'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '4.5', 'Bê tông sàn', '', 5
FROM categories c WHERE c.code = '4'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '4.6', 'Bê tông cầu thang', '', 6
FROM categories c WHERE c.code = '4'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '4.7', 'Bê tông tường', '', 7
FROM categories c WHERE c.code = '4'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '4.8', 'Bê tông bể', '', 8
FROM categories c WHERE c.code = '4'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '5.1', 'Thép móng', '', 1
FROM categories c WHERE c.code = '5'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '5.2', 'Thép cột', '', 2
FROM categories c WHERE c.code = '5'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '5.3', 'Thép dầm, sàn', '', 3
FROM categories c WHERE c.code = '5'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '5.4', 'Thép cầu thang', '', 4
FROM categories c WHERE c.code = '5'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '5.5', 'Lưới thép hàn', '', 5
FROM categories c WHERE c.code = '5'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '6.1', 'Ván khuôn móng', '', 1
FROM categories c WHERE c.code = '6'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '6.2', 'Ván khuôn cột', '', 2
FROM categories c WHERE c.code = '6'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '6.3', 'Ván khuôn dầm, sàn', '', 3
FROM categories c WHERE c.code = '6'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '6.4', 'Ván khuôn cầu thang', '', 4
FROM categories c WHERE c.code = '6'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '6.5', 'Ván khuôn tường', '', 5
FROM categories c WHERE c.code = '6'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '7.1', 'Xây móng', '', 1
FROM categories c WHERE c.code = '7'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '7.2', 'Xây tường', '', 2
FROM categories c WHERE c.code = '7'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '7.3', 'Xây trụ, bồn hoa', '', 3
FROM categories c WHERE c.code = '7'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '7.4', 'Xây bậc thang', '', 4
FROM categories c WHERE c.code = '7'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '8.1', 'Trát tường', '', 1
FROM categories c WHERE c.code = '8'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '8.2', 'Trát trần', '', 2
FROM categories c WHERE c.code = '8'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '8.3', 'Trát cột, dầm', '', 3
FROM categories c WHERE c.code = '8'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '8.4', 'Trát gờ, phào', '', 4
FROM categories c WHERE c.code = '8'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '8.5', 'Trát granitô', '', 5
FROM categories c WHERE c.code = '8'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '9.1', 'Lát gạch ceramic', '', 1
FROM categories c WHERE c.code = '9'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '9.2', 'Lát gạch porcelain', '', 2
FROM categories c WHERE c.code = '9'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '9.3', 'Lát gạch granite', '', 3
FROM categories c WHERE c.code = '9'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '9.4', 'Lát sàn gỗ', '', 4
FROM categories c WHERE c.code = '9'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '9.5', 'Lát gạch terrazzo', '', 5
FROM categories c WHERE c.code = '9'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '9.6', 'Lát đá tự nhiên', '', 6
FROM categories c WHERE c.code = '9'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '10.1', 'Ốp gạch men', '', 1
FROM categories c WHERE c.code = '10'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '10.2', 'Ốp đá tự nhiên', '', 2
FROM categories c WHERE c.code = '10'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '10.3', 'Ốp gỗ', '', 3
FROM categories c WHERE c.code = '10'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '10.4', 'Ốp tấm nhựa', '', 4
FROM categories c WHERE c.code = '10'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '11.1', 'Sơn tường trong', '', 1
FROM categories c WHERE c.code = '11'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '11.2', 'Sơn tường ngoài', '', 2
FROM categories c WHERE c.code = '11'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '11.3', 'Sơn dầu, sơn PU', '', 3
FROM categories c WHERE c.code = '11'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '11.4', 'Sơn chống thấm', '', 4
FROM categories c WHERE c.code = '11'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '11.5', 'Sơn epoxy', '', 5
FROM categories c WHERE c.code = '11'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '12.1', 'Chống thấm sàn mái', '', 1
FROM categories c WHERE c.code = '12'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '12.2', 'Chống thấm WC', '', 2
FROM categories c WHERE c.code = '12'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '12.3', 'Chống thấm tầng hầm', '', 3
FROM categories c WHERE c.code = '12'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '12.4', 'Chống thấm bể nước', '', 4
FROM categories c WHERE c.code = '12'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '13.1', 'Mái tôn', '', 1
FROM categories c WHERE c.code = '13'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '13.2', 'Mái ngói', '', 2
FROM categories c WHERE c.code = '13'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '13.3', 'Mái kính', '', 3
FROM categories c WHERE c.code = '13'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '13.4', 'Xà gồ, khung mái', '', 4
FROM categories c WHERE c.code = '13'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '14.1', 'Cửa gỗ', '', 1
FROM categories c WHERE c.code = '14'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '14.2', 'Cửa nhôm', '', 2
FROM categories c WHERE c.code = '14'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '14.3', 'Cửa nhựa lõi thép', '', 3
FROM categories c WHERE c.code = '14'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '14.4', 'Cửa sắt', '', 4
FROM categories c WHERE c.code = '14'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '14.5', 'Cửa kính', '', 5
FROM categories c WHERE c.code = '14'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '15.1', 'Lan can sắt', '', 1
FROM categories c WHERE c.code = '15'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '15.2', 'Lan can kính', '', 2
FROM categories c WHERE c.code = '15'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '15.3', 'Tay vịn cầu thang', '', 3
FROM categories c WHERE c.code = '15'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '15.4', 'Bậc cầu thang', '', 4
FROM categories c WHERE c.code = '15'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '16.1', 'Trần thạch cao', '', 1
FROM categories c WHERE c.code = '16'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '16.2', 'Trần nhựa', '', 2
FROM categories c WHERE c.code = '16'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '16.3', 'Trần gỗ', '', 3
FROM categories c WHERE c.code = '16'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '16.4', 'Trần thả', '', 4
FROM categories c WHERE c.code = '16'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '17.1', 'Đường dây điện', '', 1
FROM categories c WHERE c.code = '17'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '17.2', 'Ống luồn dây', '', 2
FROM categories c WHERE c.code = '17'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '17.3', 'Đèn chiếu sáng', '', 3
FROM categories c WHERE c.code = '17'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '17.4', 'Ổ cắm, công tắc', '', 4
FROM categories c WHERE c.code = '17'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '17.5', 'Tủ điện', '', 5
FROM categories c WHERE c.code = '17'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '18.1', 'Ống cấp nước', '', 1
FROM categories c WHERE c.code = '18'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '18.2', 'Ống thoát nước', '', 2
FROM categories c WHERE c.code = '18'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '18.3', 'Phụ kiện đường ống', '', 3
FROM categories c WHERE c.code = '18'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '18.4', 'Bồn chứa nước', '', 4
FROM categories c WHERE c.code = '18'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '19.1', 'Bồn cầu', '', 1
FROM categories c WHERE c.code = '19'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '19.2', 'Lavabo', '', 2
FROM categories c WHERE c.code = '19'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '19.3', 'Sen, vòi', '', 3
FROM categories c WHERE c.code = '19'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '19.4', 'Phụ kiện WC', '', 4
FROM categories c WHERE c.code = '19'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '19.5', 'Bồn tắm', '', 5
FROM categories c WHERE c.code = '19'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '19.6', 'Tủ lavabo', '', 6
FROM categories c WHERE c.code = '19'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '20.1', 'Tủ bếp', '', 1
FROM categories c WHERE c.code = '20'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '20.2', 'Tủ quần áo', '', 2
FROM categories c WHERE c.code = '20'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '20.3', 'Giường ngủ', '', 3
FROM categories c WHERE c.code = '20'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '20.4', 'Bàn làm việc', '', 4
FROM categories c WHERE c.code = '20'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '20.5', 'Kệ tivi', '', 5
FROM categories c WHERE c.code = '20'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '20.6', 'Tủ giày', '', 6
FROM categories c WHERE c.code = '20'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '21.1', 'Điều hòa treo tường', '', 1
FROM categories c WHERE c.code = '21'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '21.2', 'Điều hòa âm trần', '', 2
FROM categories c WHERE c.code = '21'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '21.3', 'Điều hòa tủ đứng', '', 3
FROM categories c WHERE c.code = '21'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '21.4', 'Hệ thống VRV/VRF', '', 4
FROM categories c WHERE c.code = '21'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '22.1', 'Camera an ninh', '', 1
FROM categories c WHERE c.code = '22'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '22.2', 'Chuông cửa', '', 2
FROM categories c WHERE c.code = '22'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '22.3', 'Khóa thông minh', '', 3
FROM categories c WHERE c.code = '22'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '22.4', 'Hệ thống smarthome', '', 4
FROM categories c WHERE c.code = '22'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '23.1', 'Lát sân vườn', '', 1
FROM categories c WHERE c.code = '23'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '23.2', 'Hàng rào', '', 2
FROM categories c WHERE c.code = '23'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '23.3', 'Cây xanh', '', 3
FROM categories c WHERE c.code = '23'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '23.4', 'Hồ cá, tiểu cảnh', '', 4
FROM categories c WHERE c.code = '23'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;

-- ============================================
-- INSERT WORK ITEMS
-- ============================================
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.1.1', 'Phá dỡ tường gạch', 'm3', 'Phá dỡ tường gạch các loại (đặc, ống, block), bao gồm thu dọn tại chỗ', 'Tính theo thể tích thực tế: Dài x Rộng x Cao tường. Không trừ lỗ cửa ≤1m²', 'V = L × W × H', '["Tường gạch đặc", "Tường gạch ống", "Tường gạch block", "Vữa trát"]'::jsonb, '["Phần bê tông cốt thép", "Khung cửa kim loại"]'::jsonb, 1
FROM work_types wt WHERE wt.code = '1.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.1.2', 'Phá dỡ sàn bê tông', 'm3', 'Đục phá sàn bê tông cốt thép, bao gồm cắt thép và thu dọn', 'Tính theo thể tích thực tế: Diện tích sàn x Chiều dày', 'V = S × t', '["Bê tông", "Cốt thép trong sàn"]'::jsonb, '["Lớp hoàn thiện trên sàn"]'::jsonb, 2
FROM work_types wt WHERE wt.code = '1.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.1.3', 'Phá dỡ mái tôn/ngói', 'm2', 'Tháo dỡ mái tôn hoặc ngói, bao gồm xà gồ gỗ/thép', 'Tính theo diện tích mái thực tế (theo độ dốc)', 'S = L × W / cos(α)', '["Tôn/ngói lợp", "Xà gồ", "Phụ kiện mái"]'::jsonb, '["Kết cấu đỡ chính bằng BTCT"]'::jsonb, 3
FROM work_types wt WHERE wt.code = '1.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.1.4', 'Phá dỡ cửa đi, cửa sổ', 'm2', 'Tháo dỡ cửa đi, cửa sổ các loại (gỗ, nhôm, sắt, kính)', 'Tính theo diện tích khuôn cửa: Rộng x Cao', 'S = W × H', '["Cánh cửa", "Khuôn cửa", "Phụ kiện"]'::jsonb, '["Phần tường xung quanh"]'::jsonb, 4
FROM work_types wt WHERE wt.code = '1.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.1.5', 'Phá dỡ trần thạch cao', 'm2', 'Tháo dỡ trần thạch cao bao gồm khung xương', 'Tính theo diện tích trần thực tế', 'S = L × W', '["Tấm thạch cao", "Khung xương kim loại", "Phụ kiện treo"]'::jsonb, '["Hệ thống điện, đèn trên trần"]'::jsonb, 5
FROM work_types wt WHERE wt.code = '1.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.1.6', 'Phá dỡ hệ thống điện cũ', 'md', 'Tháo dỡ dây điện, ống luồn, thiết bị điện cũ', 'Tính theo chiều dài dây/ống thực tế', 'L = Σ(chiều dài từng đoạn)', '["Dây điện", "Ống luồn", "Ổ cắm", "Công tắc", "Đèn"]'::jsonb, '["Tủ điện tổng (tính riêng)"]'::jsonb, 6
FROM work_types wt WHERE wt.code = '1.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.1.7', 'Phá dỡ hệ thống nước cũ', 'md', 'Tháo dỡ đường ống cấp thoát nước cũ', 'Tính theo chiều dài ống thực tế', 'L = Σ(chiều dài từng đoạn)', '["Ống cấp nước", "Ống thoát nước", "Phụ kiện (co, tê, van)"]'::jsonb, '["Thiết bị vệ sinh (tính riêng)"]'::jsonb, 7
FROM work_types wt WHERE wt.code = '1.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.2.1', 'Thu dọn phế thải xây dựng', 'm3', 'Gom, thu dọn phế thải từ phá dỡ tại công trình', 'Tính theo thể tích phế thải rời (hệ số nở 1.3-1.5)', 'V = V_đặc × K_nở', '["Gạch vỡ", "Bê tông vụn", "Gỗ vụn"]'::jsonb, '["Phế thải nguy hại"]'::jsonb, 1
FROM work_types wt WHERE wt.code = '1.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.2.2', 'San lấp mặt bằng', 'm2', 'San phẳng mặt bằng bằng thủ công hoặc máy', 'Tính theo diện tích mặt bằng cần san', 'S = L × W', '["Đào bớt chỗ cao", "Đắp bù chỗ thấp", "Đầm phẳng"]'::jsonb, '["Vận chuyển đất thừa đi (tính riêng)"]'::jsonb, 2
FROM work_types wt WHERE wt.code = '1.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.2.3', 'Vận chuyển phế thải ra bãi', 'm3', 'Vận chuyển phế thải từ công trình đến bãi đổ', 'Tính theo thể tích phế thải thực tế vận chuyển', 'V = Số chuyến × Thể tích/chuyến', '["Bốc xếp", "Vận chuyển", "Phí bãi đổ"]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '1.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.3.1', 'Lắp dựng rào chắn công trình', 'md', 'Lắp đặt hàng rào tạm bao quanh công trình', 'Tính theo chiều dài hàng rào', 'L = Chu vi công trình', '["Cọc đỡ", "Tôn/lưới B40", "Cổng ra vào"]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '1.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.3.2', 'Lắp dựng giàn giáo', 'm2', 'Lắp đặt giàn giáo phục vụ thi công trên cao', 'Tính theo diện tích mặt đứng cần giàn giáo', 'S = L × H', '["Khung giàn giáo", "Sàn thao tác", "Lan can an toàn"]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '1.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.3.3', 'Làm lán trại tạm', 'm2', 'Xây dựng lán trại tạm cho công nhân, kho vật tư', 'Tính theo diện tích sàn lán trại', 'S = L × W', '["Khung", "Mái che", "Vách ngăn"]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '1.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.3.4', 'Lắp điện tạm thi công', 'điểm', 'Đấu nối điện tạm phục vụ thi công', 'Tính theo số điểm đấu nối', 'N = Số điểm', '["Dây điện", "CB", "Ổ cắm công nghiệp"]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '1.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '1.3.5', 'Lắp nước tạm thi công', 'điểm', 'Đấu nối nước tạm phục vụ thi công', 'Tính theo số điểm đấu nối', 'N = Số điểm', '["Ống dẫn tạm", "Van", "Vòi nước"]'::jsonb, '[]'::jsonb, 5
FROM work_types wt WHERE wt.code = '1.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '2.1.1', 'Đào đất hố móng bằng máy', 'm3', 'Đào đất hố móng bằng máy đào, đất cấp I-II', 'Tính theo thể tích hình học hố móng (có tính taluy)', 'V = (a+2m×h) × (b+2m×h) × h', '["Đào đất", "Sửa hố móng sau đào máy"]'::jsonb, '["Đào gặp đá (tính riêng)", "Hút nước hố móng"]'::jsonb, 1
FROM work_types wt WHERE wt.code = '2.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '2.1.2', 'Đào đất hố móng bằng thủ công', 'm3', 'Đào đất hố móng bằng thủ công, đất cấp I-II', 'Tính theo thể tích hình học hố móng', 'V = L × W × H', '["Đào đất", "Xúc đổ đống trong phạm vi 10m"]'::jsonb, '["Đất cấp III-IV (hệ số khác)"]'::jsonb, 2
FROM work_types wt WHERE wt.code = '2.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '2.1.3', 'Đào đất rãnh móng', 'm3', 'Đào rãnh móng băng, chiều rộng ≤3m', 'Tính theo thể tích rãnh: Dài × Rộng × Sâu', 'V = L × W × H', '["Đào rãnh", "Sửa thành rãnh"]'::jsonb, '["Chống vách đất (nếu có)"]'::jsonb, 3
FROM work_types wt WHERE wt.code = '2.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '2.1.4', 'Đào đất hầm, tầng hầm', 'm3', 'Đào đất tầng hầm, chiều sâu >2m', 'Tính theo khối hình học gồm cả taluy và đường dốc lên xuống', 'V = S_đáy × H + V_taluy + V_dốc', '["Đào đất", "Làm đường dốc tạm"]'::jsonb, '["Gia cố vách hầm", "Hút nước ngầm"]'::jsonb, 4
FROM work_types wt WHERE wt.code = '2.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '2.2.1', 'Đắp đất nền công trình', 'm3', 'Đắp đất tôn nền, đầm chặt từng lớp ≤20cm', 'Tính theo thể tích đất đầm chặt (không phải đất rời)', 'V = S × H_đắp', '["Đất đắp", "Đầm chặt", "San phẳng"]'::jsonb, '["Vận chuyển đất đến (tính riêng)"]'::jsonb, 1
FROM work_types wt WHERE wt.code = '2.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '2.2.2', 'Đắp cát nền', 'm3', 'Đắp cát tôn nền, tưới nước đầm chặt', 'Tính theo thể tích cát sau đầm chặt', 'V = S × H_đắp', '["Cát san lấp", "Tưới nước", "Đầm chặt"]'::jsonb, '["Vận chuyển cát đến"]'::jsonb, 2
FROM work_types wt WHERE wt.code = '2.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '2.2.3', 'Đầm chặt đất nền', 'm2', 'Đầm chặt nền đất bằng đầm cóc hoặc lu rung', 'Tính theo diện tích nền được đầm', 'S = L × W', '["Đầm chặt", "Kiểm tra độ chặt K≥0.9"]'::jsonb, '["Đất đắp (tính riêng)"]'::jsonb, 3
FROM work_types wt WHERE wt.code = '2.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '2.3.1', 'Vận chuyển đất thừa đi đổ', 'm3', 'Vận chuyển đất dư từ đào móng đi đổ bãi', 'Tính theo thể tích đất rời (hệ số nở 1.2-1.3)', 'V = V_đào × K_nở', '["Bốc xếp", "Vận chuyển", "Chi phí bãi đổ"]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '2.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '2.3.2', 'Vận chuyển đất/cát đến công trình', 'm3', 'Mua và vận chuyển đất/cát đắp nền đến công trình', 'Tính theo thể tích đất/cát cần dùng (đã đầm)', 'V = V_cần × K_hao hụt', '["Giá vật liệu", "Vận chuyển", "Bốc dỡ"]'::jsonb, '["San đắp (tính riêng)"]'::jsonb, 2
FROM work_types wt WHERE wt.code = '2.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.1.1', 'Cọc tre Ø6-8cm, L≤2.5m', 'md', 'Thi công đóng cọc tre đường kính 6-8cm, chiều dài ≤2.5m', 'Tổng chiều dài cọc tre đã đóng (theo md)', 'L = Số cọc × Chiều dài/cọc', '["Cọc tre", "Đóng cọc", "Cắt đầu cọc"]'::jsonb, '["Phần cọc gãy phải thay"]'::jsonb, 1
FROM work_types wt WHERE wt.code = '3.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.1.2', 'Cọc tre Ø6-8cm, L>2.5m', 'md', 'Thi công đóng cọc tre đường kính 6-8cm, chiều dài >2.5m', 'Tổng chiều dài cọc tre đã đóng', 'L = Số cọc × Chiều dài/cọc', '["Cọc tre", "Đóng cọc", "Cắt đầu cọc"]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '3.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.1.3', 'Cọc tre Ø8-10cm, L≤2.5m', 'md', 'Thi công đóng cọc tre đường kính 8-10cm, chiều dài ≤2.5m', 'Tổng chiều dài cọc tre đã đóng', 'L = Số cọc × Chiều dài/cọc', '["Cọc tre", "Đóng cọc"]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '3.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.1.4', 'Cọc tre Ø8-10cm, L>2.5m', 'md', 'Thi công đóng cọc tre đường kính 8-10cm, chiều dài >2.5m', 'Tổng chiều dài cọc tre đã đóng', 'L = Số cọc × Chiều dài/cọc', '["Cọc tre", "Đóng cọc"]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '3.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.2.1', 'Cọc cừ tràm Ø6-8cm', 'md', 'Thi công đóng cọc cừ tràm đường kính 6-8cm', 'Tổng chiều dài cọc cừ tràm đã đóng', 'L = Số cọc × Chiều dài/cọc', '["Cọc tràm", "Đóng cọc", "Cắt đầu"]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '3.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.2.2', 'Cọc cừ tràm Ø8-10cm', 'md', 'Thi công đóng cọc cừ tràm đường kính 8-10cm', 'Tổng chiều dài cọc cừ tràm đã đóng', 'L = Số cọc × Chiều dài/cọc', '["Cọc tràm", "Đóng cọc"]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '3.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.2.3', 'Cọc cừ tràm Ø10-12cm', 'md', 'Thi công đóng cọc cừ tràm đường kính 10-12cm', 'Tổng chiều dài cọc cừ tràm đã đóng', 'L = Số cọc × Chiều dài/cọc', '["Cọc tràm", "Đóng cọc"]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '3.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.3.1', 'Cọc BTCT 200x200mm', 'md', 'Thi công ép cọc BTCT tiết diện 200x200mm', 'Tổng chiều dài cọc BTCT đã ép (từ đầu đến mũi)', 'L = Số cọc × Chiều dài/cọc', '["Vận chuyển cọc", "Ép cọc", "Hàn nối (nếu có)"]'::jsonb, '["Đập đầu cọc (tính riêng)"]'::jsonb, 1
FROM work_types wt WHERE wt.code = '3.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.3.2', 'Cọc BTCT 250x250mm', 'md', 'Thi công ép cọc BTCT tiết diện 250x250mm', 'Tổng chiều dài cọc BTCT đã ép', 'L = Số cọc × Chiều dài/cọc', '["Vận chuyển cọc", "Ép cọc", "Hàn nối"]'::jsonb, '["Đập đầu cọc"]'::jsonb, 2
FROM work_types wt WHERE wt.code = '3.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.3.3', 'Cọc BTCT 300x300mm', 'md', 'Thi công ép cọc BTCT tiết diện 300x300mm', 'Tổng chiều dài cọc BTCT đã ép', 'L = Số cọc × Chiều dài/cọc', '["Vận chuyển cọc", "Ép cọc", "Hàn nối"]'::jsonb, '["Đập đầu cọc"]'::jsonb, 3
FROM work_types wt WHERE wt.code = '3.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.3.4', 'Cọc BTCT 350x350mm', 'md', 'Thi công ép cọc BTCT tiết diện 350x350mm', 'Tổng chiều dài cọc BTCT đã ép', 'L = Số cọc × Chiều dài/cọc', '["Vận chuyển cọc", "Ép cọc", "Hàn nối"]'::jsonb, '["Đập đầu cọc"]'::jsonb, 4
FROM work_types wt WHERE wt.code = '3.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.3.5', 'Cọc ly tâm D300', 'md', 'Thi công ép cọc ly tâm ƯST đường kính 300mm', 'Tổng chiều dài cọc đã ép', 'L = Số cọc × Chiều dài/cọc', '["Cọc", "Ép", "Hàn nối"]'::jsonb, '[]'::jsonb, 5
FROM work_types wt WHERE wt.code = '3.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.3.6', 'Cọc ly tâm D400', 'md', 'Thi công ép cọc ly tâm ƯST đường kính 400mm', 'Tổng chiều dài cọc đã ép', 'L = Số cọc × Chiều dài/cọc', '["Cọc", "Ép", "Hàn nối"]'::jsonb, '[]'::jsonb, 6
FROM work_types wt WHERE wt.code = '3.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.3.7', 'Cọc ly tâm D500', 'md', 'Thi công ép cọc ly tâm ƯST đường kính 500mm', 'Tổng chiều dài cọc đã ép', 'L = Số cọc × Chiều dài/cọc', '["Cọc", "Ép", "Hàn nối"]'::jsonb, '[]'::jsonb, 7
FROM work_types wt WHERE wt.code = '3.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.4.1', 'Cọc khoan nhồi D600', 'md', 'Thi công cọc khoan nhồi đường kính 600mm', 'Tổng chiều dài cọc đã thi công (từ đáy đến cos cắt)', 'L = Số cọc × Chiều dài/cọc', '["Khoan tạo lỗ", "Đổ bê tông", "Cốt thép lồng"]'::jsonb, '["Đập đầu cọc"]'::jsonb, 1
FROM work_types wt WHERE wt.code = '3.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.4.2', 'Cọc khoan nhồi D800', 'md', 'Thi công cọc khoan nhồi đường kính 800mm', 'Tổng chiều dài cọc đã thi công', 'L = Số cọc × Chiều dài/cọc', '["Khoan", "Bê tông", "Thép lồng"]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '3.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '3.4.3', 'Cọc khoan nhồi D1000', 'md', 'Thi công cọc khoan nhồi đường kính 1000mm', 'Tổng chiều dài cọc đã thi công', 'L = Số cọc × Chiều dài/cọc', '["Khoan", "Bê tông", "Thép lồng"]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '3.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.1.1', 'BT lót móng đá 4x6, M100', 'm3', 'Đổ bê tông lót móng đá 4x6, mác 100', 'Thể tích = Diện tích đáy móng × Chiều dày lớp lót (thường 10cm)', 'V = S × 0.1', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '4.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.1.2', 'BT lót nền đá 4x6, M100', 'm3', 'Đổ bê tông lót nền đá 4x6, mác 100', 'Thể tích = Diện tích nền × Chiều dày (thường 5-10cm)', 'V = S × t', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '4.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.2.1', 'BT móng đơn M200', 'm3', 'Đổ bê tông móng đơn mác 200', 'Thể tích hình học móng đơn', 'V = L × W × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '4.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.2.2', 'BT móng đơn M250', 'm3', 'Đổ bê tông móng đơn mác 250', 'Thể tích hình học môdng đơn', 'V = L × W × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '4.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.2.3', 'BT móng băng M200', 'm3', 'Đổ bê tông móng băng mác 200', 'Thể tích = Chiều dài × Chiều rộng × Chiều cao móng băng', 'V = L × W × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '4.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.2.4', 'BT móng băng M250', 'm3', 'Đổ bê tông móng băng mác 250', 'Thể tích hình học móng băng', 'V = L × W × H', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '4.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.2.5', 'BT móng bè M250', 'm3', 'Đổ bê tông móng bè mác 250', 'Thể tích = Diện tích × Chiều dày bè', 'V = S × t', '[]'::jsonb, '[]'::jsonb, 5
FROM work_types wt WHERE wt.code = '4.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.2.6', 'BT móng bè M300', 'm3', 'Đổ bê tông móng bè mác 300', 'Thể tích = Diện tích × Chiều dày', 'V = S × t', '[]'::jsonb, '[]'::jsonb, 6
FROM work_types wt WHERE wt.code = '4.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.3.1', 'BT cột tiết diện ≤0.1m²', 'm3', 'Đổ bê tông cột có tiết diện ≤0.1m² (cột nhỏ)', 'Thể tích = Tiết diện × Chiều cao cột (từ đỉnh móng/sàn đến đáy dầm)', 'V = A × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '4.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.3.2', 'BT cột tiết diện >0.1m²', 'm3', 'Đổ bê tông cột có tiết diện >0.1m² (cột lớn)', 'Thể tích = Tiết diện × Chiều cao cột', 'V = A × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '4.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.3.3', 'BT cột tròn', 'm3', 'Đổ bê tông cột tròn', 'Thể tích = π × R² × H', 'V = π × R² × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '4.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.4.1', 'BT dầm chính', 'm3', 'Đổ bê tông dầm chính (dầm khung)', 'Thể tích = Chiều rộng × (Chiều cao dầm - Dày sàn) × Chiều dài', 'V = b × (h-t_sàn) × L', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '4.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.4.2', 'BT dầm phụ', 'm3', 'Đổ bê tông dầm phụ', 'Thể tích = b × (h-t_sàn) × L', 'V = b × h'' × L', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '4.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.4.3', 'BT lanh tô, ô văng', 'm3', 'Đổ bê tông lanh tô cửa, ô văng', 'Thể tích = Chiều rộng × Chiều cao × Chiều dài', 'V = b × h × L', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '4.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.5.1', 'BT sàn dày 8cm', 'm3', 'Đổ bê tông sàn dày 8cm', 'Thể tích = Diện tích sàn × 0.08m', 'V = S × 0.08', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '4.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.5.2', 'BT sàn dày 10cm', 'm3', 'Đổ bê tông sàn dày 10cm', 'Thể tích = Diện tích sàn × 0.10m', 'V = S × 0.10', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '4.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.5.3', 'BT sàn dày 12cm', 'm3', 'Đổ bê tông sàn dày 12cm', 'Thể tích = Diện tích sàn × 0.12m', 'V = S × 0.12', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '4.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.5.4', 'BT sàn dày 15cm', 'm3', 'Đổ bê tông sàn dày 15cm', 'Thể tích = Diện tích sàn × 0.15m', 'V = S × 0.15', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '4.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.5.5', 'BT sàn mái', 'm3', 'Đổ bê tông sàn mái (có tạo dốc)', 'Thể tích = Diện tích × Chiều dày trung bình', 'V = S × t_tb', '[]'::jsonb, '[]'::jsonb, 5
FROM work_types wt WHERE wt.code = '4.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.6.1', 'BT cầu thang 2 vế', 'm3', 'Đổ bê tông cầu thang 2 vế thông thường', 'Thể tích = Diện tích nghiêng × Chiều dày bản thang + Thể tích bậc', 'V = S_nghiêng × t + V_bậc', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '4.6'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.6.2', 'BT cầu thang xoắn', 'm3', 'Đổ bê tông cầu thang xoắn ốc', 'Thể tích theo công thức cầu thang xoắn', 'V = π × (R² - r²) × t × n/360', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '4.6'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.7.1', 'BT tường dày 10cm', 'm3', 'Đổ bê tông tường dày 10cm', 'Thể tích = Diện tích tường × 0.10m', 'V = S × 0.10', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '4.7'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.7.2', 'BT tường dày 15cm', 'm3', 'Đổ bê tông tường dày 15cm', 'Thể tích = Diện tích tường × 0.15m', 'V = S × 0.15', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '4.7'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.7.3', 'BT tường dày 20cm', 'm3', 'Đổ bê tông tường dày 20cm', 'Thể tích = Diện tích tường × 0.20m', 'V = S × 0.20', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '4.7'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.8.1', 'BT bể nước ngầm', 'm3', 'Đổ bê tông bể nước ngầm (đáy + thành)', 'Thể tích = V_đáy + V_thành', 'V = S_đáy × t_đáy + Chu_vi × H × t_thành', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '4.8'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.8.2', 'BT bể phốt', 'm3', 'Đổ bê tông bể phốt 3 ngăn', 'Thể tích = V_đáy + V_thành + V_vách ngăn', 'V = ΣV_thành_phần', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '4.8'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '4.8.3', 'BT hồ bơi', 'm3', 'Đổ bê tông hồ bơi', 'Thể tích = V_đáy + V_thành', 'V = S × t_đáy + P × H × t_thành', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '4.8'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.1.1', 'Thép móng Ø≤10mm', 'kg', 'Gia công, lắp đặt thép móng đường kính ≤10mm', 'Khối lượng = Chiều dài × Trọng lượng/md theo bảng tra', 'M = L × γ (γ_Ø8=0.395, Ø10=0.617 kg/m)', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '5.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.1.2', 'Thép móng Ø12-16mm', 'kg', 'Gia công, lắp đặt thép móng đường kính 12-16mm', 'Khối lượng = Chiều dài × Trọng lượng/md', 'M = L × γ (γ_Ø12=0.888, Ø14=1.21, Ø16=1.58 kg/m)', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '5.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.1.3', 'Thép móng Ø18-22mm', 'kg', 'Gia công, lắp đặt thép móng đường kính 18-22mm', 'Khối lượng = Chiều dài × Trọng lượng/md', 'M = L × γ (γ_Ø18=2.00, Ø20=2.47, Ø22=2.98 kg/m)', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '5.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.1.4', 'Thép móng Ø≥25mm', 'kg', 'Gia công, lắp đặt thép móng đường kính ≥25mm', 'Khối lượng = Chiều dài × Trọng lượng/md', 'M = L × γ (γ_Ø25=3.85, Ø28=4.83, Ø32=6.31 kg/m)', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '5.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.2.1', 'Thép cột Ø≤10mm', 'kg', 'Gia công, lắp đặt thép đai cột Ø≤10mm', 'Khối lượng = Chu vi đai × Số đai × γ', 'M = (2a+2b+20d) × n × γ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '5.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.2.2', 'Thép cột Ø12-16mm', 'kg', 'Gia công, lắp đặt thép dọc cột Ø12-16mm', 'Khối lượng = Chiều dài thép × Số thanh × γ', 'M = L × n × γ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '5.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.2.3', 'Thép cột Ø18-22mm', 'kg', 'Gia công, lắp đặt thép dọc cột Ø18-22mm', 'Khối lượng = Chiều dài thép × Số thanh × γ', 'M = L × n × γ', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '5.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.2.4', 'Thép cột Ø≥25mm', 'kg', 'Gia công, lắp đặt thép dọc cột Ø≥25mm', 'Khối lượng = Chiều dài thép × Số thanh × γ', 'M = L × n × γ', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '5.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.3.1', 'Thép dầm, sàn Ø≤10mm', 'kg', 'Gia công, lắp đặt thép dầm, sàn Ø≤10mm', 'Tính theo bản vẽ kết cấu, nhân hệ số hao hụt 1.02-1.05', 'M = ΣL × γ × K_hao', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '5.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.3.2', 'Thép dầm, sàn Ø12-16mm', 'kg', 'Gia công, lắp đặt thép dầm, sàn Ø12-16mm', 'Tính theo bản vẽ kết cấu', 'M = ΣL × γ × K_hao', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '5.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.3.3', 'Thép dầm, sàn Ø18-22mm', 'kg', 'Gia công, lắp đặt thép dầm, sàn Ø18-22mm', 'Tính theo bản vẽ kết cấu', 'M = ΣL × γ × K_hao', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '5.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.4.1', 'Thép cầu thang Ø≤10mm', 'kg', 'Gia công, lắp đặt thép cầu thang Ø≤10mm', 'Tính theo bản vẽ kết cấu', 'M = ΣL × γ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '5.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.4.2', 'Thép cầu thang Ø12-16mm', 'kg', 'Gia công, lắp đặt thép cầu thang Ø12-16mm', 'Tính theo bản vẽ kết cấu', 'M = ΣL × γ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '5.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.5.1', 'Lưới thép Ø4 a100', 'm2', 'Lắp đặt lưới thép hàn Ø4mm, ô 100×100mm', 'Diện tích lưới = Diện tích sàn/tường cần đặt lưới', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '5.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.5.2', 'Lưới thép Ø6 a150', 'm2', 'Lắp đặt lưới thép hàn Ø6mm, ô 150×150mm', 'Diện tích lưới = Diện tích cần lắp', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '5.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '5.5.3', 'Lưới thép Ø6 a200', 'm2', 'Lắp đặt lưới thép hàn Ø6mm, ô 200×200mm', 'Diện tích lưới = Diện tích cần lắp', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '5.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.1.1', 'VK móng đơn', 'm2', 'Lắp dựng, tháo dỡ ván khuôn móng đơn', 'Diện tích = Chu vi móng × Chiều cao móng', 'S = P × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '6.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.1.2', 'VK móng băng', 'm2', 'Lắp dựng, tháo dỡ ván khuôn móng băng', 'Diện tích = 2 × Chiều cao × Chiều dài móng băng', 'S = 2 × H × L', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '6.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.1.3', 'VK móng bè', 'm2', 'Lắp dựng, tháo dỡ ván khuôn móng bè (thành ngoài)', 'Diện tích = Chu vi bè × Chiều cao bè', 'S = P × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '6.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.2.1', 'VK cột vuông', 'm2', 'Lắp dựng, tháo dỡ ván khuôn cột vuông/chữ nhật', 'Diện tích = Chu vi cột × Chiều cao cột', 'S = 2(a+b) × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '6.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.2.2', 'VK cột tròn', 'm2', 'Lắp dựng, tháo dỡ ván khuôn cột tròn (ống thép)', 'Diện tích = π × D × H', 'S = π × D × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '6.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.3.1', 'VK dầm', 'm2', 'Lắp dựng, tháo dỡ ván khuôn dầm (đáy + 2 thành)', 'Diện tích = (Chiều rộng + 2×Chiều cao) × Chiều dài', 'S = (b + 2h) × L', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '6.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.3.2', 'VK sàn phẳng', 'm2', 'Lắp dựng, tháo dỡ ván khuôn sàn phẳng', 'Diện tích = Diện tích sàn (bằng diện tích BT sàn)', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '6.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.3.3', 'VK lanh tô, ô văng', 'm2', 'Lắp dựng, tháo dỡ ván khuôn lanh tô, ô văng', 'Diện tích = Chu vi tiết diện × Chiều dài', 'S = P × L', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '6.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.4.1', 'VK cầu thang thường', 'm2', 'Lắp dựng, tháo dỡ ván khuôn cầu thang 2 vế', 'Diện tích = Diện tích đáy nghiêng + Diện tích thành bậc', 'S = S_đáy + n × (h × L_bậc)', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '6.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.4.2', 'VK cầu thang xoắn', 'm2', 'Lắp dựng, tháo dỡ ván khuôn cầu thang xoắn', 'Tính theo công thức cầu thang xoắn (phức tạp hơn)', 'S = S_bản + S_bậc', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '6.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.5.1', 'VK tường BTCT', 'm2', 'Lắp dựng, tháo dỡ ván khuôn tường BTCT (2 mặt)', 'Diện tích = 2 × Chiều dài × Chiều cao tường', 'S = 2 × L × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '6.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '6.5.2', 'VK bể nước, bể phốt', 'm2', 'Lắp dựng, tháo dỡ ván khuôn bể (trong + ngoài)', 'Diện tích = S_trong + S_ngoài', 'S = 2 × (P_trong + P_ngoài) × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '6.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.1.1', 'Xây móng gạch đặc', 'm3', 'Xây móng bằng gạch đặc, vữa XM M75', 'Thể tích = Chiều dài × Chiều rộng × Chiều cao móng gạch', 'V = L × W × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '7.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.1.2', 'Xây móng đá hộc', 'm3', 'Xây móng bằng đá hộc, vữa XM M75', 'Thể tích móng đá hộc', 'V = L × W × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '7.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.2.1', 'Xây tường gạch đặc 100mm', 'm2', 'Xây tường gạch đặc dày 100mm (10cm)', 'Diện tích tường = Dài × Cao, trừ lỗ cửa >1m²', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '7.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.2.2', 'Xây tường gạch đặc 200mm', 'm2', 'Xây tường gạch đặc dày 200mm (20cm)', 'Diện tích tường = Dài × Cao, trừ lỗ cửa >1m²', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '7.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.2.3', 'Xây tường gạch ống 100mm', 'm2', 'Xây tường gạch ống 2 lỗ dày 100mm', 'Diện tích tường, trừ lỗ cửa >1m²', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '7.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.2.4', 'Xây tường gạch ống 200mm', 'm2', 'Xây tường gạch ống dày 200mm', 'Diện tích tường, trừ lỗ cửa >1m²', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '7.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.2.5', 'Xây tường gạch block 100mm', 'm2', 'Xây tường gạch block xi măng dày 100mm', 'Diện tích tường, trừ lỗ cửa', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 5
FROM work_types wt WHERE wt.code = '7.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.2.6', 'Xây tường gạch block 150mm', 'm2', 'Xây tường gạch block xi măng dày 150mm', 'Diện tích tường, trừ lỗ cửa', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 6
FROM work_types wt WHERE wt.code = '7.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.2.7', 'Xây tường gạch block 200mm', 'm2', 'Xây tường gạch block xi măng dày 200mm', 'Diện tích tường, trừ lỗ cửa', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 7
FROM work_types wt WHERE wt.code = '7.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.2.8', 'Xây tường gạch AAC 100mm', 'm2', 'Xây tường gạch bê tông khí chưng áp (AAC) dày 100mm', 'Diện tích tường, trừ lỗ cửa', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 8
FROM work_types wt WHERE wt.code = '7.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.2.9', 'Xây tường gạch AAC 150mm', 'm2', 'Xây tường gạch AAC dày 150mm', 'Diện tích tường, trừ lỗ cửa', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 9
FROM work_types wt WHERE wt.code = '7.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.2.10', 'Xây tường gạch AAC 200mm', 'm2', 'Xây tường gạch AAC dày 200mm', 'Diện tích tường, trừ lỗ cửa', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 10
FROM work_types wt WHERE wt.code = '7.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.3.1', 'Xây trụ cổng', 'm3', 'Xây trụ cổng bằng gạch đặc hoặc block', 'Thể tích = Tiết diện trụ × Chiều cao', 'V = A × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '7.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.3.2', 'Xây bồn hoa, chậu cảnh', 'm3', 'Xây bồn hoa, chậu cảnh bằng gạch', 'Thể tích gạch xây = Chu vi × Chiều cao × Chiều dày', 'V = P × H × t', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '7.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.3.3', 'Xây tường rào', 'm2', 'Xây tường rào bằng gạch', 'Diện tích tường rào', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '7.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '7.4.1', 'Xây bậc thang gạch', 'm3', 'Xây bậc thang bằng gạch đặc', 'Thể tích = Số bậc × Thể tích 1 bậc', 'V = n × (l × b × h)', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '7.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.1.1', 'Trát tường trong dày 15mm', 'm2', 'Trát tường trong nhà dày 15mm, vữa XM M75', 'Diện tích trát = Diện tích tường - Diện tích cửa - Diện tích ốp gạch', 'S = L × H - S_trừ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '8.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.1.2', 'Trát tường ngoài dày 15mm', 'm2', 'Trát tường ngoài nhà dày 15mm, vữa XM M75', 'Diện tích mặt ngoài tường', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '8.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.1.3', 'Trát tường ngoài dày 20mm', 'm2', 'Trát tường ngoài nhà dày 20mm, vữa XM M75', 'Diện tích mặt ngoài tường', 'S = L × H - S_cửa', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '8.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.2.1', 'Trát trần phẳng', 'm2', 'Trát trần bê tông phẳng', 'Diện tích trần = Diện tích sàn tầng trên', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '8.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.2.2', 'Trát trần có đường chỉ', 'm2', 'Trát trần có kẻ đường chỉ trang trí', 'Diện tích trần', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '8.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.3.1', 'Trát cột', 'm2', 'Trát xung quanh cột bê tông', 'Diện tích = Chu vi cột × Chiều cao cột', 'S = P × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '8.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.3.2', 'Trát dầm', 'm2', 'Trát dầm bê tông (đáy + 2 thành)', 'Diện tích = (Chiều rộng + 2×Chiều cao lộ) × Chiều dài', 'S = (b + 2h) × L', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '8.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.4.1', 'Trát gờ chỉ tường', 'md', 'Trát gờ chỉ trang trí trên tường', 'Chiều dài đường gờ chỉ', 'L = ΣL_gờ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '8.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.4.2', 'Trát phào trần', 'md', 'Trát phào chỉ góc trần-tường', 'Chiều dài phào = Chu vi phòng', 'L = 2(a + b)', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '8.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.4.3', 'Trát ô văng, mái hắt', 'm2', 'Trát ô văng, mái hắt che mưa', 'Diện tích = Chu vi tiết diện × Chiều dài', 'S = P × L', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '8.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.5.1', 'Trát granitô chân tường', 'm2', 'Trát granitô chân tường cao 100-150mm', 'Diện tích = Chu vi phòng × Chiều cao chân tường', 'S = P × h', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '8.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '8.5.2', 'Trát granitô bậc thang', 'm2', 'Trát granitô mặt và cổ bậc thang', 'Diện tích = Số bậc × (Diện tích mặt + Diện tích cổ)', 'S = n × (l×b + l×h)', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '8.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.1.1', 'Lát gạch 300x300mm', 'm2', 'Lát gạch ceramic 300×300mm', 'Diện tích sàn cần lát (đã trừ diện tích không lát)', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '9.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.1.2', 'Lát gạch 400x400mm', 'm2', 'Lát gạch ceramic 400×400mm', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '9.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.1.3', 'Lát gạch 600x600mm', 'm2', 'Lát gạch ceramic 600×600mm', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '9.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.1.4', 'Lát gạch 800x800mm', 'm2', 'Lát gạch ceramic 800×800mm', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '9.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.2.1', 'Lát gạch 600x600mm bóng kính', 'm2', 'Lát gạch porcelain bóng kính 600×600mm', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '9.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.2.2', 'Lát gạch 600x1200mm', 'm2', 'Lát gạch porcelain 600×1200mm', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '9.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.2.3', 'Lát gạch 800x800mm bóng kính', 'm2', 'Lát gạch porcelain bóng kính 800×800mm', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '9.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.3.1', 'Lát granite tự nhiên', 'm2', 'Lát đá granite tự nhiên', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '9.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.3.2', 'Lát granite nhân tạo', 'm2', 'Lát đá granite nhân tạo', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '9.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.4.1', 'Lát sàn gỗ công nghiệp 8mm', 'm2', 'Lát sàn gỗ công nghiệp dày 8mm', 'Diện tích sàn cần lát (+ hao hụt 5-8%)', 'S = L × W × 1.05', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '9.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.4.2', 'Lát sàn gỗ công nghiệp 12mm', 'm2', 'Lát sàn gỗ công nghiệp dày 12mm', 'Diện tích sàn cần lát (+ hao hụt)', 'S = L × W × 1.05', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '9.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.4.3', 'Lát sàn gỗ tự nhiên', 'm2', 'Lát sàn gỗ tự nhiên', 'Diện tích sàn cần lát (+ hao hụt 8-10%)', 'S = L × W × 1.08', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '9.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.5.1', 'Lát gạch terrazzo 300x300', 'm2', 'Lát gạch terrazzo 300×300mm', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '9.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.5.2', 'Lát gạch terrazzo 400x400', 'm2', 'Lát gạch terrazzo 400×400mm', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '9.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.6.1', 'Lát đá hoa cương', 'm2', 'Lát đá hoa cương tự nhiên', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '9.6'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.6.2', 'Lát đá cẩm thạch', 'm2', 'Lát đá cẩm thạch', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '9.6'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '9.6.3', 'Lát đá marble', 'm2', 'Lát đá marble nhập khẩu', 'Diện tích sàn cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '9.6'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.1.1', 'Ốp gạch 200x250mm', 'm2', 'Ốp gạch men tường 200×250mm', 'Diện tích tường cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '10.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.1.2', 'Ốp gạch 250x400mm', 'm2', 'Ốp gạch men tường 250×400mm', 'Diện tích tường cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '10.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.1.3', 'Ốp gạch 300x600mm', 'm2', 'Ốp gạch men tường 300×600mm', 'Diện tích tường cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '10.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.1.4', 'Ốp gạch 400x800mm', 'm2', 'Ốp gạch men tường 400×800mm', 'Diện tích tường cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '10.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.2.1', 'Ốp đá granite', 'm2', 'Ốp đá granite tự nhiên', 'Diện tích tường cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '10.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.2.2', 'Ốp đá marble', 'm2', 'Ốp đá marble tự nhiên', 'Diện tích tường cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '10.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.2.3', 'Ốp đá ong', 'm2', 'Ốp đá ong trang trí', 'Diện tích tường cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '10.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.3.1', 'Ốp gỗ tự nhiên', 'm2', 'Ốp gỗ tự nhiên trang trí tường', 'Diện tích tường cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '10.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.3.2', 'Ốp gỗ công nghiệp MDF', 'm2', 'Ốp gỗ MDF phủ melamine/veneer', 'Diện tích tường cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '10.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.3.3', 'Ốp gỗ nhựa composite', 'm2', 'Ốp gỗ nhựa composite (WPC)', 'Diện tích tường cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '10.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.4.1', 'Ốp tấm PVC', 'm2', 'Ốp tấm nhựa PVC tường', 'Diện tích tường cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '10.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '10.4.2', 'Ốp tấm alu', 'm2', 'Ốp tấm aluminium composite', 'Diện tích tường/mặt tiền cần ốp', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '10.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.1.1', 'Sơn lót chống kiềm', 'm2', 'Sơn lót chống kiềm tường trong nhà', 'Diện tích tường + trần cần sơn lót', 'S = S_tường + S_trần', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '11.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.1.2', 'Sơn phủ nội thất 2 lớp', 'm2', 'Sơn phủ nội thất 2 lớp', 'Diện tích tường + trần cần sơn phủ', 'S = S_tường + S_trần', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '11.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.1.3', 'Sơn phủ nội thất 3 lớp', 'm2', 'Sơn phủ nội thất 3 lớp (cao cấp)', 'Diện tích tường + trần cần sơn', 'S = S_tường + S_trần', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '11.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.2.1', 'Sơn lót ngoại thất', 'm2', 'Sơn lót ngoại thất chống kiềm, chống nấm mốc', 'Diện tích mặt ngoài cần sơn', 'S = ΣS_mặt_ngoài', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '11.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.2.2', 'Sơn phủ ngoại thất 2 lớp', 'm2', 'Sơn phủ ngoại thất 2 lớp', 'Diện tích mặt ngoài cần sơn', 'S = ΣS_mặt_ngoài', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '11.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.2.3', 'Sơn phủ ngoại thất 3 lớp', 'm2', 'Sơn phủ ngoại thất 3 lớp (bền màu)', 'Diện tích mặt ngoài cần sơn', 'S = ΣS_mặt_ngoài', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '11.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.3.1', 'Sơn dầu cửa gỗ', 'm2', 'Sơn dầu cửa gỗ (2 mặt)', 'Diện tích = 2 × Diện tích cửa', 'S = 2 × S_cửa', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '11.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.3.2', 'Sơn PU cửa gỗ', 'm2', 'Sơn PU cửa gỗ cao cấp (2 mặt)', 'Diện tích = 2 × Diện tích cửa', 'S = 2 × S_cửa', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '11.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.3.3', 'Sơn dầu lan can sắt', 'm2', 'Sơn dầu lan can, cửa sắt', 'Diện tích bề mặt sắt (quy đổi)', 'S = S_quy_đổi', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '11.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.4.1', 'Sơn chống thấm sàn mái', 'm2', 'Sơn chống thấm sàn mái (2-3 lớp)', 'Diện tích sàn mái cần chống thấm', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '11.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.4.2', 'Sơn chống thấm WC', 'm2', 'Sơn chống thấm sàn WC', 'Diện tích sàn + Diện tích chân tường (30cm)', 'S = S_sàn + P × 0.3', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '11.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.4.3', 'Sơn chống thấm tường ngoài', 'm2', 'Sơn chống thấm tường ngoài', 'Diện tích tường ngoài cần chống thấm', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '11.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.5.1', 'Sơn epoxy sàn', 'm2', 'Sơn epoxy sàn nhà xưởng, garage', 'Diện tích sàn cần sơn', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '11.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '11.5.2', 'Sơn epoxy bể nước', 'm2', 'Sơn epoxy chống thấm bể nước ăn', 'Diện tích đáy + thành bể', 'S = S_đáy + P × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '11.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '12.1.1', 'Chống thấm màng khò', 'm2', 'Chống thấm sàn mái bằng màng khò bitum', 'Diện tích sàn mái + Diện tích chân tường bo lên 30cm', 'S = S_sàn + P × 0.3', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '12.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '12.1.2', 'Chống thấm sika 2 thành phần', 'm2', 'Chống thấm sàn mái bằng Sika 2 thành phần', 'Diện tích sàn mái + bo chân', 'S = S_sàn + P × 0.3', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '12.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '12.1.3', 'Chống thấm polyurethane', 'm2', 'Chống thấm sàn mái bằng polyurethane', 'Diện tích sàn mái + bo chân', 'S = S_sàn + P × 0.3', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '12.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '12.2.1', 'Chống thấm màng khò WC', 'm2', 'Chống thấm sàn WC bằng màng khò', 'Diện tích sàn + chân tường 30cm', 'S = S_sàn + P × 0.3', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '12.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '12.2.2', 'Chống thấm sika WC', 'm2', 'Chống thấm sàn WC bằng Sika', 'Diện tích sàn + chân tường', 'S = S_sàn + P × 0.3', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '12.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '12.2.3', 'Chống thấm kova WC', 'm2', 'Chống thấm sàn WC bằng Kova CT11A', 'Diện tích sàn + chân tường', 'S = S_sàn + P × 0.3', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '12.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '12.3.1', 'Chống thấm màng HDPE', 'm2', 'Chống thấm tầng hầm bằng màng HDPE', 'Diện tích đáy + diện tích thành hầm', 'S = S_đáy + P × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '12.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '12.3.2', 'Chống thấm bentonite', 'm2', 'Chống thấm tầng hầm bằng bentonite', 'Diện tích đáy + thành hầm', 'S = S_đáy + P × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '12.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '12.3.3', 'Chống thấm crystalline', 'm2', 'Chống thấm tầng hầm bằng crystalline (kết tinh)', 'Diện tích bề mặt bê tông cần xử lý', 'S = S_tổng', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '12.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '12.4.1', 'Chống thấm epoxy bể', 'm2', 'Chống thấm bể nước bằng epoxy', 'Diện tích đáy + thành bể (bên trong)', 'S = S_đáy + P × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '12.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '12.4.2', 'Chống thấm sika bể', 'm2', 'Chống thấm bể nước bằng Sika', 'Diện tích đáy + thành bể', 'S = S_đáy + P × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '12.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.1.1', 'Lợp tôn sóng vuông', 'm2', 'Lợp mái tôn sóng vuông', 'Diện tích mái theo độ dốc (+ hao hùt chồng mí 10%)', 'S = L × W / cos(α) × 1.1', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '13.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.1.2', 'Lợp tôn sóng tròn', 'm2', 'Lợp mái tôn sóng tròn', 'Diện tích mái theo độ dốc', 'S = L × W / cos(α) × 1.1', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '13.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.1.3', 'Lợp tôn cách nhiệt', 'm2', 'Lợp mái tôn cách nhiệt (tôn + xốp + tôn)', 'Diện tích mái theo độ dốc', 'S = L × W / cos(α)', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '13.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.1.4', 'Lợp tôn giả ngói', 'm2', 'Lợp mái tôn giả ngói', 'Diện tích mái theo độ dốc', 'S = L × W / cos(α)', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '13.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.2.1', 'Lợp ngói 22v/m²', 'm2', 'Lợp ngói đất nung 22 viên/m²', 'Diện tích mái theo độ dốc', 'S = L × W / cos(α)', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '13.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.2.2', 'Lợp ngói 13v/m²', 'm2', 'Lợp ngói sóng lớn 13 viên/m²', 'Diện tích mái theo độ dốc', 'S = L × W / cos(α)', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '13.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.2.3', 'Lợp ngói phẳng', 'm2', 'Lợp ngói phẳng (ngói âm dương)', 'Diện tích mái theo độ dốc', 'S = L × W / cos(α)', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '13.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.2.4', 'Lợp ngói bê tông', 'm2', 'Lợp ngói bê tông màu', 'Diện tích mái theo độ dốc', 'S = L × W / cos(α)', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '13.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.3.1', 'Mái kính cường lực', 'm2', 'Lợp mái kính cường lực dày 12mm', 'Diện tích mái theo độ dốc', 'S = L × W / cos(α)', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '13.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.3.2', 'Mái kính dán an toàn', 'm2', 'Lợp mái kính dán an toàn (laminated)', 'Diện tích mái', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '13.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.3.3', 'Mái poly đặc ruột', 'm2', 'Lợp mái poly đặc ruột trong suốt', 'Diện tích mái', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '13.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.4.1', 'Xà gồ thép hộp', 'kg', 'Lắp đặt xà gồ thép hộp', 'Khối lượng = Chiều dài × Trọng lượng/md', 'M = L × γ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '13.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.4.2', 'Xà gồ thép C', 'kg', 'Lắp đặt xà gồ thép hình C', 'Khối lượng = Chiều dài × Trọng lượng/md', 'M = L × γ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '13.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '13.4.3', 'Xà gồ gỗ', 'm3', 'Lắp đặt xà gồ gỗ tự nhiên', 'Thể tích = Tiết diện × Chiều dài', 'V = A × L', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '13.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.1.1', 'Cửa gỗ công nghiệp HDF', 'm2', 'Lắp đặt cửa gỗ công nghiệp HDF', 'Diện tích cửa = Chiều rộng × Chiều cao khuôn', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '14.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.1.2', 'Cửa gỗ công nghiệp MDF', 'm2', 'Lắp đặt cửa gỗ công nghiệp MDF', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '14.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.1.3', 'Cửa gỗ tự nhiên', 'm2', 'Lắp đặt cửa gỗ tự nhiên', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '14.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.1.4', 'Cửa gỗ Composite', 'm2', 'Lắp đặt cửa gỗ nhựa Composite', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '14.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.2.1', 'Cửa nhôm Xingfa', 'm2', 'Lắp đặt cửa nhôm Xingfa nhập khẩu', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '14.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.2.2', 'Cửa nhôm Việt Pháp', 'm2', 'Lắp đặt cửa nhôm Việt Pháp', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '14.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.2.3', 'Cửa nhôm hệ 55', 'm2', 'Lắp đặt cửa nhôm hệ 55mm', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '14.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.2.4', 'Cửa nhôm hệ 93', 'm2', 'Lắp đặt cửa nhôm hệ 93mm (cách âm, cách nhiệt)', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '14.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.3.1', 'Cửa nhựa lõi thép 3 ray', 'm2', 'Lắp đặt cửa nhựa lõi thép 3 ray', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '14.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.3.2', 'Cửa nhựa lõi thép 5 ray', 'm2', 'Lắp đặt cửa nhựa lõi thép 5 ray', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '14.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.4.1', 'Cửa sắt hộp', 'm2', 'Lắp đặt cửa sắt hộp sơn tĩnh điện', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '14.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.4.2', 'Cổng sắt mỹ thuật', 'm2', 'Lắp đặt cổng sắt mỹ thuật', 'Diện tích cổng = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '14.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.4.3', 'Cửa sắt cuốn', 'm2', 'Lắp đặt cửa cuốn tay/điện', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '14.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.5.1', 'Cửa kính cường lực 10mm', 'm2', 'Lắp đặt cửa kính cường lực 10mm', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '14.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.5.2', 'Cửa kính cường lực 12mm', 'm2', 'Lắp đặt cửa kính cường lực 12mm', 'Diện tích cửa = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '14.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '14.5.3', 'Vách kính cường lực', 'm2', 'Lắp đặt vách kính cường lực cố định', 'Diện tích vách = W × H', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '14.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '15.1.1', 'Lan can sắt hộp', 'md', 'Lắp đặt lan can sắt hộp sơn tĩnh điện', 'Chiều dài lan can', 'L = ΣL_lan_can', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '15.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '15.1.2', 'Lan can sắt mỹ thuật', 'md', 'Lắp đặt lan can sắt mỹ thuật uốn hoa văn', 'Chiều dài lan can', 'L = ΣL_lan_can', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '15.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '15.1.3', 'Lan can inox', 'md', 'Lắp đặt lan can inox 304', 'Chiều dài lan can', 'L = ΣL_lan_can', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '15.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '15.2.1', 'Lan can kính cường lực', 'md', 'Lắp đặt lan can kính cường lực 12mm', 'Chiều dài lan can', 'L = ΣL_lan_can', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '15.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '15.2.2', 'Lan can kính + inox', 'md', 'Lắp đặt lan can kết hợp kính + inox', 'Chiều dài lan can', 'L = ΣL_lan_can', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '15.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '15.3.1', 'Tay vịn gỗ', 'md', 'Lắp đặt tay vịn cầu thang bằng gỗ tự nhiên', 'Chiều dài tay vịn theo độ dốc thang', 'L = L_nghiêng + L_chiếu_nghỉ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '15.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '15.3.2', 'Tay vịn inox', 'md', 'Lắp đặt tay vịn cầu thang inox', 'Chiều dài tay vịn', 'L = L_nghiêng + L_chiếu_nghỉ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '15.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '15.3.3', 'Tay vịn nhôm đúc', 'md', 'Lắp đặt tay vịn nhôm đúc', 'Chiều dài tay vịn', 'L = L_nghiêng', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '15.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '15.4.1', 'Ốp bậc đá granite', 'm2', 'Ốp bậc thang bằng đá granite', 'Diện tích = Số bậc × (S_mặt + S_cổ)', 'S = n × (l×b + l×h)', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '15.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '15.4.2', 'Ốp bậc gỗ', 'm2', 'Ốp bậc thang bằng gỗ tự nhiên/công nghiệp', 'Diện tích = Số bậc × (S_mặt + S_cổ)', 'S = n × (l×b + l×h)', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '15.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '15.4.3', 'Ốp bậc gạch', 'm2', 'Ốp bậc thang bằng gạch ceramic', 'Diện tích = Số bậc × (S_mặt + S_cổ)', 'S = n × (l×b + l×h)', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '15.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '16.1.1', 'Trần thạch cao phẳng', 'm2', 'Lắp đặt trần thạch cao phẳng 1 lớp', 'Diện tích trần = Diện tích phòng', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '16.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '16.1.2', 'Trần thạch cao giật cấp 1', 'md', 'Lắp đặt trần thạch cao giật cấp 1 tầng', 'Chiều dài viền giật cấp', 'L = P_phòng', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '16.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '16.1.3', 'Trần thạch cao giật cấp 2', 'md', 'Lắp đặt trần thạch cao giật cấp 2 tầng', 'Chiều dài viền giật cấp', 'L = P_phòng', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '16.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '16.1.4', 'Trần thạch cao chịu nước', 'm2', 'Lắp đặt trần thạch cao chịu nước (WC, bếp)', 'Diện tích trần', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '16.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '16.2.1', 'Trần nhựa PVC', 'm2', 'Lắp đặt trần nhựa PVC', 'Diện tích trần', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '16.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '16.2.2', 'Trần nhựa giả gỗ', 'm2', 'Lắp đặt trần nhựa giả gỗ', 'Diện tích trần', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '16.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '16.3.1', 'Trần gỗ tự nhiên', 'm2', 'Lắp đặt trần gỗ tự nhiên', 'Diện tích trần', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '16.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '16.3.2', 'Trần gỗ công nghiệp', 'm2', 'Lắp đặt trần gỗ công nghiệp MDF/HDF', 'Diện tích trần', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '16.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '16.3.3', 'Trần nan gỗ nhựa', 'm2', 'Lắp đặt trần nan gỗ nhựa composite', 'Diện tích trần', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '16.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '16.4.1', 'Trần thả mineral 600x600', 'm2', 'Lắp đặt trần thả tấm khoáng 600×600mm', 'Diện tích trần', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '16.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '16.4.2', 'Trần thả kim loại', 'm2', 'Lắp đặt trần thả kim loại', 'Diện tích trần', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '16.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.1.1', 'Dây điện 1.5mm²', 'md', 'Lắp đặt dây điện đơn 1×1.5mm²', 'Chiều dài dây thực tế + hao hụt 5%', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '17.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.1.2', 'Dây điện 2.5mm²', 'md', 'Lắp đặt dây điện đơn 1×2.5mm²', 'Chiều dài dây thực tế', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '17.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.1.3', 'Dây điện 4.0mm²', 'md', 'Lắp đặt dây điện đơn 1×4.0mm²', 'Chiều dài dây thực tế', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '17.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.1.4', 'Dây điện 6.0mm²', 'md', 'Lắp đặt dây điện đơn 1×6.0mm²', 'Chiều dài dây thực tế', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '17.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.1.5', 'Cáp điện 3x2.5mm²', 'md', 'Lắp đặt cáp điện 3 lõi 3×2.5mm²', 'Chiều dài cáp thực tế', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 5
FROM work_types wt WHERE wt.code = '17.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.2.1', 'Ống PVC Ø16', 'md', 'Lắp đặt ống luồn dây PVC Ø16mm', 'Chiều dài ống thực tế', 'L = L_thực', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '17.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.2.2', 'Ống PVC Ø20', 'md', 'Lắp đặt ống luồn dây PVC Ø20mm', 'Chiều dài ống thực tế', 'L = L_thực', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '17.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.2.3', 'Ống PVC Ø25', 'md', 'Lắp đặt ống luồn dây PVC Ø25mm', 'Chiều dài ống thực tế', 'L = L_thực', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '17.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.2.4', 'Ống ruột gà D16', 'md', 'Lắp đặt ống ruột gà D16mm', 'Chiều dài ống thực tế', 'L = L_thực', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '17.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.3.1', 'Đèn LED âm trần', 'bộ', 'Lắp đặt đèn LED âm trần', 'Số lượng đèn', 'N = Số bộ đèn', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '17.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.3.2', 'Đèn LED panel', 'bộ', 'Lắp đặt đèn LED panel 600×600', 'Số lượng đèn', 'N = Số bộ đèn', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '17.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.3.3', 'Đèn tuýp LED', 'bộ', 'Lắp đặt đèn tuýp LED 1.2m', 'Số lượng đèn', 'N = Số bộ đèn', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '17.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.3.4', 'Đèn thả trang trí', 'bộ', 'Lắp đặt đèn thả trang trí', 'Số lượng đèn', 'N = Số bộ đèn', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '17.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.3.5', 'Đèn gắn tường', 'bộ', 'Lắp đặt đèn gắn tường', 'Số lượng đèn', 'N = Số bộ đèn', '[]'::jsonb, '[]'::jsonb, 5
FROM work_types wt WHERE wt.code = '17.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.4.1', 'Ổ cắm đơn', 'cái', 'Lắp đặt ổ cắm điện đơn', 'Số lượng ổ cắm', 'N = Số cái', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '17.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.4.2', 'Ổ cắm đôi', 'cái', 'Lắp đặt ổ cắm điện đôi', 'Số lượng ổ cắm', 'N = Số cái', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '17.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.4.3', 'Ổ cắm 3 chấu', 'cái', 'Lắp đặt ổ cắm 3 chấu có tiếp địa', 'Số lượng ổ cắm', 'N = Số cái', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '17.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.4.4', 'Công tắc đơn', 'cái', 'Lắp đặt công tắc đơn', 'Số lượng công tắc', 'N = Số cái', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '17.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.4.5', 'Công tắc đôi', 'cái', 'Lắp đặt công tắc đôi', 'Số lượng công tắc', 'N = Số cái', '[]'::jsonb, '[]'::jsonb, 5
FROM work_types wt WHERE wt.code = '17.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.4.6', 'Công tắc ba', 'cái', 'Lắp đặt công tắc ba', 'Số lượng công tắc', 'N = Số cái', '[]'::jsonb, '[]'::jsonb, 6
FROM work_types wt WHERE wt.code = '17.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.5.1', 'Tủ điện tổng', 'bộ', 'Lắp đặt tủ điện tổng', 'Số lượng tủ', 'N = 1', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '17.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.5.2', 'Tủ điện tầng', 'bộ', 'Lắp đặt tủ điện tầng/phòng', 'Số lượng tủ', 'N = Số tầng', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '17.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '17.5.3', 'CB các loại', 'cái', 'Lắp đặt CB (cầu dao tự động)', 'Số lượng CB', 'N = Số cái', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '17.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.1.1', 'Ống PPR Ø20', 'md', 'Lắp đặt ống cấp nước PPR Ø20mm', 'Chiều dài ống thực tế + hao hụt', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '18.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.1.2', 'Ống PPR Ø25', 'md', 'Lắp đặt ống cấp nước PPR Ø25mm', 'Chiều dài ống thực tế', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '18.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.1.3', 'Ống PPR Ø32', 'md', 'Lắp đặt ống cấp nước PPR Ø32mm', 'Chiều dài ống thực tế', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '18.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.1.4', 'Ống inox cấp nước', 'md', 'Lắp đặt ống inox cấp nước', 'Chiều dài ống thực tế', 'L = L_thực', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '18.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.2.1', 'Ống PVC Ø60', 'md', 'Lắp đặt ống thoát nước PVC Ø60mm', 'Chiều dài ống thực tế', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '18.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.2.2', 'Ống PVC Ø90', 'md', 'Lắp đặt ống thoát nước PVC Ø90mm', 'Chiều dài ống thực tế', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '18.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.2.3', 'Ống PVC Ø114', 'md', 'Lắp đặt ống thoát nước PVC Ø114mm', 'Chiều dài ống thực tế', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '18.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.2.4', 'Ống PVC Ø160', 'md', 'Lắp đặt ống thoát nước PVC Ø160mm', 'Chiều dài ống thực tế', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '18.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.2.5', 'Ống PVC Ø200', 'md', 'Lắp đặt ống thoát nước PVC Ø200mm', 'Chiều dài ống thực tế', 'L = L_thực × 1.05', '[]'::jsonb, '[]'::jsonb, 5
FROM work_types wt WHERE wt.code = '18.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.3.1', 'Co, tê các loại', 'cái', 'Lắp đặt phụ kiện co, tê, nối', 'Số lượng phụ kiện', 'N = Số cái', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '18.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.3.2', 'Van nước', 'cái', 'Lắp đặt van khóa nước', 'Số lượng van', 'N = Số cái', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '18.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.3.3', 'Phễu thu sàn', 'cái', 'Lắp đặt phễu thu sàn WC', 'Số lượng phễu', 'N = Số cái', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '18.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.4.1', 'Bồn inox 500L', 'bộ', 'Lắp đặt bồn nước inox 500 lít', 'Số lượng bồn', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '18.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.4.2', 'Bồn inox 1000L', 'bộ', 'Lắp đặt bồn nước inox 1000 lít', 'Số lượng bồn', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '18.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.4.3', 'Bồn inox 1500L', 'bộ', 'Lắp đặt bồn nước inox 1500 lít', 'Số lượng bồn', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '18.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '18.4.4', 'Bồn nhựa PE 500L', 'bộ', 'Lắp đặt bồn nước nhựa PE 500 lít', 'Số lượng bồn', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '18.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.1.1', 'Bồn cầu 1 khối', 'bộ', 'Lắp đặt bồn cầu 1 khối', 'Số lượng bồn cầu', 'N = Số WC', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '19.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.1.2', 'Bồn cầu 2 khối', 'bộ', 'Lắp đặt bồn cầu 2 khối', 'Số lượng bồn cầu', 'N = Số WC', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '19.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.1.3', 'Bồn cầu treo tường', 'bộ', 'Lắp đặt bồn cầu treo tường + két âm', 'Số lượng bồn cầu', 'N = Số WC', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '19.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.1.4', 'Bồn cầu thông minh', 'bộ', 'Lắp đặt bồn cầu thông minh (rửa tự động)', 'Số lượng bồn cầu', 'N = Số WC', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '19.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.2.1', 'Lavabo đặt bàn', 'bộ', 'Lắp đặt lavabo đặt trên bàn', 'Số lượng lavabo', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '19.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.2.2', 'Lavabo âm bàn', 'bộ', 'Lắp đặt lavabo âm dưới bàn đá', 'Số lượng lavabo', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '19.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.2.3', 'Lavabo treo tường', 'bộ', 'Lắp đặt lavabo treo tường', 'Số lượng lavabo', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '19.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.2.4', 'Lavabo chân đứng', 'bộ', 'Lắp đặt lavabo chân đứng', 'Số lượng lavabo', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '19.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.3.1', 'Sen tắm đứng', 'bộ', 'Lắp đặt sen tắm đứng nóng lạnh', 'Số lượng bộ sen', 'N = Số WC có sen', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '19.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.3.2', 'Sen tắm cây', 'bộ', 'Lắp đặt sen cây (có thanh trượt/cố định)', 'Số lượng bộ sen', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '19.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.3.3', 'Vòi lavabo nóng lạnh', 'cái', 'Lắp đặt vòi lavabo nóng lạnh', 'Số lượng vòi', 'N = Số lavabo', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '19.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.3.4', 'Vòi lavabo lạnh', 'cái', 'Lắp đặt vòi lavabo lạnh', 'Số lượng vòi', 'N = Số lavabo', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '19.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.3.5', 'Vòi bếp nóng lạnh', 'cái', 'Lắp đặt vòi rửa bếp nóng lạnh', 'Số lượng vòi', 'N = Số chậu rửa', '[]'::jsonb, '[]'::jsonb, 5
FROM work_types wt WHERE wt.code = '19.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.4.1', 'Gương soi', 'cái', 'Lắp đặt gương soi WC', 'Số lượng gương', 'N = Số WC', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '19.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.4.2', 'Kệ kính', 'cái', 'Lắp đặt kệ kính WC', 'Số lượng kệ', 'N = Số WC', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '19.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.4.3', 'Hộp giấy vệ sinh', 'cái', 'Lắp đặt hộp đựng giấy vệ sinh', 'Số lượng hộp', 'N = Số WC', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '19.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.4.4', 'Vòi xịt vệ sinh', 'cái', 'Lắp đặt vòi xịt vệ sinh', 'Số lượng vòi xịt', 'N = Số WC', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '19.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.5.1', 'Bồn tắm nằm', 'bộ', 'Lắp đặt bồn tắm nằm', 'Số lượng bồn tắm', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '19.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.5.2', 'Bồn tắm đứng', 'bộ', 'Lắp đặt phòng tắm đứng kính', 'Số lượng phòng tắm đứng', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '19.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.5.3', 'Bồn tắm massage', 'bộ', 'Lắp đặt bồn tắm massage/jacuzzi', 'Số lượng bồn', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '19.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.6.1', 'Tủ lavabo gỗ công nghiệp', 'bộ', 'Lắp đặt tủ lavabo gỗ công nghiệp', 'Số lượng tủ', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '19.6'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '19.6.2', 'Tủ lavabo nhựa PVC', 'bộ', 'Lắp đặt tủ lavabo nhựa PVC chịu nước', 'Số lượng tủ', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '19.6'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.1.1', 'Tủ bếp trên', 'md', 'Sản xuất, lắp đặt tủ bếp trên', 'Chiều dài tủ bếp trên (theo md)', 'L = ΣL_tủ_trên', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '20.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.1.2', 'Tủ bếp dưới', 'md', 'Sản xuất, lắp đặt tủ bếp dưới', 'Chiều dài tủ bếp dưới', 'L = ΣL_tủ_dưới', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '20.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.1.3', 'Tủ bếp đảo', 'md', 'Sản xuất, lắp đặt tủ bếp đảo', 'Chiều dài tủ đảo', 'L = P_đảo', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '20.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.1.4', 'Mặt bàn bếp đá', 'md', 'Lắp đặt mặt bàn bếp đá granite/thạch anh', 'Chiều dài mặt bàn', 'L = L_tổng', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '20.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.1.5', 'Mặt bàn bếp gỗ', 'md', 'Lắp đặt mặt bàn bếp gỗ', 'Chiều dài mặt bàn', 'L = L_tổng', '[]'::jsonb, '[]'::jsonb, 5
FROM work_types wt WHERE wt.code = '20.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.2.1', 'Tủ quần áo 2 cánh', 'bộ', 'Sản xuất, lắp đặt tủ quần áo 2 cánh', 'Số lượng tủ', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '20.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.2.2', 'Tủ quần áo 3 cánh', 'bộ', 'Sản xuất, lắp đặt tủ quần áo 3 cánh', 'Số lượng tủ', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '20.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.2.3', 'Tủ quần áo 4 cánh', 'bộ', 'Sản xuất, lắp đặt tủ quần áo 4 cánh', 'Số lượng tủ', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '20.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.2.4', 'Tủ quần áo âm tường', 'm2', 'Sản xuất, lắp đặt tủ âm tường', 'Diện tích mặt tủ = Rộng × Cao', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '20.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.3.1', 'Giường 1m2', 'bộ', 'Sản xuất, lắp đặt giường ngủ 1m2', 'Số lượng giường', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '20.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.3.2', 'Giường 1m4', 'bộ', 'Sản xuất, lắp đặt giường ngủ 1m4', 'Số lượng giường', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '20.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.3.3', 'Giường 1m6', 'bộ', 'Sản xuất, lắp đặt giường ngủ 1m6', 'Số lượng giường', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '20.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.3.4', 'Giường 1m8', 'bộ', 'Sản xuất, lắp đặt giường ngủ 1m8', 'Số lượng giường', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '20.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.4.1', 'Bàn làm việc đơn giản', 'bộ', 'Sản xuất, lắp đặt bàn làm việc đơn giản', 'Số lượng bàn', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '20.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.4.2', 'Bàn làm việc có hộc tủ', 'bộ', 'Sản xuất, lắp đặt bàn làm việc có hộc tủ', 'Số lượng bàn', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '20.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.4.3', 'Bàn học sinh', 'bộ', 'Sản xuất, lắp đặt bàn học sinh', 'Số lượng bàn', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '20.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.5.1', 'Kệ tivi treo tường', 'bộ', 'Sản xuất, lắp đặt kệ tivi treo tường', 'Số lượng kệ', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '20.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.5.2', 'Kệ tivi đứng', 'bộ', 'Sản xuất, lắp đặt kệ tivi đặt sàn', 'Số lượng kệ', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '20.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.5.3', 'Vách tivi trang trí', 'm2', 'Lắp đặt vách tivi trang trí', 'Diện tích vách = Rộng × Cao', 'S = W × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '20.5'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.6.1', 'Tủ giày đứng', 'bộ', 'Sản xuất, lắp đặt tủ giày đứng', 'Số lượng tủ', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '20.6'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '20.6.2', 'Tủ giày treo tường', 'bộ', 'Lắp đặt tủ giày treo tường', 'Số lượng tủ', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '20.6'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.1.1', 'Điều hòa 9000BTU', 'bộ', 'Lắp đặt điều hòa treo tường 9000BTU', 'Số lượng bộ điều hòa', 'N = Số phòng cần lắp', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '21.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.1.2', 'Điều hòa 12000BTU', 'bộ', 'Lắp đặt điều hòa treo tường 12000BTU', 'Số lượng bộ điều hòa', 'N = Số phòng', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '21.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.1.3', 'Điều hòa 18000BTU', 'bộ', 'Lắp đặt điều hòa treo tường 18000BTU', 'Số lượng bộ điều hòa', 'N = Số phòng', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '21.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.1.4', 'Điều hòa 24000BTU', 'bộ', 'Lắp đặt điều hòa treo tường 24000BTU', 'Số lượng bộ điều hòa', 'N = Số phòng', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '21.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.2.1', 'Điều hòa cassette 24000BTU', 'bộ', 'Lắp đặt điều hòa cassette âm trần 24000BTU', 'Số lượng bộ điều hòa', 'N = Số vị trí lắp', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '21.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.2.2', 'Điều hòa cassette 36000BTU', 'bộ', 'Lắp đặt điều hòa cassette âm trần 36000BTU', 'Số lượng bộ điều hòa', 'N = Số vị trí', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '21.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.2.3', 'Điều hòa âm trần nối ống gió', 'bộ', 'Lắp đặt điều hòa âm trần nối ống gió', 'Số lượng bộ điều hòa', 'N = Số vị trí', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '21.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.3.1', 'Điều hòa tủ đứng 36000BTU', 'bộ', 'Lắp đặt điều hòa tủ đứng 36000BTU', 'Số lượng bộ', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '21.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.3.2', 'Điều hòa tủ đứng 48000BTU', 'bộ', 'Lắp đặt điều hòa tủ đứng 48000BTU', 'Số lượng bộ', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '21.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.4.1', 'Dàn nóng VRV', 'bộ', 'Lắp đặt dàn nóng VRV trung tâm', 'Số lượng dàn nóng', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '21.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.4.2', 'Dàn lạnh VRV', 'bộ', 'Lắp đặt dàn lạnh VRV (các loại)', 'Số lượng dàn lạnh', 'N = Số phòng', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '21.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '21.4.3', 'Hệ thống ống đồng', 'md', 'Lắp đặt ống đồng kết nối dàn nóng-lạnh', 'Chiều dài ống đồng', 'L = ΣL_ống', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '21.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.1.1', 'Camera ngoài trời', 'cái', 'Lắp đặt camera quan sát ngoài trời IP66', 'Số lượng camera', 'N = Số vị trí cần giám sát', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '22.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.1.2', 'Camera trong nhà', 'cái', 'Lắp đặt camera quan sát trong nhà', 'Số lượng camera', 'N = Số vị trí', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '22.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.1.3', 'Đầu ghi hình NVR', 'bộ', 'Lắp đặt đầu ghi hình NVR/DVR', 'Số lượng đầu ghi', 'N = 1', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '22.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.1.4', 'Ổ cứng lưu trữ', 'cái', 'Lắp đặt ổ cứng lưu trữ camera', 'Số lượng ổ cứng', 'N = Số ổ cần thiết', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '22.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.2.1', 'Chuông cửa có hình', 'bộ', 'Lắp đặt chuông cửa màn hình video', 'Số lượng bộ', 'N = Số cổng/cửa chính', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '22.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.2.2', 'Chuông cửa thông thường', 'bộ', 'Lắp đặt chuông cửa thông thường', 'Số lượng bộ', 'N = Số cửa', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '22.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.3.1', 'Khóa vân tay', 'bộ', 'Lắp đặt khóa vân tay thông minh', 'Số lượng khóa', 'N = Số cửa cần lắp', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '22.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.3.2', 'Khóa thẻ từ', 'bộ', 'Lắp đặt khóa thẻ từ', 'Số lượng khóa', 'N = Số cửa', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '22.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.3.3', 'Khóa điện tử', 'bộ', 'Lắp đặt khóa điện tử mã số', 'Số lượng khóa', 'N = Số cửa', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '22.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.4.1', 'Công tắc thông minh', 'cái', 'Lắp đặt công tắc thông minh wifi/zigbee', 'Số lượng công tắc', 'N = Số điểm cần điều khiển', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '22.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.4.2', 'Ổ cắm thông minh', 'cái', 'Lắp đặt ổ cắm thông minh wifi', 'Số lượng ổ cắm', 'N = Số điểm', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '22.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.4.3', 'Bộ điều khiển trung tâm', 'bộ', 'Lắp đặt hub điều khiển smarthome', 'Số lượng hub', 'N = 1', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '22.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '22.4.4', 'Cảm biến chuyển động', 'cái', 'Lắp đặt cảm biến chuyển động PIR', 'Số lượng cảm biến', 'N = Số vị trí cần gắn', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '22.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.1.1', 'Lát gạch terrazzo sân', 'm2', 'Lát gạch terrazzo sân vườn', 'Diện tích sân cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '23.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.1.2', 'Lát gạch con sâu', 'm2', 'Lát gạch con sâu lối đi', 'Diện tích lối đi', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '23.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.1.3', 'Lát đá tự nhiên sân', 'm2', 'Lát đá tự nhiên sân vườn', 'Diện tích sân cần lát', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '23.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.1.4', 'Bê tông mặt sân', 'm2', 'Đổ bê tông mặt sân vườn', 'Diện tích sân', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '23.1'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.2.1', 'Hàng rào sắt', 'md', 'Lắp đặt hàng rào sắt hộp', 'Chiều dài hàng rào', 'L = Chu vi khu vực', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '23.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.2.2', 'Hàng rào gỗ', 'md', 'Lắp đặt hàng rào gỗ trang trí', 'Chiều dài hàng rào', 'L = ΣL', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '23.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.2.3', 'Hàng rào xây gạch', 'm2', 'Xây hàng rào gạch + trát', 'Diện tích hàng rào', 'S = L × H', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '23.2'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.3.1', 'Trồng cây bóng mát', 'cây', 'Trồng cây bóng mát (sấu, phượng, bàng...)', 'Số lượng cây', 'N = Số cây', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '23.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.3.2', 'Trồng cây bụi', 'cây', 'Trồng cây bụi trang trí', 'Số lượng cây', 'N = Số cây', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '23.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.3.3', 'Trồng thảm cỏ', 'm2', 'Trồng thảm cỏ nhung/Nhật', 'Diện tích thảm cỏ', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '23.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.3.4', 'Hệ thống tưới tự động', 'm2', 'Lắp đặt hệ thống tưới tự động', 'Diện tích vườn được phủ tưới', 'S = S_vườn', '[]'::jsonb, '[]'::jsonb, 4
FROM work_types wt WHERE wt.code = '23.3'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.4.1', 'Thi công hồ cá koi', 'm3', 'Thi công hồ cá koi (đào, lót, bơm, lọc)', 'Thể tích hồ = Dài × Rộng × Sâu', 'V = L × W × H', '[]'::jsonb, '[]'::jsonb, 1
FROM work_types wt WHERE wt.code = '23.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.4.2', 'Tiểu cảnh sân vườn', 'm2', 'Thi công tiểu cảnh trang trí', 'Diện tích tiểu cảnh', 'S = L × W', '[]'::jsonb, '[]'::jsonb, 2
FROM work_types wt WHERE wt.code = '23.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '23.4.3', 'Thác nước mini', 'bộ', 'Thi công thác nước mini trang trí', 'Số lượng bộ thác', 'N = Số bộ', '[]'::jsonb, '[]'::jsonb, 3
FROM work_types wt WHERE wt.code = '23.4'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;

COMMIT;

-- Verify counts
SELECT 'categories' as table_name, COUNT(*) as count FROM categories
UNION ALL
SELECT 'work_types', COUNT(*) FROM work_types
UNION ALL
SELECT 'work_items', COUNT(*) FROM work_items;