# XSMM Copilot - Excel Integration

> xlwings bridge kết nối Excel 2019 với XSMM Copilot API

## 🚀 Cài đặt

### Yêu cầu
- Python 3.9+
- Excel 2019 (Windows)
- Docker (cho API backend)

### Bước 1: Chạy API Backend

```bash
cd D:\AGENT PROJECTS\XSMM
docker compose up -d
```

### Bước 2: Cài đặt xlwings

```bash
cd excel
pip install -r requirements.txt
xlwings addin install
```

Hoặc chạy script:
```bash
install.bat
```

### Bước 3: Cấu hình Excel

1. Mở Excel
2. File > Options > Add-ins
3. Manage: Excel Add-ins > Go
4. Check ☑ xlwings
5. OK

## 📊 Sử dụng

### UDF Functions (User Defined Functions)

| Function | Mô tả | Ví dụ |
|----------|-------|-------|
| `xsmm_search` | Tìm công tác | `=xsmm_search("sơn tường")` |
| `xsmm_lookup` | Tra cứu mã | `=xsmm_lookup("CT.08.01.01")` |
| `xsmm_rates` | So sánh đơn giá | `=xsmm_rates("CT.07.01.01")` |
| `xsmm_calc` | Tính khối lượng | `=xsmm_calc("CT.04.01.01", 10, 5, 0.2)` |
| `xsmm_materials` | Tìm vật liệu | `=xsmm_materials("gạch 600")` |

### VBA Macros

| Macro | Chức năng | Shortcut |
|-------|-----------|----------|
| `show_copilot` | Mở web chat | Ctrl+Alt+X |
| `insert_work_item` | Chèn công tác | Ctrl+Shift+I |
| `refresh_prices` | Cập nhật giá | Ctrl+Shift+R |

## 📝 Ví dụ sử dụng

### 1. Tìm công tác bê tông

```
=xsmm_search("bê tông móng")
```

Kết quả:
| Mã | Tên công tác | Đơn vị |
|----|--------------|--------|
| CT.04.01.01 | Bê tông móng dải | m³ |
| CT.04.01.02 | Bê tông móng cọc | m³ |

### 2. Tra cứu và lấy đơn giá

```
=xsmm_lookup("CT.04.01.01")
```

### 3. Tính khối lượng

```
=xsmm_calc("CT.04.01.01", 20, 0.4, 0.8)
```

Kết quả: `6.4 m³ (Bê tông móng dải)`

### 4. So sánh nhà thầu

```
=xsmm_rates("CT.07.01.01", "HCM")
```

Kết quả:
| Nhà thầu | Đơn giá | Rating |
|----------|---------|--------|
| Thầu Minh | 250,000 | 4.8 |
| Thầu Tuấn | 280,000 | 4.5 |
| → Gợi ý: Thầu Minh | 250,000 | Giá thấp nhất |

## 🔧 Troubleshooting

### UDF không hiển thị
1. Đảm bảo đã `xlwings addin install`
2. Restart Excel
3. Check xlwings Add-in đã enable

### Lỗi kết nối API
1. Chạy `docker compose ps` kiểm tra containers
2. Test: http://localhost:8000/health
3. Check firewall cho port 8000

### Python errors
1. Check Python version: `python --version`
2. Re-install: `pip install -r requirements.txt`

## 📁 Files

```
excel/
├── xsmm_copilot.py    # Main bridge code
├── xlwings.conf       # Configuration
├── requirements.txt   # Python deps
├── install.bat        # Windows installer
└── README.md          # This file
```

## 🔗 Links

- [xlwings Documentation](https://docs.xlwings.org)
- [XSMM API Docs](http://localhost:8000/docs)
- [Web Admin](http://localhost:3000)
