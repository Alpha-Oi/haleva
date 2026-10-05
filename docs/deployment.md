# Deployment Guide

## Prerequisites

- Docker Desktop 4.20+ (Windows/macOS) or Docker Engine 24+ (Linux)
- 4 GB RAM minimum, 8 GB recommended
- 20 GB free disk space (video rendering is heavy)
- API keys (see below)

## Required API Keys

| Service | Purpose | Where to get |
|---------|---------|--------------|
| OpenAI or Anthropic | Text generation | platform.openai.com or console.anthropic.com |
| Pexels | Stock video | pexels.com/api |
| Pixabay | Stock images | pixabay.com/api/docs |
| Postiz | Publishing | Self-generated in Postiz UI |

## Step 1: Clone the repository

    git clone https://github.com/Alpha-Oi/haleva.git
    cd haleva

## Step 2: Configure environment

    cp .env.example .env

Edit .env with your API keys:

    OPENAI_API_KEY=sk-...
    PEXELS_API_KEY=...
    PIXABAY_API_KEY=...
    POSTGRES_PASSWORD=strong_password_here
    N8N_BASIC_AUTH_PASSWORD=strong_password_here

## Step 3: Launch the stack

    docker compose up -d

First run will pull images (~2 GB). Wait 3-5 minutes.

## Step 4: Access services

| Service | URL | Default credentials |
|---------|-----|---------------------|
| Postiz | http://localhost:5000 | Set on first launch |
| n8n | http://localhost:5678 | Set in .env |
| MoneyPrinterTurbo | http://localhost:8501 | None |

## Step 5: Connect social accounts

1. Open Postiz at http://localhost:5000
2. Click Add Channel
3. Authorize each platform via OAuth
4. Copy the Postiz API key from Settings

## Step 6: Import n8n workflow

1. Open n8n at http://localhost:5678
2. Go to Workflows > Import from File
3. Select workflows/haleva-pipeline.json
4. Configure credentials (OpenAI, Postiz API)
5. Activate

## Step 7: Test the pipeline

1. Add a row to your Google Sheet (or trigger manually)
2. Watch n8n execution
3. Check Postiz queue
4. Verify post on platform

## Production Deployment

### Reverse proxy (Caddy example)

    haleva.example.com {
        reverse_proxy localhost:5000
    }

    n8n.example.com {
        reverse_proxy localhost:5678
    }

### Backups

    ./scripts/backup.sh

Backs up PostgreSQL, n8n workflows, Postiz data.

### Monitoring

    docker compose logs -f

For production, use Loki + Grafana or similar.

## Troubleshooting

### Postiz won't start
- Check PostgreSQL is running: docker compose ps
- Check logs: docker compose logs postiz

### n8n can't reach Postiz
- Use service name: http://postiz:5000 (not localhost)
- Verify both are on same Docker network

### Video generation is slow
- MoneyPrinterTurbo needs 2-4 GB RAM per video
- Consider GPU acceleration (CUDA)
- Or use a cloud video API instead

### Rate limit errors
- Check config/limits.yaml
- Increase delays in n8n Wait nodes
- Verify API quota in each platform dashboard
