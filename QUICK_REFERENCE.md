# 🎯 PostgreSQL Quick Reference

## ✅ You're All Set!

PostgreSQL is running at **localhost:5432**

**Databases Created:**
- ✅ `homepage_api`
- ✅ `product_catalog` 
- ✅ `order_service`

**Credentials:**
- Username: `postgres`
- Password: `postgres`

---

## 🚀 Minimal Commands (Copy & Paste!)

### Start PostgreSQL:
```bash
cd /Users/mac/Documents/Kubits/postgres-dev
./start.sh
```

### Stop PostgreSQL:
```bash
./stop.sh
```

### View Your Data:
```bash
./show-data.sh
```
(Then type SQL like: `SELECT * FROM users;`)

### Create New Database:
```bash
./new-db.sh
```

### List All Databases:
```bash
./list-dbs.sh
```

### Create New User:
```bash
./new-user.sh
```

---

## 🎨 **BEST WAY TO SEE YOUR DATA: Install TablePlus**

### Download & Install:
1. Go to: https://tableplus.com/download
2. Download TablePlus
3. Install it (drag to Applications)

### Connect:
1. Open TablePlus
2. Click "Create a new connection"
3. Choose "PostgreSQL"
4. Enter:
   - Name: `Local Dev`
   - Host: `localhost`
   - Port: `5432`
   - User: `postgres`
   - Password: `postgres`
5. Click "Connect" 🎉

Now you can **see all your data visually**!

---

## 📊 Quick SQL Examples

### Connect to database:
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

### View data:
```sql
SELECT * FROM users;
```

### View all tables:
```sql
\dt
```

### Exit:
```sql
\q
```

---

## 🔧 Update Your Project Files

### homepage-api:
Edit `env.dev`:
```
DB_URL=jdbc:postgresql://localhost:5432/homepage_api
DB_USERNAME=postgres
DB_PASSWORD=postgres
```

### product-catalog-service:
Edit `.env`:
```
DATABASE_URL=postgresql://localhost:5432/product_catalog
DB_USER=postgres
DB_PASSWORD=postgres
```

### order-service:
Edit `.env`:
```
DATABASE_URL=postgresql://localhost:5432/order_service
DB_USER=postgres
DB_PASSWORD=postgres
```

---

## 💡 Pro Tips

1. **Always use TablePlus** - it's the easiest way to see data
2. Run `./start.sh` when you start coding
3. Run `./stop.sh` when you're done
4. Use `./new-db.sh` to create databases for new projects

---

## 🆘 Troubleshooting

```bash
# Check if PostgreSQL is running
docker ps

# View logs
docker-compose logs -f

# Restart PostgreSQL
./stop.sh
./start.sh
```

