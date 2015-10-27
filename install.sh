#!/bin/bash

#configuration options
export LUCEE_VERSION="4.5.1.022"
export JVM_MAX_HEAP_SIZE="2048"
export JVM_FILE="jdk-7-linux-x64.tar.gz"
export JVM_VERSION="1.7.0_79"


#root permission check
if [ "$(whoami)" != "root" ]; then
  echo "Sorry, you need to run this script using sudo or as root."
  exit 1
fi

function separator {
  echo "------------------------------------------------"
}

#make sure scripts are runnable
chown -R root scripts/*.sh
chmod u+x scripts/*.sh

#update ubuntu software
./scripts/100-ubuntu-update.sh
separator

#install oracle jdk 7
./scripts/150-jve.sh
separator

#download lucee
./scripts/200-lucee.sh
separator

#install tomcat
./scripts/300-tomcat.sh
separator

#install jvm
./scripts/400-jvm.sh
separator

#install nginx
./scripts/500-nginx.sh
separator

echo "Setup Complete"
separator
echo "GO SET YOUR LUCEE PASSWORDS: http://localhost/lucee/admin/server.cfm"
