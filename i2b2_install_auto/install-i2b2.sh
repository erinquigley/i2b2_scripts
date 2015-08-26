#!/bin/bash

#########
echo "[i2b2_install_auto/install-i2b2.sh] begin."
#########
#
# I2B2 Installer (THIS MUST BE RUN AS THE i2b2 USER!!!!!!!!!!!!!!)
#
# Installs the I2b2 cells using the environment specified in i2b2-variables.rc.
# Before running this script make sure that all variables have been set up correctly in i2b2-variables.rc
# After this installer finishes run the configure-webclient.sh script (as root)
#
#
#
#########
cp i2b2-variables.rc ~/.
source ./i2b2-variables.rc
#########

#rm -rf $SHRINE_HOME
#rm -rf $HOME/.spin

#chmod +x *.sh

#########
echo "[i2b2_install_auto/install-i2b2.sh] Your I2B2 Environment Variables (see i2b2-variables.rc)"

##########
./i2b2-src-conf.sh

./buildCells.sh

./run_jboss.sh
##########

##########
echo "[i2b2_install_auto/install-i2b2.sh] done."
##########
