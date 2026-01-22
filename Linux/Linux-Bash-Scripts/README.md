# 🛠️ Linux-Bash-Scripts

## 📄 Task Description
The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for taking websites backup. They have a static website running on App Server 3 in Stratos Datacenter, and they need to create a bash script named official_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 3).



a. Create a zip archive named xfusioncorp_official.zip of /var/www/html/official directory.


b. Save the archive in /backup/ on App Server 3. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Nautilus Backup Server.


c. Copy the created archive to Nautilus Backup Server server in /backup/ location.


d. Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.


e. Do not use sudo inside the script.

Note:
The zip package must be installed on given App Server before executing the script. This package is essential for creating the zip archive of the website files. Install it manually outside the script.

---

## 🚀 Solution

### 📝 Execution Steps:

```bash
# 1. Login to App Server 3
ssh banner@stapp03 
# Switch to root to install packages and configure directories
sudo su - 

# 2. Install prerequisites and setup permissions (as Root)
# 'zip' is required to create archives
yum install zip -y

# Ensure the script directory exists and banner owns it
mkdir -p /scripts
chown banner:banner /scripts

# Ensure banner can write to the local backup directory
chown banner:banner /backup 

# Switch back to 'banner' user to setup the script
exit 

# 3. Setup Passwordless SSH to Backup Server (as banner)
# We need this so the script doesn't hang waiting for a password.
# Target: clint@stbkp01 (Password from infrastructure details:)
ssh-keygen -t rsa
ssh-copy-id clint@stbkp01

# 4. Create the backup script
# We use 'cat' with EOF to write the file directly.
cat << 'EOF' > /scripts/official_backup.sh
#!/bin/bash

# a. & b. Create zip archive of the website folder to local backup dir
zip -r /backup/xfusioncorp_official.zip /var/www/html/official

# c. Copy the created archive to Nautilus Backup Server
# Using SCP without password (thanks to step 3)
scp /backup/xfusioncorp_official.zip clint@stbkp01:/backup/
EOF

# 5. Make executable and run test
chmod +x /scripts/official_backup.sh
/scripts/official_backup.sh
```
