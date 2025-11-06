#!/bin/bash
echo "👥 Available Users:"
echo ""
docker exec -it postgres-dev psql -U postgres -c "\du"

