# XSMM Copilot - Hướng dẫn chạy thử

## ✅ Server đang chạy!

API server đã khởi động thành công tại:
- **API**: http://localhost:8000
- **Docs**: http://localhost:8000/docs
- **Health**: http://localhost:8000/health

---

## 🧪 Test API

### 1. Mở Swagger Docs

Mở browser và truy cập: **http://localhost:8000/docs**

Bạn sẽ thấy giao diện Swagger UI với các endpoints:

- `GET /` - API info
- `GET /health` - Health check
- `GET /api/v1/work-items/count` - Đếm work items
- `GET /api/v1/work-items/search/` - Tìm kiếm
- `GET /api/v1/materials/` - Danh sách vật liệu
- `POST /api/v1/copilot/chat` - AI chat (mock)

### 2. Test từ Browser

**Test 1: Health Check**
```
http://localhost:8000/health
```

**Test 2: Tìm công tác**
```
http://localhost:8000/api/v1/work-items/search/?q=bê tông
```

**Test 3: Danh sách vật liệu**
```
http://localhost:8000/api/v1/materials/
```

### 3. Test từ PowerShell

```powershell
# Health check
Invoke-RestMethod http://localhost:8000/health

# Search work items
Invoke-RestMethod "http://localhost:8000/api/v1/work-items/search/?q=bê tông"

# List materials
Invoke-RestMethod http://localhost:8000/api/v1/materials/
```

---

## ⚠️ Test Mode

Server hiện đang chạy **test mode** với mock data:
- Không cần PostgreSQL
- Trả về dữ liệu mẫu
- AI chat chỉ echo message

### Để chạy full version:

1. **Mở Docker Desktop**
2. Chạy:
```bash
docker compose up -d
```

---

## 🛑 Dừng Server

Nhấn `Ctrl+C` trong terminal đang chạy server.

---

## 📊 Kết quả mong đợi

### GET /health
```json
{
  "status": "healthy",
  "database": "not connected (test mode)"
}
```

### GET /api/v1/work-items/search/?q=bê tông
```json
[
  {
    "id": "1",
    "code": "CT.04.01.01",
    "name": "Bê tông móng dải B15",
    "unit": "m³",
    "description": "Thi công bê tông móng dải cấp độ bền B15"
  }
]
```

### GET /api/v1/materials/
```json
[
  {
    "id": "1",
    "name": "Gạch Vietceramic 600x600",
    "brand": "Vietceramic",
    "unit": "viên",
    "base_price": 85000,
    "current_price": 85000
  },
  {
    "id": "2",
    "name": "Sơn Dulux Inspire 5L",
    "brand": "Dulux",
    "unit": "thùng",
    "base_price": 1250000,
    "current_price": 1250000
  }
]
```
