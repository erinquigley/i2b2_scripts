#########################################################
#!/bin/bash
#Script Name:database-fill.sh
#Created: August 27, 2015
#Purpose: Runs the ant builds for the i2b2 schemas for the database
#There is no need to edit this file
#########################################################
source ~/i2b2-variables.rc
source $I2B2_SCRIPTS_DIR/i2b2-variables.rc
#Build CRCData in Database
cd $CRCDATA_DIR
$ANT_HOME/bin/ant –f data_build.xml create_crcdata_tables_release_1-7
$ANT_HOME/bin/ant –f data_build.xml create_procedures_release_1-7
$ANT_HOME/bin/ant –f data_build.xml db_demodata_load_data

#Build HiveData in Database
cd $HIVEDATA_DIR
$ANT_HOME/bin/ant –f data_build.xml create_hivedata_tables_release_1-7
$ANT_HOME/bin/ant –f data_build.xml db_hivedata_load_data

#Build MetaData in Database
cd $METADATA_DIR
$ANT_HOME/bin/ant -f data_build.xml create_metadata_tables_release_1-7
$ANT_HOME/bin/ant –f data_build.xml db_metadata_load_data

#Build PMData in Database
cd $PMDATA_DIR
$ANT_HOME/bin/ant –f data_build.xml create_pmdata_tables_release_1-7
$ANT_HOME/bin/ant –f data_build.xml create_triggers_release_1-7
$ANT_HOME/bin/ant –f data_build.xml db_pmdata_load_data

#Build WorkData in Database
cd $WORKDATA_DIR
$ANT_HOME/bin/ant –f data_build.xml create_workdata_tables_release_1-7
$ANT_HOME/bin/ant –f data_build.xml db_workdata_load_data

#Build IMData in Database
cd $IMDATA_DIR
$ANT_HOME/bin/ant -f data_build.xml create_imdata_tables_release_1-7
$ANT_HOME/bin/ant -f data_build.xml db_imdata_load_data