# 🐳 Day 44: Apache Web Server with Docker Compose

## 📋 Task Description
Deploy a static website on the `httpd` web server using a containerized platform. 

**Requirements:**
1.  **Host:** App Server 2
2.  **Container Name:** `httpd`
3.  **Image:** `httpd:latest`
4.  **Port Mapping:** Host `3000` -> Container `80`
5.  **Volume:** Host `/opt/data` -> Container `/usr/local/apache2/htdocs`

## 🛠️ Solution
The solution uses a declarative `docker-compose.yml` file to define the infrastructure state.

```yaml
version: '3'
services:
  web:
    image: httpd:latest
    container_name: httpd
    ports:
      - "3000:80"
    volumes:
      - /opt/data:/usr/local/apache2/htdocs