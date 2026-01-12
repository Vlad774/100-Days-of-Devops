for host in stapp01 stapp02 stapp03; do
  echo "========================================"
  echo "Check: $host"
  
  
  if [ "$host" == "stapp01" ]; then user="tony"; pass=$STAPP01_PASS; fi
  if [ "$host" == "stapp02" ]; then user="steve"; pass=$STAPP02_PASS; fi
  if [ "$host" == "stapp03" ]; then user="banner"; pass=$STAPP03_PASS; fi
    
  echo -n "   Status Squid: "
  sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$host "systemctl is-active squid"

  echo "   Configuration:"
  sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$host "cat /etc/logrotate.d/squid 2>/dev/null | grep -E 'monthly|rotate|compress'"
  
  echo "========================================"
done