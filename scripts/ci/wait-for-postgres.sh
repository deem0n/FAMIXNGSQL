#!/usr/bin/env bash
set -euo pipefail

for attempt in {1..60}; do
  if docker exec famixngsql-postgres pg_isready --username=famixngsql_ci --dbname=famixngsql_ci; then
    exit 0
  fi
  sleep 1
done

docker logs famixngsql-postgres
echo 'PostgreSQL did not become ready within 60 seconds.' >&2
exit 1
