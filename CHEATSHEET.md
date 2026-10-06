# Haleva — Шпаргалка

> **Haleva. Content that breathes.**
> Open-source автопилот для социальных сетей.

---

## 🚀 Быстрый старт (после перезагрузки ПК)

cd D:\Development\haleva
docker compose up -d
docker compose ps

Все 4 контейнера должны быть в статусе Up:
- haleva-postgres-1
- haleva-redis-1
- haleva-n8n-1
- haleva-postiz-1

---

## 🌐 Интерфейсы

| Сервис | URL | Логин |
|--------|-----|-------|
| Postiz | http://localhost:5000 | crown.aliy1980@gmail.com + свой пароль |
| n8n | http://localhost:5678 | admin / HalevaN8N2026 |

---

## ⚙️ Управление Docker

Запустить стек:           docker compose up -d
Остановить (данные живы): docker compose down
Полный сброс (УДАЛИТ!):   docker compose down -v
Перезапустить сервис:     docker compose restart postiz
Логи:                     docker compose logs --tail=50 postiz
Логи в реальном времени:  docker compose logs -f postiz
Пересоздать после .env:   docker compose up -d --force-recreate postiz

---

## 🤖 Telegram

| Параметр | Значение |
|----------|----------|
| Бот | @haleva_alpha_bot |
| Канал | @haleva_alpha (Alpha-Oi) |
| Управление | @BotFather |
| ID канала | -1004318700731 |

### Публикация через Postiz (вручную)

1. http://localhost:5000/launches
2. «+ Создать пост»
3. Написать текст
4. Кликнуть кружок у канала
5. Установить время или «сейчас»
6. «Добавить в календарь»

### Публикация через n8n (вручную)

1. http://localhost:5678
2. Workflow «Трубопровод Халвеа»
3. Кнопка «Выполнить рабочий процесс»

---

## ⏰ Автопостинг

Работает: КАЖДЫЙ ДЕНЬ в 10:00 по Москве
Условие: Docker Desktop запущен

### Изменить текст поста
n8n → нода «Отправить текстовое сообщение» → поле Text → Опубликовать

### Изменить время
n8n → нода «Запуск по расписанию» → изменить час → Опубликовать

### Отключить автопостинг
n8n → workflow → «Опубликовано» (вверху справа) → Unpublish

---

## 📱 Соцсети

Подключено:
- Telegram — @haleva_alpha

Можно подключить (Postiz → Добавить канал):
- YouTube (нужен Google Cloud Project)
- Instagram (Business/Creator + Facebook Page)
- TikTok (через TikTok for Developers)
- X, LinkedIn, Facebook, Threads, Pinterest, Reddit, Bluesky, Mastodon

---

## 🔑 API-ключи (.env)

TELEGRAM_BOT_NAME="haleva_alpha_bot"
TELEGRAM_TOKEN=865...

OPENAI_API_KEY=          (не настроено)
ANTHROPIC_API_KEY=       (не настроено)
PEXELS_API_KEY=          (не настроено)
PIXABAY_API_KEY=         (не настроено)

POSTGRES_PASSWORD=HalevaDB2026
N8N_BASIC_AUTH_PASSWORD=HalevaN8N2026

### Изменить .env

notepad .env
docker compose up -d --force-recreate postiz

---

## 🔧 Частые проблемы

502 Bad Gateway (Postiz)  → подожди 60 секунд после запуска
Telegram-бот молчит       → проверь, что бот админ канала с правом «Публикация сообщений»
n8n белый экран          → docker compose restart n8n
Chrome «Out of Memory»    → закрой лишние вкладки
Docker не стартует        → проверь WSL 2 + запусти Docker Desktop вручную

---

## 💾 Резервная копия

cd D:\Development\haleva
bash scripts/backup.sh

Создаёт бэкап PostgreSQL, n8n и Postiz в папку backups/.

---

## 🔗 Полезные ссылки

GitHub проекта:    https://github.com/Alpha-Oi/haleva
Releases:          https://github.com/Alpha-Oi/haleva/releases
Postiz GitHub:     https://github.com/gitroomhq/postiz-app
n8n GitHub:        https://github.com/n8n-io/n8n
MoneyPrinterTurbo: https://github.com/harry0703/MoneyPrinterTurbo

---

## 📊 Roadmap

[x] Docker-стек
[x] Telegram-бот + канал
[x] Postiz публикация
[x] n8n автопостинг по расписанию
[ ] AI-генерация текстов
[ ] MoneyPrinterTurbo — видео
[ ] YouTube / Instagram / TikTok
[ ] Google Sheets контент-план
[ ] Аналитика

---

## 💡 Важные напоминания

1. Docker Desktop должен быть запущен — иначе автопостинг не работает
2. Не коммить .env — там пароли и токены
3. Не показывай токен бота никому
4. Пароль Postiz — сохрани в менеджере паролей
5. docker compose down -v УДАЛЯЕТ базу данных — аккаунт Postiz придётся создать заново

---

Haleva. Content that breathes.
Сделано с 🌿 для автоматизации социальных сетей.