#!/bin/bash

###########
echo "build cells"
###########
echo "Build Server-common"
cd /opt/i2b2/source/edu.harvard.i2b2.server-common
/opt/i2b2/ant/bin/ant clean dist deploy jboss_pre_deployment_setup
echo "build PM Cell"
cd ../edu.harvard.i2b2.pm
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy
exit
echo "Become root and move the webclient to /var/www/"
sudo su -
cp -r /opt/i2b2/source/webclient /var/www/.
exit
echo "Become i2b2 user"
sudo su - i2b2
echo "Build Ontology Cell"
cd /opt/i2b2/source/edu.harvard.i2b2.ontology
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy
echo "Build CRC Cell"
cd ../edu.harvard.i2b2.crc
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy
echo "Build IM Cell"
cd ../edu.harvard.i2b2.im
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy
echo "Build Workplace Cell"
cd ../edu.harvard.i2b2.workplace
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy
echo "Build File Repository Cell"
cd ../edu.harvard.i2b2.fr
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy