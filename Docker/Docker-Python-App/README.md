# 🐳 Containerizing a Python App with Docker

## 📄 Task Description
The goal was to dockerize a Python application and deploy it on **App Server 2**. The application source code was located at `/python_app/src/`.

**Requirements:**
- [x] Create a `Dockerfile` in `/python_app`.
- [x] Use a Python base image.
- [x] Install dependencies from `requirements.txt`.
- [x] Expose port `5001`.
- [x] Run `server.py` on container start.
- [x] Build image named `nautilus/python-app`.
- [x] Map container port `5001` to host port `8092`.

---

## 🚀 Solution

### 1. The Dockerfile
Created in `/python_app/Dockerfile`:

```dockerfile
# Use Python as base image
FROM python:3.9

# Set working directory inside the container
WORKDIR /app

# Copy all files from host (current dir) to container
COPY . .

# Install dependencies
# Note: Since we copied everything to /app, the path is now src/requirements.txt
RUN pip install -r src/requirements.txt

# Expose the internal app port
EXPOSE 5001

# Command to run the application
CMD ["python", "src/server.py"]

### 📝 Execution Steps:

```bash

 docker build -t nautilus/python-app .

 docker run -d -p 8092:5001 --name pythonapp_nautilus nautilus/python-app

 docker ps

 curl http://localhost:8092/

```
