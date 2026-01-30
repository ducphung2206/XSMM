# XSMM Copilot - NAS Deployment Guide

> **Target Platform**: Synology NAS (Docker)  
> **Prerequisites**: SSH access, Docker installed

---

## Quick Start

### 1. Prepare NAS Environment

```bash
# SSH vào NAS
ssh admin@192.168.100.167

# Tạo project directory
mkdir -p /volume1/docker/xsmm
cd /volume1/docker/xsmm
```

---

### 2. Upload Project Files

**Option A: Git Clone**
```bash
git clone https://github.com/ducphung2206/XSMM.git .
```

**Option B: SFTP Upload**
- Sử dụng FileZilla/WinSCP
- Upload toàn bộ project folder vào `/volume1/docker/xsmm/`

---

### 3. Configure Environment

```bash
# Copy environment template
cp .env.example .env

# Edit với nano hoặc vi
nano .env
```

**Required values:**
```bash
POSTGRES_PASSWORD=<strong_password_here>
GEMINI_API_KEY=<your_gemini_key>
DATABASE_URL=postgresql://xsmm:<strong_password_here>@postgres:5432/xsmm_copilot
```

---

### 4. Update Volume Mounts (Production)

Edit `docker-compose.yml`, uncomment NAS volume paths:

```yaml
# PostgreSQL
volumes:
  - /volume1/docker/xsmm/postgres_data:/var/lib/postgresql/data  # Uncomment this
  # - postgres_data:/var/lib/postgresql/data  # Comment out named volume

# pgAdmin
volumes:
  - /volume1/docker/xsmm/pgadmin_data:/var/lib/pgadmin  # Uncomment this
  # - pgadmin_data:/var/lib/pgadmin  # Comment out named volume
```

---

### 5. Deploy Stack

```bash
# Start all services
docker compose up -d

# Check status
docker compose ps

# View logs
docker compose logs -f
```

**Expected output:**
```
✅ xsmm-postgres   healthy
✅ xsmm-api        healthy
✅ xsmm-web        running
```

---

### 6. Verify Deployment

#### Database Health
```bash
docker compose exec postgres psql -U xsmm -d xsmm_copilot -c "SELECT version();"
```

#### API Health
```bash
curl http://localhost:8000/health
```

**Expected response:**
```json
{
  "status": "healthy",
  "database": "connected"
}
```

#### Web UI
Open browser: `http://<nas-ip>:3000`

---

## Accessing Services

| Service | URL | Credentials |
|---------|-----|-------------|
| **Web Admin** | `http://<nas-ip>:3000` | - |
| **API Docs** | `http://<nas-ip>:8000/docs` | - |
| **pgAdmin** | `http://<nas-ip>:5050` | From `.env` |
| **PostgreSQL** | `<nas-ip>:5432` | From `.env` |

---

## Reverse Proxy Setup (Optional)

### Nginx Proxy Manager

**Web Admin:**
- Domain: `xsmm.xhome.sg`
- Forward to: `xsmm-web:3000`
- SSL: Cloudflare Tunnel

**API:**
- Domain: `xsmm-api.xhome.sg`
- Forward to: `xsmm-api:8000`
- SSL: Cloudflare Tunnel

---

## Maintenance

### View Logs
```bash
# All services
docker compose logs -f

# Specific service
docker compose logs -f api
docker compose logs -f postgres
```

### Restart Services
```bash
# Restart all
docker compose restart

# Restart specific
docker compose restart api
```

### Update Application
```bash
# Pull latest code
git pull origin main

# Rebuild and restart
docker compose up -d --build
```

### Backup Database
```bash
# Export database
docker compose exec postgres pg_dump -U xsmm xsmm_copilot > backup_$(date +%Y%m%d).sql

# Copy to safe location
cp backup_*.sql /volume1/backups/xsmm/
```

### Restore Database
```bash
# Import backup
docker compose exec -T postgres psql -U xsmm -d xsmm_copilot < backup_20260130.sql
```

---

## Troubleshooting

### Container won't start
```bash
# Check logs
docker compose logs postgres

# Common issue: permission denied
sudo chown -R 999:999 /volume1/docker/xsmm/postgres_data
```

### Database connection failed
```bash
# Verify PostgreSQL is running
docker compose exec postgres pg_isready -U xsmm

# Check connection string in .env
cat .env | grep DATABASE_URL
```

### API returns 500 errors
```bash
# Check API logs
docker compose logs api

# Verify database schema
docker compose exec postgres psql -U xsmm -d xsmm_copilot -c "\dt"
```

---

## Resource Monitoring

```bash
# Container stats
docker stats xsmm-postgres xsmm-api xsmm-web

# Disk usage
du -sh /volume1/docker/xsmm/postgres_data
```

**Expected resource usage:**
- PostgreSQL: ~512MB RAM, 0.5 CPU
- API: ~256MB RAM, 0.3 CPU
- Web: ~256MB RAM, 0.2 CPU

---

## Security Checklist

- [ ] Strong passwords in `.env`
- [ ] `.env` file permissions: `chmod 600 .env`
- [ ] Firewall rules: Only allow internal network
- [ ] Regular backups enabled
- [ ] SSL certificates via Cloudflare Tunnel
- [ ] No port forwarding on router
