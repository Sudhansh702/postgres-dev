#!/bin/bash
echo "🚀 Starting PostgreSQL..."
docker-compose up -d
echo "✅ PostgreSQL is running on localhost:5432"
echo ""
echo "📊 To view data, use TablePlus or DBeaver:"
echo "   - Connect to: localhost:5432"
echo "   - Username: postgres"
echo "   - Password: postgres"
echo ""
echo "💡 Quick commands:"
echo "   ./show-data.sh     - View data"
echo "   ./new-db.sh        - Create new database"
echo "   ./stop.sh          - Stop PostgreSQL"

