# 🛠️ Application-Security

## 📄 Task Description
We have a backup management application UI hosted on Nautilus's backup server in Stratos DC. That backup management application code is deployed under Apache on the backup server itself, and Nginx is running as a reverse proxy on the same server. Apache and Nginx ports are 5002 and 8096, respectively. We have iptables firewall installed on this server. Make the appropriate changes to fulfill the requirements mentioned below:

We want to open all incoming connections to Nginx's port and block all incoming connections to Apache's port. Also make sure rules are permanent.

---

## 🚀 Solution

### 📋 Prerequisites
* **Server:** Nautilus Backup Server (`stbkp01`)
* **Tools:** `nginx`, `iptables`, `ss`

### 📝 Execution Steps:

#### 1. Configure Nginx
First, we need to change the Nginx listening port from the default 80 to 8096.

```bash
# 1. Verify current ports
sudo ss -tulpn

# 2. Edit Nginx configuration (replace port 80 with 8096)
# You can use vi/nano, or this sed command:
sudo sed -i 's/listen       80;/listen       8096;/g' /etc/nginx/nginx.conf

# 3. Restart Nginx to apply changes
sudo systemctl restart nginx

# 4. Verify Nginx is listening on 8096
sudo ss -tulpn | grep 8096


#### 2. Configure Firewall (iptables)

# 1. Block Apache (Port 5002) - Insert at line 1
sudo iptables -I INPUT 1 -p tcp --dport 5002 -j DROP

# 2. Allow Nginx (Port 8096) - Insert at line 1 (pushes the previous rule to line 2)
# Ideally, we want Allow above Drop, but for different ports, the order between these two doesn't matter, 
# as long as they are above the global REJECT rule.
sudo iptables -I INPUT 1 -p tcp --dport 8096 -j ACCEPT

# 3. Verify the order (Rules must be above REJECT)
sudo iptables -L INPUT -n --line-numbers

# 4. Save rules permanently
sudo service iptables save