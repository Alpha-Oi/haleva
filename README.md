# Haleva

**Content that breathes.**

Open-source autopilot for your social media. Generates, schedules, and publishes Reels, Shorts, and posts across 30+ platforms.

## What is Haleva?

Haleva is a self-hosted, open-source system that turns a single idea into published content across every social platform you own.

- AI video generation — topic to Reel/Short
- AI text generation — platform-specific captions
- Smart scheduling — respects rate limits
- Cross-publishing — 30+ platforms via Postiz
- Human approval gate — optional

## Stack

| Layer | Component | License |
|-------|-----------|---------|
| Publishing | Postiz | AGPL-3.0 |
| Orchestration | n8n / Activepieces | Fair Code / MIT |
| Video generation | MoneyPrinterTurbo | MIT |
| Content generation | SocialFlow | Open-source |

## Quick Start

1. Clone the repo:
   git clone https://github.com/YOUR_USERNAME/haleva.git
2. Configure:
   cp .env.example .env
3. Launch:
   docker compose up -d
4. Access:
   - Postiz: http://localhost:5000
   - n8n: http://localhost:5678

## Rate Limits

| Platform | Posts / 24h |
|----------|-------------|
| Instagram | 25 |
| TikTok | 25 |
| X/Twitter | 50 (safe) |
| Facebook | 5-10 (safe) |

## Roadmap

- [x] Architecture design
- [ ] Docker Compose stack
- [ ] Postiz integration
- [ ] MoneyPrinterTurbo integration
- [ ] n8n workflow templates
- [ ] Human approval gate

## License

MIT © Haleva Contributors
