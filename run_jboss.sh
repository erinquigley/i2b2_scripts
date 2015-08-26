#!/bin/bash
#########
#Script Name: run_jboss.sh
#########
source ./i2b2-variables.rc
#Start up JBoss and deploy i2b2.war, ojdbc.jar and the I2B2 cells
nohup $JBOSS_HOME/bin/standalone.sh -b 0.0.0.0 &