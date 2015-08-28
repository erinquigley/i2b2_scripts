#!/bin/bash
#########################################################
#Script Name: stop-jboss.sh
#Created: August 25, 2015
#Purpose: Stops JBoss Instance
#There is no need to edit this file
#########################################################
source $I2B2_SCRIPTS_DIR/i2b2-variables.rc
source ~/i2b2-variables.rc
#Start up JBoss and deploy i2b2.war, ojdbc.jar and the I2B2 cells
$JBOSS_HOME/bin/jboss-cli.sh --connect command=:shutdown