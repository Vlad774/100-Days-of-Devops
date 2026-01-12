# 🛠️ Linux LogRotate

## 📄 Task Description
The Nautilus DevOps team is ready to launch a new application, which they will deploy on app servers in Stratos Datacenter. They are expecting significant traffic/usage of squid on app servers after that. This will generate massive logs, creating huge log files. To utilise the storage efficiently, they need to compress the log files and need to rotate old logs. Check the requirements shared below:



a. In all app servers install squid package.


b. Using logrotate configure squid logs rotation to monthly and keep only 3 rotated logs.

---

**Requirements:**
1.  **Install:** Squid package on all app servers.
2.  **Frequency:** Rotate logs **monthly**.
3.  **Retention:** Keep only **3** rotated log files.
4.  **Compression:** Compress old log files.

---

## 🚀 Solution

The task is automated using the `deploy_squid.sh` Bash script. The script is idempotent and handles `sudo` privileges non-interactively.

### 📝 Execution Steps:

**1. Export Passwords (Jump Host)**
Set the passwords as environment variables in your current session to avoid hardcoding them in the script.

```bash
export STAPP01_PASS=''
export STAPP02_PASS=''
export STAPP03_PASS=''

```bash
chmod +x deploy_squid.sh
./deploy_squid.sh
```

```bash
for host in stapp01 stapp02 stapp03; do
  echo "--- $host ---"
  if [ "$host" == "stapp01" ]; then pass=$STAPP01_PASS; user="tony"; fi
  if [ "$host" == "stapp02" ]; then pass=$STAPP02_PASS; user="steve"; fi
  if [ "$host" == "stapp03" ]; then pass=$STAPP03_PASS; user="banner"; fi
  
  sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$host \
  "systemctl is-active squid && cat /etc/logrotate.d/squid | grep -E 'monthly|rotate|compress'"
done
```

Expected Output:

Service Status: active

Config: Should list monthly, rotate 3, and compress.
