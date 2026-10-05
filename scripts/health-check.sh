#!/bin/bash
# Haleva health check
# Verifies all services are running and reachable.

echo "🌿 Haleva health check"
echo "======================"

check() {
  local name="$1"
  local url="$2"
  if curl -sf -o /dev/null -w "%{http_code}" "$url" | grep -qE "^(200|301|302|401|403)$"; then
    echo "✅ $name is reachable"
  else
    echo "❌ $name is NOT reachable ($url)"
  fi
}

check "Postiz"                "http://localhost:5000"
check "n8n"                   "http://localhost:5678"
check "MoneyPrinterTurbo"     "http://localhost:8501"

echo ""
echo "Docker containers:"
docker compose ps

echo ""
echo "Disk usage:"
docker system df
