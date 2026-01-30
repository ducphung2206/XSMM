# XSMM Copilot

> AI Copilot hỗ trợ QS tính giá thành trong Excel 2019

## 🏗️ Kiến trúc

```
┌─────────────┐      ┌─────────────┐      ┌─────────────┐
│  Excel 2019 │      │   FastAPI   │      │   Gemini    │
│  + xlwings  │◀────▶│   Backend   │◀────▶│   API       │
└─────────────┘      └──────┬──────┘      └─────────────┘
       │                    │
       │              ┌──────▼──────┐
       │              │  PostgreSQL │
       │              │  (Docker)   │
       │              └─────────────┘
       │
       └────────────▶ ┌─────────────┐
                      │  Next.js    │
                      │  Web Admin  │
                      └─────────────┘
```

## 🚀 Quick Start

### 1. Setup Environment

```bash
# Copy env file
cp .env.example .env

# Edit .env với thông tin thực
# - POSTGRES_PASSWORD
# - GEMINI_API_KEY
```

### 2. Start Services (Docker)

```bash
# Start PostgreSQL + API + Web
docker compose up -d

# Với pgAdmin (dev only)
docker compose --profile dev up -d
```

### 3. Access

| Service | URL | Description |
|---------|-----|-------------|
| **Web Admin** | http://localhost:3000 | UI quản lý, AI Chat |
| **API Docs** | http://localhost:8000/docs | Swagger docs |
| **Health** | http://localhost:8000/health | API health check |
| **pgAdmin** | http://localhost:5050 | Database GUI (dev) |

## 📁 Project Structure

```
XSMM/
├── api/                    # FastAPI Backend
│   ├── app/
│   │   ├── core/          # Config, Database
│   │   ├── models/        # SQLAlchemy & Pydantic
│   │   ├── routers/       # API Endpoints
│   │   │   ├── work_items.py
│   │   │   ├── materials.py
│   │   │   ├── contractors.py
│   │   │   ├── labor_rates.py
│   │   │   └── copilot.py    # AI Chat endpoints
│   │   └── services/
│   │       └── copilot.py    # LangChain + Gemini
│   ├── Dockerfile
│   └── requirements.txt
│
├── web/                    # Next.js Web Admin
│   ├── src/app/
│   │   ├── page.tsx       # Dashboard + Tabs
│   │   ├── layout.tsx
│   │   └── globals.css
│   ├── Dockerfile
│   └── package.json
│
├── init-scripts/          # PostgreSQL init (auto-run)
│   ├── 01-xsmm-schema.sql
│   ├── 02-copilot-schema.sql
│   ├── 03-xsmm-data.sql
│   └── 04-copilot-data.sql
│
├── data/                  # XSMM JSON data
├── database/              # SQL source files
├── docker-compose.yml
└── .env.example
```

## 📚 API Endpoints

### Work Items (XSMM)
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/work-items/` | List work items |
| GET | `/api/v1/work-items/{code}` | Get by code |
| GET | `/api/v1/work-items/search/?q=` | Search |

### Materials
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/materials/` | List materials |
| POST | `/api/v1/materials/` | Create |
| PATCH | `/api/v1/materials/{id}` | Update |
| GET | `/api/v1/materials/search/?q=` | Search |

### Contractors
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/contractors/` | List contractors |
| POST | `/api/v1/contractors/` | Create |
| PATCH | `/api/v1/contractors/{id}` | Update |

### Labor Rates
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/labor-rates/` | List rates |
| GET | `/api/v1/labor-rates/compare?work_item_code=` | Compare |
| POST | `/api/v1/labor-rates/` | Create |

### AI Copilot
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/v1/copilot/chat` | Chat with AI |
| GET | `/api/v1/copilot/lookup/{code}` | Quick lookup |
| POST | `/api/v1/copilot/calculate` | Calculate quantity |
| GET | `/api/v1/copilot/suggestions?query=` | Autocomplete |

## 🛠️ Development

### API Backend (without Docker)

```bash
cd api

# Create virtual env
python -m venv venv
venv\Scripts\activate  # Windows

# Install dependencies
pip install -r requirements.txt

# Run
uvicorn app.main:app --reload
```

### Web Frontend (without Docker)

```bash
cd web

# Install dependencies
npm install

# Run dev server
npm run dev
```

## 🚢 Deploy to Synology NAS

1. Copy project to NAS
2. Create `.env` với production values
3. Run:
```bash
docker compose up -d
```

4. (Optional) Setup Nginx Proxy Manager:
   - xsmm.xhome.local → localhost:3000

## 📝 Features

- ✅ **Dashboard** - Tổng quan hệ thống
- ✅ **Materials** - CRUD vật liệu xây dựng
- ✅ **Work Items** - 351 công tác XSMM
- ✅ **AI Copilot** - Chat hỗ trợ QS
- ⏳ **Contractors** - Quản lý nhà thầu
- ⏳ **Labor Rates** - So sánh đơn giá
- ⏳ **Excel Integration** - xlwings bridge

## 📄 License

Internal use - Xhome SG
