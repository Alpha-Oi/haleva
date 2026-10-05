#!/bin/bash
# Haleva backup script
# Backs up PostgreSQL, n8n workflows, and Postiz data.

set -e

BACKUP_DIR="backups/$(date +%Y-%m-%d_%H-%M-%S)"
mkdir -p "$BACKUP_DIR"

echo "🌿 Haleva backup"
echo "================"
echo "Target: $BACKUP_DIR"

# PostgreSQL dump
echo "📦 Backing up PostgreSQL..."
docker compose exec -T postgres pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB" > "$BACKUP_DIR/postgres.sql"

# n8n data
echo "📦 Backing up n8n data..."
docker run --rm -v haleva_n8n-data:/data -v "$(pwd)/$BACKUP_DIR":/backup alpine tar czf /backup/n8n-data.tar.gz -C /data .

# Postiz data
echo "📦 Backing up Postiz data..."
docker run --rm -v haleva_postiz-data:/data -v "$(pwd)/$BACKUP_DIR":/backup alpine tar czf /backup/postiz-data.tar.gz -C /data .

echo ""
echo "✅ Backup complete: $BACKUP_DIR"
