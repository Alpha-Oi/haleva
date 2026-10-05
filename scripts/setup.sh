#!/bin/bash
# Haleva setup script
# Run this after cloning the repository.

set -e

echo "🌿 Haleva setup"
echo "==============="

# Check prerequisites
command -v docker >/dev/null 2>&1 || { echo "❌ Docker is not installed."; exit 1; }
command -v docker compose >/dev/null 2>&1 || { echo "❌ Docker Compose is not installed."; exit 1; }

echo "✅ Docker found"

# Copy .env.example if .env doesn't exist
if [ ! -f .env ]; then
  cp .env.example .env
  echo "📝 Created .env from .env.example — please fill in your API keys."
else
  echo "ℹ️  .env already exists, skipping."
fi

# Create data directories
mkdir -p data/postiz data/n8n data/moneyprinter logs

echo "📁 Data directories created"

# Pull images
echo "⬇️  Pulling Docker images (this may take a few minutes)..."
docker compose pull

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Edit .env with your API keys"
echo "  2. Run: docker compose up -d"
echo "  3. Open http://localhost:5000 (Postiz) and http://localhost:5678 (n8n)"
