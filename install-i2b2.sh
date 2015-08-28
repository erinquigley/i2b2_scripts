#!/bin/bash
#########################################################
#Script Name: install-i2b2.sh
#Created: August 25, 2015
#Purpose: This is the i2b2 installer. It first checks to see whether I2B2_DATA_INSTALL was a "Y" or "N"
######### It runs or skips i2b2-data.sh and database-fill.sh depending upon I2B2_DATA_INSTALL
######### It then runs i2b2-src-conf.sh which configures all the i2b2 Cells files
######### It then runs buildCells.sh and builds out each i2b2 Cell
######### It finally runs run-jboss.sh to start the instance of JBoss and deploy the i2b2 cells
######### It also copies run-jboss.sh and stop-jboss.sh to your I2B2_HOME directory 
#This file does not need to be edited.
#########################################################
echo "[./install-i2b2.sh] begin."
#########
cp i2b2-variables.rc ~/.
source ./i2b2-variables.rc
echo "[./install-i2b2.sh] Your I2B2 Environment Variables (see i2b2-variables.rc)"
##########

#Checks to see if the i2b2 Data Installation needs to be done.
if [ "$I2B2_DATA_INSTALL" == "Y" ]
then
./build-scripts/i2b2-data.sh
./build-scripts/database-fill.sh
else
  echo "You have chosen not to build the tables in the i2b2 database."
fi
##########

#Configures and Builds the i2b2 Cells
./build-scripts/i2b2-src-conf.sh
./build-scripts/buildCells.sh
##########

#Starts JBoss
./build-scripts/run-jboss.sh
cp $I2B2_SCRIPTS_DIR/build-scripts/run-jboss.sh $I2B2_HOME/.
cp $I2B2_SCRIPTS_DIR/build-scripts/stop-jboss.sh $I2B2_HOME/.
##########

##########
echo "[./install-i2b2.sh] done."
##########
