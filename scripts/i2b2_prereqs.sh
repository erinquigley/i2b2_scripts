#!/bin/bash

###########
echo "[./i2b2_prereqs.sh] begin"
###########
# become root
###########
sudo su - 
###########
# yum installs
###########
echo "[./i2b2_prereqs.sh] yum installs"
yum -y install java-1.7.0-openjdk.x86_64
yum -y install httpd.x86_64
yum -y install php.x86_64
yum -y install subversion.x86_64
service httpd start
###########
# add i2b2 user, i2b2-owned i2b2 directory
###########
echo "[./i2b2_prereqs.sh] add i2b2 user"
adduser i2b2
mkdir /opt/i2b2
chown -R i2b2:i2b2 /opt/i2b2
###########
# become i2b2 user
###########
exit
echo "[./i2b2_prereqs.sh] become i2b2"
sudo su - i2b2
cd /opt
svn co https://open.med.harvard.edu/svn/shrine/releases/1.19.2/code/install/i2b2-1.7 quick_install
cd i2b2
mkdir source
###########
# download jboss, ant, and axis2 zip files
###########
echo "[./i2b2_prereqs.sh] download jboss, ant, and axis2"
wget https://www.i2b2.org/software/projects/installer/jboss-as-7.1.1.Final.zip
wget http://archive.apache.org/dist/ant/binaries/apache-ant-1.8.2-bin.zip
wget https://www.i2b2.org/software/projects/installer/axis2-1.6.2-war.zip
###########
# unzip and remove zip files
###########
unzip jboss-as-7.1.1.Final.zip
unzip apache-ant-1.8.2-bin.zip
unzip axis2-1.6.2-war.zip
rm jboss-as-7.1.1.Final.zip
rm apache-ant-1.8.2-bin.zip
rm axis2-1.6.2-war.zip
###########
# configure JBoss, i2b2.war, and Ant
###########
mv jboss-as-7.1.1.Final jboss
mv apache-ant-1.8.2 ant
mkdir jboss/standalone/deployments/i2b2.war
touch jboss/standalone/deployments/i2b2.war.dodeploy
mv axis2.war axis2.zip 
mv axis2.zip jboss/standalone/deployments/i2b2.war/.
unzip jboss/standalone/deployments/i2b2.war/axis2.zip
rm jboss/standalone/deployments/i2b2.war/axis2.zip
###########
# Clone the i2b2_scipts repo
###########
cd source
git clone https://github.com/erinquigley/i2b2_scripts.git

