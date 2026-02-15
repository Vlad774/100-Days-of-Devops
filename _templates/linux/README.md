# [Task Name]

![Bash](https://img.shields.io/badge/Bash-5.0+-black?style=flat&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-grey?style=flat&logo=linux&logoColor=white)

## 📋 Task Description

[Describe the task as it arrived — from a ticket, a team request, or an incident.]

## 🏗️ Architecture & Logic

[What the script or configuration does and what steps it consists of.]

```
script.sh
├── 1. Validate input arguments
├── 2. Find files older than N days
├── 3. Archive into .tar.gz
├── 4. Copy to backup server (scp)
└── 5. Remove old archives
```

## 🧠 Why This Approach (Key Decisions)

- **Why `set -euo pipefail`** — `-e` stops the script on any error; `-u` exits on uninitialized variable reference; `pipefail` catches errors inside pipes. Without these flags the script silently continues after a failure.
- **[Add your own decision]** — explain the key choice specific to this task.

## 🛠️ Tech Stack

- **Tool:** Bash
- **Version:** 5.0+
- **OS:** Linux (RHEL/CentOS/Ubuntu)

## 🚀 How to Run

```bash
# Make the script executable
chmod +x script.sh

# Run
./script.sh [arguments]

# Debug mode (prints each command as it executes)
bash -x script.sh [arguments]
```
