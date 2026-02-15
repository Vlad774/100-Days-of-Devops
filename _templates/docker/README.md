# [Task Name]

![Docker](https://img.shields.io/badge/Docker-24.0+-blue?style=flat&logo=docker&logoColor=white)

## 📋 Task Description

[Describe the task as it arrived — from a ticket, a team request, or an incident.]

## 🏗️ Architecture & Logic

[What runs and how the services connect to each other.]

```
docker-compose
├── web  (php:apache)  :6400 → :80   /var/www/html
└── db   (mariadb)     :3306 → :3306  /var/lib/mysql
```

## 🧠 Why This Approach (Key Decisions)

- **Why a non-root USER** — running as root inside the container equals root on the host in a container escape scenario. This is baseline security hardening.
- **Why .dockerignore** — without it `COPY . .` pulls `.git/`, `node_modules/`, and `.env` files with secrets into the image.
- **[Add your own decision]** — explain the key choice specific to this task.

## 🛠️ Tech Stack

- **Tool:** Docker / Docker Compose
- **Version:** Docker 24.0+, Compose v2

## 🚀 How to Run

```bash
# Build the image
docker build -t [image-name] .

# Start via compose
docker compose up -d

# Check status
docker compose ps
docker compose logs --tail=50

# Stop and remove
docker compose down
```
