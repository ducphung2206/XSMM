"""
XSMM Copilot - Simple Test Server
Chạy API server đơn giản để test (không cần PostgreSQL)
"""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="XSMM Copilot - Test Mode",
    version="1.0.0",
    description="Test server without database",
)

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def root():
    return {
        "name": "XSMM Copilot",
        "version": "1.0.0",
        "status": "running",
        "mode": "test (no database)",
        "docs": "/docs",
    }

@app.get("/health")
def health():
    return {
        "status": "healthy",
        "database": "not connected (test mode)",
    }

@app.get("/api/v1/work-items/count")
def count_work_items():
    """Mock endpoint - trả về số lượng work items"""
    return {"count": 351}

@app.get("/api/v1/work-items/search/")
def search_work_items(q: str = "", limit: int = 20):
    """Mock endpoint - trả về kết quả tìm kiếm mẫu"""
    mock_items = [
        {
            "id": "1",
            "code": "CT.04.01.01",
            "name": "Bê tông móng dải B15",
            "unit": "m³",
            "description": "Thi công bê tông móng dải cấp độ bền B15",
        },
        {
            "id": "2",
            "code": "CT.07.01.01",
            "name": "Xây tường gạch đỏ 220mm",
            "unit": "m²",
            "description": "Xây tường gạch đỏ dày 220mm",
        },
        {
            "id": "3",
            "code": "CT.08.01.01",
            "name": "Trát tường vữa xi măng",
            "unit": "m²",
            "description": "Trát tường bằng vữa xi măng",
        },
    ]
    
    # Filter by query
    if q:
        results = [item for item in mock_items if q.lower() in item["name"].lower() or q.lower() in item["code"].lower()]
    else:
        results = mock_items
    
    return results[:limit]

@app.get("/api/v1/materials/")
def list_materials(search: str = "", limit: int = 50):
    """Mock endpoint - danh sách vật liệu"""
    mock_materials = [
        {
            "id": "1",
            "name": "Gạch Vietceramic 600x600",
            "brand": "Vietceramic",
            "product_code": "VC-600",
            "unit": "viên",
            "base_price": 85000,
            "current_price": 85000,
            "is_active": True,
        },
        {
            "id": "2",
            "name": "Sơn Dulux Inspire 5L",
            "brand": "Dulux",
            "product_code": "DLX-INS-5L",
            "unit": "thùng",
            "base_price": 1250000,
            "current_price": 1250000,
            "is_active": True,
        },
    ]
    
    if search:
        results = [m for m in mock_materials if search.lower() in m["name"].lower()]
    else:
        results = mock_materials
    
    return results[:limit]

@app.post("/api/v1/copilot/chat")
def copilot_chat(request: dict):
    """Mock AI chat endpoint"""
    message = request.get("message", "")
    
    return {
        "message": f"✅ Test mode: Đã nhận câu hỏi '{message}'. Để sử dụng AI thật, cần:\n1. Thêm GEMINI_API_KEY vào .env\n2. Chạy docker compose up -d để có database",
        "suggestions": [],
        "calculations": {},
        "actions": [],
    }

if __name__ == "__main__":
    import uvicorn
    print("\n" + "="*50)
    print("🚀 XSMM Copilot - Test Server")
    print("="*50)
    print("\n📍 URLs:")
    print("   - API: http://localhost:8000")
    print("   - Docs: http://localhost:8000/docs")
    print("   - Health: http://localhost:8000/health")
    print("\n⚠️  Test mode - không có database")
    print("   Để chạy đầy đủ: docker compose up -d")
    print("\n" + "="*50 + "\n")
    
    uvicorn.run(app, host="0.0.0.0", port=8000)
