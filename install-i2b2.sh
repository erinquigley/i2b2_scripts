#!/bin/bash

#########
echo "[./install-i2b2.sh] begin."
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
source ./interpolate-i2b2.rc
cp interpolate-i2b2.rc ~/.
#########

#rm -rf $SHRINE_HOME
#rm -rf $HOME/.spin

#chmod +x *.sh

#########
echo "[./install-i2b2.sh] Your I2B2 Environment Variables (see i2b2-variables.rc)"

##########
if [ "$I2B2_DATA_INSTALL" == "Y" ]
then
./build-scripts/i2b2-data.sh
./build-scripts/database-fill.sh
else
  echo "You have chosen not to build the tables in the i2b2 database."
fi

./build-scripts/i2b2-src-conf.sh

./build-scripts/buildCells.sh

./build-scripts/run-jboss.sh
cp $I2B2_SCRIPTS_DIR/build-scripts/run-jboss.sh $I2B2_HOME/.
cp $I2B2_SCRIPTS_DIR/build-scripts/stop-jboss.sh $I2B2_HOME/.
##########

##########
echo "[./install-i2b2.sh] done."
##########
