#!/bin/bash
#########################################################
#Script Name: run_jboss.sh
#Created: August 25, 2015
#Purpose: Starts JBoss Instance
#There is no need to edit this file
#########################################################
source ~/i2b2-variables.rc
source $I2B2_SCRIPTS_DIR/i2b2-variables.rc
#Start up JBoss and deploy i2b2.war, ojdbc.jar and the I2B2 cells
nohup $JBOSS_HOME/bin/standalone.sh -b 0.0.0.0 &