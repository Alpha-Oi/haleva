# Architecture

## Overview

Haleva is built on four layers, each responsible for a specific part of the pipeline.

## Layers

### 1. Trigger Layer

Sources that start a workflow:

- **Google Sheets** — row added with topic, platform, scheduled time
- **RSS feeds** — new item in a blog or news source
- **Webhook** — external service calls Haleva API
- **Manual** — from n8n UI

### 2. Orchestration Layer

The brain of the system. **n8n** (or Activepieces) coordinates:

- Fetching input from trigger
- Calling AI models for text generation
- Launching video generation
- Waiting for human approval (optional)
- Calling the publisher
- Logging results

### 3. Content Generation Layer

#### Text
- **SocialFlow** or direct AI API (OpenAI, Anthropic, Gemini)
- Platform-specific prompts stored in config/prompts/

#### Video
- **MoneyPrinterTurbo** (MIT) — topic to Reel/Short
- **automated-video-generator** (MIT) — script to video with MCP support
- Uses free stock APIs: Pexels, Pixabay
- Free TTS: Edge-TTS

### 4. Publishing Layer

**Postiz** (AGPL-3.0) handles:

- OAuth authorization for 30+ platforms
- Unified REST API for posting
- Rate limit management
- Retry on failure

## Data Flow

    Trigger → n8n → Text Gen → Video Gen → Approval → Postiz → Platforms
       │        │        │          │           │         │         │
       ▼        ▼        ▼          ▼           ▼         ▼         ▼
    Sheets   Workflow  OpenAI   MoneyPrinter  pendpost  REST API  IG/TT/X

## Rate Limiting Strategy

Each platform has different limits. Haleva enforces:

- Minimum delay between posts (default: 1 hour)
- Per-platform daily caps (see config/limits.yaml)
- Exponential backoff on rate limit errors
- Queue-based publishing to avoid bursts

## Security

- All credentials stored in n8n credential vault
- Postiz API keys never exposed to workflows directly
- Human approval gate prevents accidental posts
- HTTPS-only in production (reverse proxy: Caddy, Nginx, Traefik)

## Scaling

For high volume:

- Switch n8n to queue mode with Redis
- Run multiple Postiz workers
- Use PostgreSQL instead of SQLite
- Offload video rendering to GPU server
