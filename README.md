
# Haleva

**Content that breathes.**

Open-source autopilot for your social media. Generates, schedules, and publishes Reels, Shorts, and posts across 30+ platforms.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Status](https://img.shields.io/badge/status-alpha-orange.svg)](#roadmap)
[![CI](https://github.com/Alpha-Oi/haleva/actions/workflows/ci.yml/badge.svg)](https://github.com/Alpha-Oi/haleva/actions/workflows/ci.yml)
[![GitHub stars](https://img.shields.io/github/stars/Alpha-Oi/haleva?style=social)](https://github.com/Alpha-Oi/haleva)

</div>

---

## ✨ What is Haleva?

Haleva is a self-hosted, open-source system that turns a single idea into published content across every social platform you own.

- 🎬 **AI video generation** — turn a topic into a ready-to-post Reel/Short
- ✍️ **AI text generation** — platform-specific captions and hashtags
- 📅 **Smart scheduling** — respects every platform's rate limits
- 🚀 **Cross-publishing** — 30+ platforms via Postiz
- ✅ **Human approval gate** — nothing goes live without your OK (optional)

No subscriptions. No lock-in. Your data stays on your server.

---

## 🏗️ Architecture
Trigger → n8n → Text Gen → Video Gen → Approval → Postiz → Platforms
│ │ │ │ │ │ │
▼ ▼ ▼ ▼ ▼ ▼ ▼
Sheets Workflow OpenAI MoneyPrinter pendpost REST API IG/TT/X
---

## 🧩 Stack

| Layer | Component | License |
|-------|-----------|---------|
| Publishing | [Postiz](https://github.com/gitroomhq/postiz-app) | AGPL-3.0 |
| Orchestration | [n8n](https://github.com/n8n-io/n8n) / [Activepieces](https://github.com/activepieces/activepieces) | Fair Code / MIT |
| Video generation | [MoneyPrinterTurbo](https://github.com/harry0703/MoneyPrinterTurbo) | MIT |
| Content generation | [SocialFlow](https://github.com/inbharatai/socialflow) | Open-source |

---

## 🚀 Quick Start

### Prerequisites

- Docker Desktop 4.20+
- 4 GB RAM minimum (8 GB recommended)
- API keys: [Pexels](https://www.pexels.com/api/), [OpenAI](https://platform.openai.com/) or [Anthropic](https://console.anthropic.com/)

### 1. Clone

```bash
git clone https://github.com/Alpha-Oi/haleva.git
cd haleva2. Configure
bash
cp .env.example .env
# Edit .env with your API keys
3. Launch
bash
docker compose up -d
4. Access
Service	URL	Purpose
Postiz	http://localhost:5000	Connect social accounts
n8n	http://localhost:5678	Build workflows
MoneyPrinterTurbo	http://localhost:8501	Generate videos
Full setup guide: docs/deployment.md

📊 Rate Limits
Haleva respects every platform's limits automatically:

Platform	Posts / 24h	Requests / hour
Instagram	25	200
TikTok	25	600 / min
X/Twitter	50 (safe)	100 / 15 min
Facebook	5–10 (safe)	4800 actions
Postiz API	—	30
Configure custom limits in config/limits.yaml.

🗺️ Roadmap
☑ Architecture design
☑ Project scaffolding
☑ Docker Compose template
☑ n8n workflow template
□ Real Postiz integration
□ MoneyPrinterTurbo integration
□ Human approval gate (pendpost)
□ Analytics dashboard
□ Multi-user support
🤝 Contributing
See CONTRIBUTING.md. All contributions welcome — issues, PRs, docs, translations.

📜 License
MIT © Haleva Contributors

<div align="center">
Haleva. Content that breathes.

Made with 🌿 by people who hate manual posting.

</div> ```