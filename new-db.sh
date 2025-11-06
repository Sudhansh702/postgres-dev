#!/bin/bash
echo "📝 Create New Database"
echo ""
read -p "Database name: " dbname
echo "Creating database: $dbname"
docker exec -it postgres-dev psql -U postgres -c "CREATE DATABASE $dbname;"
echo "✅ Database '$dbname' created!"
echo ""
echo "Connect to it:"
echo "  docker exec -it postgres-dev psql -U postgres -d $dbname"

