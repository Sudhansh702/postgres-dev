#!/bin/bash
echo "📊 Opening PostgreSQL interactive console..."
echo "💡 Type SQL commands like: SELECT * FROM users;"
echo ""
docker exec -it postgres-dev psql -U postgres

