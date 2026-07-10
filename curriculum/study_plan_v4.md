# Study Plan v4 — Curated Track (2026-07-10)

**47 tasks selected from the ~400-task KodeKloud Engineer catalog.**
Selection criterion: does the task close a real gap that shows up in interviews or on the resume —
not "complete the program". Everything already proven in production work (Linux server ops, Git,
Docker, Jenkins pipelines) is intentionally skipped: grinding basics would cost weeks and signal
a junior profile.

**Cadence:** 3–4 tasks/week, evening slots (Tue/Thu + optional weekend). ~12–14 weeks total.

**Flow per task:**
1. Open the pre-created issue → add label `build` → GitHub Action scaffolds folder + feature branch
2. Solve on KodeKloud Engineer → write up in the folder README: what was asked, commands, what broke, how fixed
3. PR → merge → close issue → tick the tracker below
4. Weekly: best task of the week → LinkedIn post draft

---

## Phase 1 — Kubernetes Troubleshooting & Advanced (11 tasks) 🔥 ACTIVE

Why first: current interview target (DevOps w/ Claude role) explicitly requires K8s
troubleshooting, networking, and manifests. Basics (deploy pod/deployment) skipped — covered by
production EKS/ArgoCD work.

- [ ] Kubernetes / Set Resource Limits in Kubernetes Pods
- [ ] Kubernetes / Execute Rolling Updates in Kubernetes
- [ ] Kubernetes / Revert Deployment to Previous Version in Kubernetes
- [ ] Kubernetes / Resolve VolumeMounts Issue in Kubernetes
- [ ] Kubernetes / Kubernetes Shared Volumes
- [ ] Kubernetes / Kubernetes Sidecar Containers
- [ ] Kubernetes / Troubleshoot Deployment Issues in Kubernetes
- [ ] Kubernetes / Init Containers in Kubernetes
- [ ] Kubernetes / Persistent Volumes in Kubernetes
- [ ] Kubernetes / Manage Secrets in Kubernetes
- [ ] Kubernetes / Kubernetes Troubleshooting (L3)

## Phase 2 — Ansible (12 tasks)

Why: Ansible is claimed on the resume but practice is thin — must survive 5 minutes of
interview questions. Only block taken (almost) whole.

- [ ] Ansible / Create Ansible Inventory for App Server Testing
- [ ] Ansible / Configure Default SSH User for Ansible
- [ ] Ansible / Troubleshoot and Create Ansible Playbook
- [ ] Ansible / Copy Data to App Servers using Ansible
- [ ] Ansible / Create Files on App Servers using Ansible
- [ ] Ansible / Ansible Install Package
- [ ] Ansible / Ansible Blockinfile Module
- [ ] Ansible / Ansible Lineinfile Module
- [ ] Ansible / Ansible Manage Services
- [ ] Ansible / Managing Jinja2 Templates Using Ansible
- [ ] Ansible / Using Ansible Conditionals
- [ ] Ansible / Ansible Facts Gathering

## Phase 3 — Terraform Drills (9 tasks)

Why: small finished units are exactly the prep format for the HashiCorp 004 exam retake
decision, and they extend the 1,300-line production Terraform base with patterns interviews ask
about (state, modules, workspaces, IAM).

- [ ] Terraform/AWS / Create VPC and Subnet Using Terraform
- [ ] Terraform/AWS / Launch EC2 in Private VPC Subnet Using Terraform
- [ ] Terraform/AWS / Deploy Multiple EC2 Instances with Terraform
- [ ] Terraform/AWS / Grant EC2 Access to S3 Bucket Using Terraform
- [ ] Terraform/AWS / Implement S3 Lifecycle Management Policy Using Terraform
- [ ] Terraform/AWS / Attach IAM Role with Inline Policy Using Terraform
- [ ] Terraform/AWS / Access Secrets Manager with IAM Role Using Terraform
- [ ] Terraform/AWS / Create and Use Terraform Modules
- [ ] Terraform/AWS / Managing Terraform Workspaces for Environment Isolation

## Phase 4 — AWS Scenarios (8 tasks)

Why: the resume skills line claims Lambda, ECS, API GW — Borod Bank covers EKS/RDS/S3/IAM but
NOT these. This phase makes the claimed skills defensible.

- [ ] AWS / Setting Up an Application Load Balancer for an EC2 Instance
- [ ] AWS / Configure NAT Gateway for Internet Access in a Private VPC
- [ ] AWS / Establishing Secure Communication Between VPCs via VPC Peering
- [ ] AWS / Deploying Containerized Applications with Amazon ECS
- [ ] AWS / Event-Driven Processing with Amazon S3 and Lambda
- [ ] AWS / Integrating AWS SQS and SNS for Reliable Messaging
- [ ] AWS / Securing Data with AWS KMS
- [ ] AWS / Implementing Auto Scaling for High Availability

## Phase 5 — Azure Starter (7 tasks) ⏸ GATED

Gate: confirmed by the W3 job-market gap analysis (early signal is already strong — 3 of the
first relevant vacancies were Azure-flavored). Uses Azure free account ($200 credit) if KodeKloud
cloud playground is unavailable.

- [ ] Azure / Azure Kubernetes Service (AKS) Setup and Management
- [ ] Azure / Working with Azure Container Registry (ACR)
- [ ] Azure / Managing Secrets with Azure Key Vault
- [ ] Azure / Configuring Azure VM with Application Gateway
- [ ] Azure / Configuring Virtual Network Peering
- [ ] Azure / Deploying Virtual Machines in a Private Virtual Network
- [ ] Azure / Create and Configure Network Security Group (NSG)

---

## Skipped on purpose (already production-proven or low ROI)

| Block | Reason |
|---|---|
| Linux (~60 tasks) | Operating a production server daily (systemd, cron, ssh hardening, fail2ban) |
| Git (~25) | Daily driver: branches, PRs, rebases, hooks in real repos |
| Docker (~25) | 9+ containers in production, Dockerfiles/Compose in real projects |
| Jenkins (~25) | Built a 20+ stage production Jenkins pipeline (Borod Bank) |
| AI tasks (10) | Build production LLM systems (multi-provider routing, AI code-review gates, MCP) |
| 100_days_cloud_aws/azure summary trackers | Duplicates of the leveled topic trackers |

## Progress

```text
Phase 1 Kubernetes:      [ ] 0/11
Phase 2 Ansible:         [ ] 0/12
Phase 3 Terraform:       [ ] 0/9
Phase 4 AWS scenarios:   [ ] 0/8
Phase 5 Azure (gated):   [ ] 0/7
```

## Related

- [[study_plan_v3]] — previous plan (beginner-paced, superseded)
- [[kubernetes]] · [[ansible]] · [[terraform]] · [[cloud_aws]] · [[cloud_azure]] — full catalogs
- External tracking: private board «DevOps Career» + /home/ubuntu/SCHEDULE.md (evening slots)
