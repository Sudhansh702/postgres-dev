# 🚀 Running Services Status

## ✅ Services Status

| Service | Port | Status | Database | Notes |
|---------|------|--------|----------|-------|
| **homepage-api** | 8085 | ✅ **RUNNING** | homepage_db | Connected to PostgreSQL ✅ |
| **order-service** | 8083 | ⏳ Starting | orderdb | Needs Redis (optional) |
| **product-catalog-service** | 8080 | ⏳ Starting | product_catalog | Starting... |

---

## 🎯 Service Details

### ✅ homepage-api
- **Status:** RUNNING
- **Port:** 8085
- **Health Check:** http://localhost:8085/actuator/health
- **Database:** homepage_db
- **Profile:** local
- **Log:** /tmp/homepage-api.log

### ⏳ order-service  
- **Status:** Starting (takes 30-60 seconds)
- **Port:** 8083
- **Health Check:** http://localhost:8083/api/v1/actuator/health
- **Database:** orderdb
- **Profile:** local
- **Issue:** Redis not running (optional, doesn't block service)
- **Log:** /tmp/order-service.log

### ⏳ product-catalog-service
- **Status:** Starting (takes 20-40 seconds)
- **Port:** 8080
- **Health Check:** http://localhost:8080/actuator/health
- **Database:** product_catalog
- **Log:** /tmp/product-catalog.log

---

## 📊 How to Check Status

### Check if services are running:
```bash
# homepage-api
curl http://localhost:8085/actuator/health

# order-service
curl http://localhost:8083/api/v1/actuator/health

# product-catalog-service
curl http://localhost:8080/actuator/health
```

### View logs:
```bash
# homepage-api logs
tail -f /tmp/homepage-api.log

# order-service logs
tail -f /tmp/order-service.log

# product-catalog logs
tail -f /tmp/product-catalog.log
```

### Check processes:
```bash
ps aux | grep "spring-boot"
```

---

## 🔧 Management Commands

### Start PostgreSQL (if needed):
```bash
cd /Users/mac/Documents/Kubits/postgres-dev
./start.sh
```

### Restart a service:
```bash
# Kill existing process
lsof -ti:8085 | xargs kill -9  # homepage-api
lsof -ti:8083 | xargs kill -9  # order-service
lsof -ti:8080 | xargs kill -9  # product-catalog

# Restart
cd /Users/mac/Documents/Kubits/homepage-api && nohup mvn spring-boot:run -Dspring-boot.run.profiles=local -DskipTests > /tmp/homepage-api.log 2>&1 &
cd /Users/mac/Documents/Kubits/order-service && nohup mvn spring-boot:run -Dspring-boot.run.profiles=local -DskipTests > /tmp/order-service.log 2>&1 &
cd /Users/mac/Documents/Kubits/product-catalog-service && nohup mvn spring-boot:run -DskipTests > /tmp/product-catalog.log 2>&1 &
```

### Stop all services:
```bash
lsof -ti:8085,8083,8080 | xargs kill -9
```

### Check PostgreSQL:
```bash
docker ps | grep postgres
```

---

## ⚠️ Notes

### order-service and Redis
- order-service is marked "DOWN" because Redis is not installed
- Redis is optional for development
- The service will still work without Redis
- Database connection is working ✅

### Service Startup Time
- homepage-api: ~10 seconds ✅
- order-service: ~30-60 seconds
- product-catalog-service: ~20-40 seconds

Be patient! Services take time to compile and start.

---

## 🎯 Quick Status Check

```bash
# Check all services at once
echo "homepage-api (8085):" && curl -s http://localhost:8085/actuator/health | grep -o '"status":"[^"]*"' || echo "❌"
echo "order-service (8083):" && curl -s http://localhost:8083/api/v1/actuator/health | grep -o '"status":"[^"]*"' || echo "❌"
echo "product-catalog (8080):" && curl -s http://localhost:8080/actuator/health | grep -o '"status":"[^"]*"' || echo "❌"
```

