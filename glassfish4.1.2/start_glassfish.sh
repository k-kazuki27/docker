#!/bin/sh

asadmin start-domain

echo "JDBC設定"
asadmin add-resources /usr/local/glassfish-resources.xml

echo "管理パスワード設定"
ADMIN_PASSWORD=admin
echo "##########GENERATED ADMIN PASSWORD: $ADMIN_PASSWORD  ##########"
echo "AS_ADMIN_PASSWORD=" > /tmp/glassfishpwd
echo "AS_ADMIN_NEWPASSWORD=${ADMIN_PASSWORD}" >> /tmp/glassfishpwd
asadmin --user=admin --passwordfile=/tmp/glassfishpwd change-admin-password
echo "AS_ADMIN_PASSWORD=${ADMIN_PASSWORD}" > /tmp/glassfishpwd
asadmin --user=admin --passwordfile=/tmp/glassfishpwd enable-secure-admin
rm /tmp/glassfishpwd

asadmin stop-domain
asadmin start-domain -v
