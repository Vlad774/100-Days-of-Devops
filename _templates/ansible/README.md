# [Task Name]

![Ansible](https://img.shields.io/badge/Ansible-2.15+-EE0000?style=flat&logo=ansible&logoColor=white)

## 📋 Task Description

[Describe the task as it arrived — from a ticket, a team request, or an incident.]

## 🏗️ Architecture & Logic

[Which hosts are targeted and what gets configured.]

```
[inventory]
└── stapp01 (172.16.238.10)
└── stapp02 (172.16.238.11)

playbook.yml
└── hosts: all
    ├── task: install nginx
    ├── task: copy config
    └── task: start & enable service
```

## 🧠 Why This Approach (Key Decisions)


## 🛠️ Tech Stack

- **Tool:** Ansible
- **Version:** 2.15+

## 🚀 How to Run

```bash
# Validate syntax
ansible-playbook playbook.yml --syntax-check

# Dry run (preview changes without applying)
ansible-playbook playbook.yml --check

# Apply
ansible-playbook -i inventory.ini playbook.yml

# Target specific hosts only
ansible-playbook -i inventory.ini playbook.yml --limit stapp01

# Verbose output for debugging
ansible-playbook -i inventory.ini playbook.yml -v
```
