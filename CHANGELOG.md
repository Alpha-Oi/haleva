# Changelog

All notable changes to Haleva will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Docker Compose stack for Postiz + n8n + MoneyPrinterTurbo
- n8n workflow templates for idea-to-publish pipeline
- Human approval gate integration (pendpost)
- Analytics dashboard
- Multi-user support

## [0.1.0-alpha] - 2026-10-05

### Added
- Initial project structure
- README with architecture overview
- MIT License
- Docker Compose template
- Rate limits configuration (Instagram, TikTok, X, Facebook)
- Brand assets (logo, palette)
- Community files (CONTRIBUTING, SECURITY, CODE_OF_CONDUCT)
- GitHub Actions CI workflow

## [0.1.0-alpha.1] - 2026-10-06

### Working
- ✅ Docker Compose stack with Postiz v2.11.3, n8n, PostgreSQL, Redis
- ✅ Telegram channel connected and publishing
- ✅ First automatic post published successfully via Postiz
- ✅ Storage provider configured (local)
- ✅ MAIN_URL configured

### Fixed
- Postiz 502 Bad Gateway (Temporal incompatibility) — downgraded to v2.11.3
- Telegram Bot Token not recognized — renamed to TELEGRAM_TOKEN
- White screen in Postiz — added STORAGE_PROVIDER and MAIN_URL

### Known Issues
- n8n workflow not yet imported
- AI keys (OpenAI/Anthropic) not yet configured
- MoneyPrinterTurbo not yet integrated
