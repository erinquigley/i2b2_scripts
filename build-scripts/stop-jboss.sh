#!/bin/bash
#########
#Script Name: stop_jboss.sh
#########
source $I2B2_SCRIPTS_DIR/i2b2-variables.rc
source ~/i2b2-variables.rc
#Start up JBoss and deploy i2b2.war, ojdbc.jar and the I2B2 cells
$JBOSS_HOME/jboss-cli.sh --connect command=:shutdown