# XSMM Copilot - Design Document

> **Goal:** AI Copilot hỗ trợ QS tính giá thành trong Excel 2019

**Architecture:** Hybrid (xlwings Python + Next.js Web) + FastAPI Backend + Gemini AI + Supabase

---

## Scope

- **Target Users:** QS Team Xhome SG (nội bộ)
- **Main Use Case:** Bóc khối lượng + Tra cứu giá trong Excel
- **Excel Version:** 2019 Desktop

---

## System Architecture

```
┌─────────────┐      ┌─────────────┐      ┌─────────────┐
│  EXCEL 2019 │      │   FastAPI   │      │   Gemini    │
│  + xlwings  │◀────▶│   Backend   │◀────▶│   API       │
│  (Python)   │      │   + RAG     │      │             │
└─────────────┘      └──────┬──────┘      └─────────────┘
                           │
                    ┌──────▼──────┐
                    │  Supabase   │
                    │  • XSMM DB  │
                    │  • Price DB │
                    │  • Projects │
                    └─────────────┘

┌─────────────┐
│  Next.js    │◀── Web Admin + Backup UI
│  Web App    │
└─────────────┘
```

---

## User Flows

### Flow 1: Bóc khối lượng
```
Excel → Ctrl+Shift+X → Chat "bê tông móng 0.4x0.8x45m"
→ AI tính: 14.4 m³, giá ref 820,000/m³
→ [Insert Row] → Điền vào Excel
```

### Flow 2: Tra cứu giá vật liệu
```
"giá gạch 600x600?" → Bảng so sánh brands → Chọn → Insert
```

### Flow 3: So sánh nhà thầu
```
"NC lát gạch?" → So sánh Thầu A/B/C → Suggest tối ưu
```

---

## Database Schema (Mở rộng từ XSMM)

### Existing (XSMM Foundation)
- `categories` - 23 categories
- `work_types` - 106 work types  
- `work_items` - 351 work items

### New Tables

#### `materials`
| Column | Type | Description |
|--------|------|-------------|
| id | UUID | PK |
| category | VARCHAR | Gạch, Sơn, Xi măng... |
| brand | VARCHAR | Vietceramic, Dulux... |
| product_code | VARCHAR | VC-6060A |
| name | VARCHAR | Tên sản phẩm |
| specs | JSONB | size, thickness... |
| unit | VARCHAR | m2, kg... |
| base_price | DECIMAL | Giá niêm yết |
| supplier_id | UUID | FK |

#### `suppliers`
| Column | Type | Description |
|--------|------|-------------|
| id | UUID | PK |
| name | VARCHAR | Tên NCC |
| type | VARCHAR | material/contractor |
| contact | JSONB | phone, email... |
| rating | DECIMAL | 1-5 |

#### `contractors`
| Column | Type | Description |
|--------|------|-------------|
| id | UUID | PK |
| name | VARCHAR | Tên thầu |
| specialty | VARCHAR | Nội thất, Điện... |
| skill_level | VARCHAR | senior/mid/junior |
| rating | DECIMAL | 1-5 |

#### `labor_rates`
| Column | Type | Description |
|--------|------|-------------|
| id | UUID | PK |
| work_item_code | VARCHAR | FK → XSMM |
| contractor_id | UUID | FK |
| rate_per_unit | DECIMAL | Đơn giá |
| valid_from | DATE | Hiệu lực từ |
| region | VARCHAR | HCM/Tỉnh |

#### `projects`
| Column | Type | Description |
|--------|------|-------------|
| id | UUID | PK |
| name | VARCHAR | Tên dự án |
| client | VARCHAR | Khách hàng |
| status | VARCHAR | quoting/active/done |

#### `project_boq_items`
| Column | Type | Description |
|--------|------|-------------|
| id | UUID | PK |
| project_id | UUID | FK |
| work_item_code | VARCHAR | FK → XSMM |
| quantity | DECIMAL | Khối lượng |
| material_id | UUID | VL đã chọn |
| contractor_id | UUID | Thầu đã chọn |
| total_price | DECIMAL | Thành tiền |

---

## Implementation Roadmap

### Phase 1: Foundation (2 tuần)
- [ ] Tạo tables mới trên Supabase
- [ ] FastAPI endpoints CRUD
- [ ] Web Admin quản lý VL, Thầu, Giá

### Phase 2: AI Copilot Core (3 tuần)
- [ ] RAG setup với LangChain
- [ ] Gemini AI Agent + Tools
- [ ] Web Chat UI test

### Phase 3: Excel Integration (2 tuần)
- [ ] xlwings + Python bridge
- [ ] Copilot Panel (Ctrl+Shift+X)
- [ ] Insert actions vào cells

### Phase 4: Optimization (ongoing)
- [ ] Lưu BOQ history
- [ ] Price trending
- [ ] Smart suggestions

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| Excel Plugin | xlwings + Python 3.11 |
| Backend | FastAPI + LangChain |
| Database | Supabase (PostgreSQL) |
| Frontend | Next.js 14 + Tailwind |
| AI | Gemini API + RAG |

---

## Timeline

```
Tuần 1-2: Foundation (DB + API + Admin)
Tuần 3-5: AI Copilot (RAG + Chat)
Tuần 6-7: Excel Integration
Tuần 8+:  Optimization
```
