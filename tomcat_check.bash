#!/bin/bash

HTTPCODE=`curl -m 30 -o /dev/null --silent --head --write-out '%{http_code}\n' http://localhost:8080/application/`
TOMCATDIR="/opt/tomcat-8080/"
TOMCATSTART="./bin/catalina.sh start"
KILLTOMCAT="kill -9 `ps ax | grep 8080 | grep -v grep |  awk '{print $1}'`"
TODAY=`date +%Y%m%d_%R`

echo "--------------------------------------------------------------"
echo "Date :" $TODAY

if [ $HTTPCODE -eq 405 ];then
	echo "Status: Tomcat is working as expected with http_code $HTTPCODE"
else
	echo "Status: Tomcat failed, restarting it"
	cd $TOMCATDIR
	$KILLTOMCAT
	$TOMCATSTART
#	echo "Tomcat failed on Server1 at $TODAY, restarted it." | mail -s "Server1: Tomcat Restarted" "user@email.com"
fi
echo "--------------------------------------------------------------"

