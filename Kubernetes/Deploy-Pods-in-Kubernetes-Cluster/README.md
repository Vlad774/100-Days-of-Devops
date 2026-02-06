# 🛠️ Deploy Nginx Pod

![Kubernetes](https://img.shields.io/badge/Kubernetes-1.27+-blue?style=flat&logo=kubernetes) ![Nginx](https://img.shields.io/badge/Nginx-Latest-green?style=flat&logo=nginx)

## 📄 Task Description
**Task:** Create a pod named `pod-nginx` using the `nginx` image with the `latest` tag.

* **App Label:** `nginx_app`
* **Container Name:** `nginx-container`
* **Image Tag:** `nginx:latest`

## 📂 Project Structure

| File | Description |
|------|-------------|
| `pod.yaml` | Defines the Pod resource manifest (Metadata & Spec). |

---

## 🚀 Solution

```bash

apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
  labels:
    app: nginx_app
spec:
  containers:
  - name: nginx-container
    image: nginx:latest

``` 

### 📝 Execution Steps

```bash
# 1. Create Manifest
vi pod.yaml

# 2. Apply Configuration
kubectl apply -f pod.yaml

# 3. Verify Status
kubectl get pods

# 4. Detailed Validation
kubectl describe pod pod-nginx