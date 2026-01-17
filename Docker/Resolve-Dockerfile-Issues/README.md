# 🛠️ Resolve-Dockerfile-Issues

## 📄 Task Description
The Nautilus DevOps team is working to create new images per requirements shared by the development team. One of the team members is working to create a Dockerfile on App Server 2 in Stratos DC. While working on it she ran into issues in which the docker build is failing and displaying errors. Look into the issue and fix it to build an image as per details mentioned below:

a. The Dockerfile is placed on App Server 2 under /opt/docker directory.
b. Fix the issues with this file and make sure it is able to build the image.
c. Do not change base image, any other valid configuration within Dockerfile, or any of the data been used — for example, index.html.

Note: Please note that once you click on FINISH button all the existing containers will be destroyed and new image will be built from your Dockerfile.

---

## 🚀 Solution

### 📝 Execution Steps:

```bash
# 1. SSH into App Server 2
ssh steve@172.16.238.11


# 2. Navigate to the Docker context directory
cd /opt/docker

# 3. Investigate the issue (Debug Step)
# Attempt to build first to see the error
docker build -t test_build .
# Error observed: "COPY /server.crt ... file not found" and "index.html not found"

# 4. Inspect the directory structure
ls -R
# Output reveals that files are actually located inside subdirectories:
# ./certs/server.crt
# ./certs/server.key
# ./html/index.html

# 5. Fix the Dockerfile paths
vi Dockerfile

# --- CHANGES MADE IN VI ---
# OLD (Incorrect):
# COPY /server.crt /usr/local/apache2/conf/server.crt
# COPY /server.key /usr/local/apache2/conf/server.key
# COPY ./index.html /usr/local/apache2/htdocs/

# NEW (Corrected relative paths):
# COPY certs/server.crt /usr/local/apache2/conf/server.crt
# COPY certs/server.key /usr/local/apache2/conf/server.key
# COPY html/index.html /usr/local/apache2/htdocs/
# --------------------------

# 6. Build the image again to verify the fix
docker build -t nautilus .
# Result: Successfully built