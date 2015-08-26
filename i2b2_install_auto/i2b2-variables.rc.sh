#!/bin/bash

#
#The version of I2B2 to install (format 1704, 1705, 1706)
export I2B2_VERSION=1706

export JBOSS_HOME=/opt/i2b2/jboss
export I2B2_DB_HOME=bmic-test-db.obis.musc.edu:1521:testdb
export I2B2_HOME=bmic-i2b2-test.obis.musc.edu:8080
export I2B2_WAR=i2b2.war
export I2B2_SRC_DIR=/opt/i2b2/source
#Utility functions follow

function require()
{
  if [ -z "$1" ] ; then
    echo "Requirement not met: $2"
    exit -1
  fi
}

function escape()
{
  ESCAPED=$(echo "$1" | sed "s| |\\\ |g" | sed "s|\:|\\\:|g" | sed "s|\.|\\\.|g" | sed "s|\/|\\\/|g")
}

function interpolate_file()
{
  file=$1
  pattern=$2

  escape $3

  replacement="$ESCAPED"

  sed s/$pattern/$replacement/g $file
}

function interpolate()
{
  pattern=$1

  escape $2

  replacement="$ESCAPED"

  sed s/$pattern/$replacement/g
}
require ${I2B2_VERSION} "I2B2_VERSION must be set, and not be a snapshot"
require ${JBOSS_HOME} "JBOSS_HOME must be set, and not be a snapshot"
require ${I2B2_DB_HOME} "I2B2_DB_HOME must be set"
require ${I2B2_HOME} "I2B2_HOME must be set"