#!/bin/bash
#Create Archive
zip -r /backup/xfusioncorp_official.zip /var/www/html/official

#COPY to Backup Server
scp /backup/xfusioncorp_official.zip clint@stbkp01:/backup/