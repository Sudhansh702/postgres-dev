# homepage-api (port 8085)
cd /Users/mac/Documents/Kubits/homepage-api
mvn spring-boot:run -Dspring-boot.run.profiles=local

# product-catalog-service (port 8080)
cd /Users/mac/Documents/Kubits/product-catalog-service
mvn spring-boot:run

# Notification-service (port 8088)
cd /Users/mac/Documents/Kubits/order-service
mvn spring-boot:run 

# order-service (port 8083)
cd /Users/mac/Documents/Kubits/order-service
mvn spring-boot:run -Dspring-boot.run.profiles=local


# Run all services sequentially (each waits for the previous to finish)
cd /Users/mac/Documents/Kubits/homepage-api && mvn spring-boot:run -Dspring-boot.run.profiles=local && \
cd /Users/mac/Documents/Kubits/product-catalog-service && mvn spring-boot:run && \
cd /Users/mac/Documents/Kubits/order-service && mvn spring-boot:run && \
cd /Users/mac/Documents/Kubits/order-service && mvn spring-boot:run -Dspring-boot.run.profiles=local

# (The below will run after all above finished)
echo "All main services finished, you can now continue with any next steps below."











# 🐘 PostgreSQL Development Setup

**Easy PostgreSQL with Docker - Minimal Commands!**

---

## 🚀 Quick Start (3 Steps!)

```bash
cd /Users/mac/Documents/Kubits/postgres-dev
./start.sh
```

That's it! PostgreSQL is running.

---

## 📊 View Your Data (Choose One Method)

### Option 1: **TablePlus** (Easiest - Visual)
1. Download: https://tableplus.com/download
2. Install it
3. Connect:
   - Type: `postgresql`
   - Host: `localhost`
   - User: `postgres`
   - Password: `postgres`
   - Database: (pick any)
4. 🎉 See all your data visually!

### Option 2: Command Line
```bash
./show-data.sh
# Now you're in PostgreSQL. Type:
# SELECT * FROM users;
# \dt  (list tables)
# \q   (quit)
```

---

## 🎯 Common Commands

| What You Want | Command |
|---------------|---------|
| Start PostgreSQL | `./start.sh` |
| Stop PostgreSQL | `./stop.sh` |
| View data | `./show-data.sh` |
| List databases | `./list-dbs.sh` |
| Create new database | `./new-db.sh` |
| Create new user | `./new-user.sh` |
| List users | `./list-users.sh` |

---

## 🗄️ Pre-Created Databases

These are ready to use:
- `homepage_api` - For your homepage-api project
- `product_catalog` - For your product-catalog-service
- `order_service` - For your order-service

---

## 🔧 More Commands

### Connect to specific database:
```bash
docker exec -it postgres-dev psql -U postgres -d homepage_api
```

### Create a table:
```sql
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);
```

### Insert data:
```sql
INSERT INTO users (name, email) VALUES ('John', 'john@example.com');
```

### View all tables:
```sql
\dt
```

### Describe table structure:
```sql
\d users
```

---

## 🎨 Install TablePlus (Recommended!)

**Best GUI for seeing your data:**

1. Download: https://tableplus.com/download
2. Install
3. Add connection:
   - Name: `Local PostgreSQL`
   - Type: PostgreSQL
   - Host: `localhost`
   - Port: `5432`
   - User: `postgres`
   - Password: `postgres`
4. Click "Connect"
5. 🎉 See all your databases and data!

---

## 📝 For Your Java Projects

Update your `.env` files:

### homepage-api:
```env
DB_URL=jdbc:postgresql://localhost:5432/homepage_api
DB_USERNAME=postgres
DB_PASSWORD=postgres
```

### product-catalog-service:
```env
DATABASE_URL=postgresql://localhost:5432/product_catalog
DB_USER=postgres
DB_PASSWORD=postgres
```

### order-service:
```env
DATABASE_URL=postgresql://localhost:5432/order_service
DB_USER=postgres
DB_PASSWORD=postgres
```

---

## 🔄 Reset Everything

If you want to start fresh:
```bash
docker-compose down -v
./start.sh
```

---

## 💡 Pro Tips

1. **Always install TablePlus** - Best way to see your data
2. Use `./start.sh` every time you code
3. Use `./stop.sh` when you're done
4. Use `./new-db.sh` for new projects
5. Check `./list-dbs.sh` to see all databases

---

## 🆘 Need Help?

```bash
# Check if PostgreSQL is running
docker ps

# View logs
docker-compose logs -f

# Connect directly
docker exec -it postgres-dev psql -U postgres
```

