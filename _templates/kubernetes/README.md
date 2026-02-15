# [Task Name]

![Kubernetes](https://img.shields.io/badge/Kubernetes-1.28+-326ce5?style=flat&logo=kubernetes&logoColor=white)

## 📋 Task Description

[Describe the task as it arrived — from a ticket, a team request, or an incident.]

## 🏗️ Architecture & Logic

[What gets deployed and how the components relate to each other.]

```
Deployment (2 replicas)
└── Pod
    └── Container: nginx:1.25
        ├── Port: 80
        └── Resources: 128Mi / 250m

Service (ClusterIP)
└── selector: app=[name]
    └── port: 80 → targetPort: 80
```

## 🧠 Why This Approach (Key Decisions)

- **Why Deployment instead of a bare Pod** — Deployment provides self-healing and rolling updates; a bare Pod will not restart on failure.
- **Why resource limits are required** — without them a single container can exhaust all node memory (Noisy Neighbor problem). This is the first thing reviewers check.
- **[Add your own decision]** — explain the key choice specific to this task.

## 🛠️ Tech Stack

- **Tool:** Kubernetes
- **Version:** 1.28+
- **Runtime:** containerd

## 🚀 How to Run

```bash
# Apply manifests
kubectl apply -f .

# Check status
kubectl get pods -l app=[name]
kubectl get svc

# Container logs
kubectl logs -l app=[name] --tail=50

# Remove resources
kubectl delete -f .
```
