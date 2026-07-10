# Study Plan v3 — KodeKloud Engineer

## Цель

**6-8 недель практики для Cloud/DevOps Engineer**

Главный фокус:
- Linux, Git, Docker, Kubernetes, Jenkins, Ansible как DevOps-фундамент
- Terraform/AWS с первой недели как основной карьерный стек
- AI-задачи маленькими слотами по всем неделям
- Регулярный revise/catch-up, чтобы план не ломался от усталости или пропусков

---

## Главное правило недели

```text
3 дня — основная тема недели
1 день — Terraform/AWS
1 день — revise / catch-up / AI task
2 дня — отдых или лёгкая практика
```

Terraform/AWS слот:

```text
One small finished unit:
1 concept OR 1 resource OR 1 lab OR 1 recap.
No heroic scope.
```

Примеры правильного размера:
- Provider + init/plan/apply
- One security group
- One public subnet
- One IAM role
- One S3 bucket policy
- One CloudWatch alarm

Не делать:
- "Выучить весь VPC"
- "Закрыть весь IAM"
- "Разобрать весь Terraform state за один день"

---

## AI-трек

AI-задачи взяты из `ai.md`. Они короткие, поэтому не получают отдельную неделю. Они идут как лёгкие practical labs в revise-дни или после основной задачи.

Правило:

```text
AI task = 30-45 минут.
Цель — понять use case и сделать маленький результат.
```

Список AI-задач:
- Clarify Bugs with AI
- Create an AI Chatbot
- Generate Code Comments with AI
- Perform Comparisons with AI
- Convert Data with AI
- Use AI as an Email Assistant
- Extract Information with AI
- Generate Haikus with AI
- Summarize Text with AI
- Translate Content with AI

---

## Week 1 — Linux + AWS Basics

Цель недели: уверенно работать с Linux-базой и сразу начать контакт с AWS.

| День | Фокус | Задачи |
|------|-------|--------|
| Day 1 | Linux | Custom Apache User Setup; Group Creation and User Assignment; File Permission Correction |
| Day 2 | Linux | Secure Root SSH Access; Linux SSH Authentication; Linux Configure sudo |
| Day 3 | Linux | Create a Cron Job; Linux Bash Scripts; Linux Services |
| Day 4 | Terraform/AWS | Create Key Pair; Create IAM User; Launch EC2 Instance |
| Day 5 | Revise + AI | Повтор Linux задач + AI: Clarify Bugs with AI |
| Day 6 | Rest / light | Повтор: Secure Root SSH Access или File Permission Correction |
| Day 7 | Rest | Отдых |

Мини-результат недели:
- Закрыл первые Linux-задачи из `linux.md`
- Коснулся AWS через реальные задачи из `cloud_aws.md`
- Использовал AI для уточнения ошибок и debugging prompts

---

## Week 2 — Git + Docker + Terraform Basics

Цель недели: Git/Docker как ежедневный DevOps-инструмент, Terraform как первый IaC workflow.

| День | Фокус | Задачи |
|------|-------|--------|
| Day 1 | Git | Set Up Git Repository on Storage Server; Clone Git Repository on Storage Server; Update Git Repository with Sample HTML File |
| Day 2 | Git | Git Create Branches; Git Merge Branches; Git Manage Remotes; Git Revert Some Changes |
| Day 3 | Docker | Install Docker Packages and Start Docker Service; Deploy Nginx Container on Application Server; Write a Docker File |
| Day 4 | Terraform/AWS | Create Security Group Using Terraform; Create EC2 Instance Using Terraform |
| Day 5 | Revise + AI | Повтор Git/Docker задач + AI: Generate Code Comments with AI |
| Day 6 | Rest / light | Повтор: Docker EXEC Operations или Copy File to Docker Container |
| Day 7 | Rest | Отдых |

Мини-результат недели:
- Закрыл базовые Git-задачи из `git.md`
- Запустил Docker через реальные задачи из `docker.md`
- Начал Terraform через реальные задачи из `terraform.md`
- Использовал AI для объяснения или комментирования кода

---

## Week 3 — Kubernetes Basics + AWS Networking

Цель недели: первый проход Kubernetes без погружения в production-глубину. AWS networking держать маленьким и точным.

Ограничение недели:

```text
Kubernetes basics only.
No deep Helm, no complex production apps, no full K8s ninja mode.
```

| День | Фокус | Задачи |
|------|-------|--------|
| Day 1 | Kubernetes | Deploy Pods in Kubernetes Cluster; Deploy Applications with Kubernetes Deployments; Deploy ReplicaSet in Kubernetes Cluster |
| Day 2 | Kubernetes | Setup Kubernetes Namespaces and PODs; Expose Application Using NodePort Service in Kubernetes; Execute Rolling Updates in Kubernetes |
| Day 3 | Kubernetes | Revert Deployment to Previous Version in Kubernetes; Resolve VolumeMounts Issue in Kubernetes; Troubleshoot Deployment issues in Kubernetes |
| Day 4 | Terraform/AWS | Create VPC Using Terraform OR Create VPC and Subnet Using Terraform |
| Day 5 | Revise + AI | Повтор K8s задач + AI: Perform Comparisons with AI; Convert Data with AI |
| Day 6 | Rest / light | Повтор: Deploy Pods in Kubernetes Cluster или Expose Application Using NodePort Service in Kubernetes |
| Day 7 | Rest | Отдых |

Мини-результат недели:
- Закрыл первый проход Kubernetes из `kubernetes.md`
- Не ушёл в deep K8s раньше времени
- Terraform/AWS слот остался маленьким: только VPC или VPC+Subnet

---

## Week 4 — Jenkins + Terraform EC2/S3/IAM

Цель недели: automation mindset через Jenkins и Terraform resources для реальной инфраструктуры.

| День | Фокус | Задачи |
|------|-------|--------|
| Day 1 | Jenkins | Set Up Jenkins Server; Install Jenkins Plugins; Configure Jenkins Job for Package Installation |
| Day 2 | Jenkins | Jenkins Parameterized Builds; Jenkins Scheduled Jobs; Jenkins Workspaces |
| Day 3 | Jenkins | Jenkins Database Backup Job; Jenkins Slave Nodes; Jenkins Deploy Pipeline |
| Day 4 | Terraform/AWS | Create Public S3 Bucket Using Terraform OR Create IAM Policy Using Terraform |
| Day 5 | Revise + AI | Повтор Jenkins/Terraform задач + AI: Use AI as an Email Assistant |
| Day 6 | Rest / light | Повтор: Jenkins Parameterized Builds или Jenkins Workspaces |
| Day 7 | Rest | Отдых |

Мини-результат недели:
- Закрыл Jenkins-задачи из `jenkins.md`
- Закрыл один конкретный Terraform resource из `terraform.md`
- Использовал AI для практического assistant workflow

---

## Week 5 — Ansible + Terraform State/Modules

Цель недели: понять разницу между provisioning и configuration management.

| День | Фокус | Задачи |
|------|-------|--------|
| Day 1 | Ansible | Create Ansible Inventory for App Server Testing; Configure Default SSH User for Ansible; Ansible Ping Module Usage |
| Day 2 | Ansible | Troubleshoot and Create Ansible Playbook; Copy Data to App Servers using Ansible; Create Files on App Servers using Ansible |
| Day 3 | Ansible | Ansible Install Package; Ansible Blockinfile Module; Managing Jinja2 Templates Using Ansible |
| Day 4 | Terraform/AWS | Implementing Local Variables Using Terraform OR Create and Use Terraform Modules |
| Day 5 | Revise + AI | Повтор Ansible/Terraform задач + AI: Extract Information with AI |
| Day 6 | Rest / light | Повтор: Troubleshoot and Create Ansible Playbook или Ansible Install Package |
| Day 7 | Rest | Отдых |

Мини-результат недели:
- Закрыл Ansible-задачи из `ansible.md`
- Начал modules/local variables из `terraform.md`
- Можешь объяснить: Terraform creates infra, Ansible configures systems

---

## Week 6 — Terraform/AWS Deep Dive

Цель недели: усилить главный карьерный стек. Это уже не первое касание, а закрепление.

| День | Фокус | Задачи |
|------|-------|--------|
| Day 1 | AWS/Terraform | Create VPC and Subnet Using Terraform; Launch EC2 in Private VPC Subnet Using Terraform |
| Day 2 | AWS/Terraform | Deploy Multiple EC2 Instances with Terraform OR Setting Up an Application Load Balancer for an EC2 Instance |
| Day 3 | AWS/Terraform | Grant EC2 Access to S3 Bucket Using Terraform OR Configuring a Private RDS Instance for Application Development |
| Day 4 | AWS/Terraform | Create and Configure Alarm Using CloudWatch Using Terraform OR Deploying Containerized Applications with Amazon ECS |
| Day 5 | Revise + AI | AI: Summarize Text with AI; Translate Content with AI |
| Day 6 | Light capstone | Повтор задач: Create VPC Using Terraform; Create Security Group Using Terraform; Create EC2 Instance Using Terraform |
| Day 7 | Rest | Отдых |

Мини-результат недели:
- Закрыл deep dive через реальные задачи из `terraform.md` и `cloud_aws.md`
- Закрыл слабые места по VPC/IAM/S3/EC2/CloudWatch через конкретные labs
- Подготовил основу для capstone project

---

## AI Bonus Tasks

Эти задачи можно делать в любой лёгкий день, если есть энергия:

- Create an AI Chatbot
- Generate Haikus with AI

Рекомендация:
- Chatbot лучше делать после Week 2, когда уже есть Git/Docker база
- Haikus оставить как лёгкий recovery task, чтобы не ломать учебный ритм

---

## First-Pass Kubernetes Scope

В первый проход Kubernetes достаточно этих задач из `kubernetes.md`:
- Deploy Pods in Kubernetes Cluster
- Deploy Applications with Kubernetes Deployments
- Deploy ReplicaSet in Kubernetes Cluster
- Setup Kubernetes Namespaces and PODs
- Expose Application Using NodePort Service in Kubernetes
- Execute Rolling Updates in Kubernetes
- Revert Deployment to Previous Version in Kubernetes
- Resolve VolumeMounts Issue in Kubernetes
- Troubleshoot Deployment issues in Kubernetes

Отложить на второй круг:
- Deploy Grafana on Kubernetes Cluster
- Deploy Lamp Stack on Kubernetes Cluster
- Deploy Iron Gallery App on Kubernetes
- Fix Python App Deployed on Kubernetes Cluster
- Deploy MySQL on Kubernetes
- Deploy Guest Book App on Kubernetes

---

## Capstone After Week 6

После 6 недель сделать один маленький проект:

```text
Simple app
-> Docker image
-> Kubernetes deployment
-> Jenkins pipeline
-> Terraform AWS infra
-> optional Ansible config
-> CloudWatch/logs recap
```

Цель проекта не в сложности, а в связке инструментов.

Минимальный вариант:
- Write a Docker File
- Deploy Nginx Container on Application Server
- Deploy Applications with Kubernetes Deployments
- Create EC2 Instance Using Terraform
- Write short README: architecture, commands, what broke, what fixed

---

## Progress

```text
Week 1 Linux + AWS basics:          [ ]
Week 2 Git/Docker + Terraform:      [ ]
Week 3 K8s basics + AWS networking: [ ]
Week 4 Jenkins + TF resources:      [ ]
Week 5 Ansible + TF state/modules:  [ ]
Week 6 Terraform/AWS deep dive:     [ ]
Capstone project:                   [ ]
```

---

## Notes

Заполняй по ходу:
- Сложные моменты
- Полезные команды
- Ошибки и решения
- Что повторить
- Что добавить в capstone

## Related
- [[knowledge_base]]
- [[linux]]
- [[git]]
- [[docker]]
- [[kubernetes]]
- [[jenkins]]
- [[ansible]]
- [[terraform]]
- [[cloud_aws]]
- [[cloud_azure]]
- [[ai]]
