#!/bin/bash
echo "📋 Available Databases:"
echo ""
docker exec -it postgres-dev psql -U postgres -c "\l"

