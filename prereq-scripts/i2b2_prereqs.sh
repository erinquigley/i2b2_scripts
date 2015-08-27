#!/bin/bash
source ../i2b2-variables.rc
source $I2B2_SCRIPTS_DIR/i2b2-variables.rc
###########
echo "[./i2b2_prereqs.sh] begin"

###########
# yum installs
###########
echo "[./i2b2_prereqs.sh] yum installs"
yum -y install java-1.7.0-openjdk.x86_64
yum -y install java-1.7.0-openjdk-devel.x86_64
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
###########
# become i2b2 user
###########
echo "[./i2b2_prereqs.sh] svn SHRINE quick_install directory"
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
unzip -q jboss-as-7.1.1.Final.zip
unzip -q apache-ant-1.8.2-bin.zip
unzip -q axis2-1.6.2-war.zip
rm -rf jboss-as-7.1.1.Final.zip
rm -rf apache-ant-1.8.2-bin.zip
rm -rf axis2-1.6.2-war.zip
rm -rf LICENSE.txt
rm -rf NOTICE.txt
rm -rf README.txt
rm -rf release-notes.html
###########
# configure JBoss, i2b2.war, and Ant
###########
echo "Rename jboss and ant directories"
mv jboss-as-7.1.1.Final jboss
mv apache-ant-1.8.2 ant
echo "Create i2b2.war"
mkdir jboss/standalone/deployments/i2b2.war
touch jboss/standalone/deployments/i2b2.war.dodeploy
mv axis2.war axis2.zip 
mv axis2.zip jboss/standalone/deployments/i2b2.war/.
cd jboss/standalone/deployments/i2b2.war/
unzip -q axis2.zip
rm -rf axis2.zip
###########
# Move the webclient directory to /var/www/html/
###########
echo "Get the webclient directory configured"
unzip -q $I2B2_SCRIPTS_DIR/i2b2-source-code/Version_$I2B2_VERSION/i2b2webclient-$I2B2_VERSION.zip -d $WEBCLIENT_DIR/.
#Interpolate the webclient i2b2_config_data.js file
interpolate_file $I2B2_SCRIPTS_DIR/skel/i2b2_config_data.js "I2B2_URL" "$I2B2_URL" > $WEBCLIENT_DATA_FILE
chown -R root:root $WEBCLIENT_DIR/webclient
chmod -R 777 $WEBCLIENT_DIR/webclient
###########
# Change permissions and ownership of directories
###########
echo "Change permissions and ownership of directories"
chown -R i2b2:i2b2 /opt/i2b2
chown -R i2b2:i2b2 /opt/quick_install
chown -R i2b2:i2b2 /opt/i2b2_scripts
chmod -R 777 /opt/i2b2
chmod -R 777 /opt/quick_install
chmod -R 777 /opt/i2b2_scripts
echo "[./i2b2_prereqs.sh] finished"

