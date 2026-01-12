#!/bin/bash

# Logrotate config
LOG_CONFIG="/var/log/squid/*.log {
    monthly
    rotate 3
    compress
    missingok
    notifempty
    sharedscripts
    postrotate
        /usr/sbin/squid -k rotate 2>/dev/null
    endscript
}"

deploy_server() {
    USER=$1
    HOST=$2
    PASS=$3 

    if [ -z "$PASS" ]; then
        echo "Error: Password for $HOST is missing!"
        return 1
    fi

    echo "=== Starting deployment for $HOST ($USER) ==="
    export SSHPASS=$PASS

    # 1. Install Squid
    # We use 'echo $PASS | sudo -S' to pass the password to sudo non-interactively
    echo "Step 1: Installing Squid..."
    sshpass -e ssh -o StrictHostKeyChecking=no $USER@$HOST "echo '$PASS' | sudo -S yum install -y squid"
    
    # 2. Enable Service
    sshpass -e ssh -o StrictHostKeyChecking=no $USER@$HOST "echo '$PASS' | sudo -S systemctl enable --now squid"

    # 3. Deploy Config (The 'Move' Strategy)
    echo "Step 2: Deploying logrotate config..."
    
    # A. Write to a temp file in /tmp (No sudo needed here)
    echo "$LOG_CONFIG" | sshpass -e ssh -o StrictHostKeyChecking=no $USER@$HOST "cat > /tmp/squid_logrotate_temp"
    
    # B. Move it to the system folder using sudo
    sshpass -e ssh -o StrictHostKeyChecking=no $USER@$HOST "echo '$PASS' | sudo -S mv /tmp/squid_logrotate_temp /etc/logrotate.d/squid"
    
    # C. Set correct root permissions
    sshpass -e ssh -o StrictHostKeyChecking=no $USER@$HOST "echo '$PASS' | sudo -S chown root:root /etc/logrotate.d/squid"

    echo "✅ Configuration for $HOST is complete!"
    echo "------------------------------------------------"
}

# --- Execution ---

# Ensure variables are exported in your terminal before running!
deploy_server "tony"   "stapp01" "$STAPP01_PASS"
deploy_server "steve"  "stapp02" "$STAPP02_PASS"
deploy_server "banner" "stapp03" "$STAPP03_PASS"