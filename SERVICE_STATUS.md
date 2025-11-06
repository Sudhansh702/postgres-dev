# 🔍 Service Status & Issues Analysis

## ✅ homepage-api (WORKING!)
- **Status:** Running successfully
- **Port:** 8085
- **Issue:** Was missing `freedom_schema` 
- **Fix:** Created schema ✅
- **Health Check:** http://localhost:8085/actuator/health

**Test it:**
```bash
curl http://localhost:8085/actuator/health
```

---

## ⚠️ order-service (RUNNING - needs verification)
- **Status:** Starting...
- **Port:** 8083
- **Issue:** Password authentication errors (likely resolved now)
- **Fix:** Updated to use local profile with postgres/postgres credentials
- **Local Profile:** Created `application-local.properties`

**Test it:**
```bash
# Wait for it to fully start (can take 20-30 seconds)
sleep 20
curl http://localhost:8083/api/v1/actuator/health
```

---

## ❓ product-catalog-service (NOT TESTED YET)
- **Status:** Not started yet
- **Port:** 8080
- **Configuration:** Already updated to use local PostgreSQL
- **Issue:** Tests were failing (separate issue, not database related)

---

## 📊 What Was Wrong?

### Issue 1: Missing Schema (homepage-api)
**Problem:**
```
ERROR: schema "freedom_schema" does not exist
```

**Fix Applied:**
```sql
CREATE SCHEMA IF NOT EXISTS freedom_schema;
```

---

### Issue 2: Wrong Profile/Password (order-service)
**Problem:**
```
FATAL: password authentication failed for user "postgres"
```

**Why:**
The service was using `application-dev.properties` which has Azure database URLs, not local PostgreSQL.

**Fix Applied:**
1. Changed active profile from `dev` to `local`
2. Created `application-local.properties` with correct local credentials
3. Updated `application.yml` to use local profile by default

---

## 🚀 How to Run Services

### Start PostgreSQL:
```bash
cd /Users/mac/Documents/Kubits/postgres-dev
./start.sh
```

### Run homepage-api:
```bash
cd /Users/mac/Documents/Kubits/homepage-api
mvn spring-boot:run -Dspring-boot.run.profiles=local -DskipTests
```

### Run order-service:
```bash
cd /Users/mac/Documents/Kubits/order-service
mvn spring-boot:run -Dspring-boot.run.profiles=local -DskipTests
```

### Run product-catalog-service:
```bash
cd /Users/mac/Documents/Kubits/product-catalog-service
mvn spring-boot:run -DskipTests
```

---

## 🔧 Summary of Changes Made

1. ✅ Created `freedom_schema` in `homepage_db` database
2. ✅ Created `application-local.properties` for order-service
3. ✅ Updated homepage-api to use postgres/postgres credentials
4. ✅ Updated product-catalog-service to use postgres/postgres credentials
5. ✅ Updated order-service to use postgres/postgres credentials
6. ✅ Set order-service to use `local` profile by default

---

## 📋 Current Status

| Service | Database | Status | Port |
|---------|----------|--------|------|
| homepage-api | homepage_db | ✅ Running | 8085 |
| order-service | orderdb | ⏳ Starting | 8083 |
| product-catalog-service | product_catalog | ❓ Not started | 8080 |

---

## 🎯 Next Steps

1. Wait for order-service to fully start (~30 seconds)
2. Test all endpoints
3. Run product-catalog-service if needed
4. Install DBeaver to view databases visually

---

## 🆘 Common Issues

### "schema does not exist"
**Solution:** The schema needs to be created first:
```bash
docker exec postgres-dev psql -U postgres -d DATABASE_NAME -c "CREATE SCHEMA IF NOT EXISTS freedom_schema;"
```

### "password authentication failed"
**Solution:** Make sure you're using the `local` profile and correct credentials (postgres/postgres)

### "Connection refused"
**Solution:** Make sure PostgreSQL is running:
```bash
cd /Users/mac/Documents/Kubits/postgres-dev
./start.sh
```

