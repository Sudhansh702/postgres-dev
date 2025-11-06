#!/bin/bash
echo "👤 Create New User"
echo ""
read -p "Username: " username
read -p "Password: " -s password
echo ""
read -p "Database (optional, press Enter to skip): " dbname

echo "Creating user: $username"
docker exec -it postgres-dev psql -U postgres -c "CREATE USER $username WITH PASSWORD '$password';"

if [ ! -z "$dbname" ]; then
  echo "Granting privileges on database: $dbname"
  docker exec -it postgres-dev psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE $dbname TO $username;"
  docker exec -it postgres-dev psql -U postgres -d $dbname -c "GRANT ALL ON SCHEMA public TO $username;"
fi

echo "✅ User '$username' created!"

