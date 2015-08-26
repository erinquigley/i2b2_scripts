echo "[./i2b2-src-conf.sh] Begin."

#########
# i2b2 Source Code Configuration File Setup
# Sets up all the files that are needed for the i2b2
#########

source ./i2b2-variables.rc

#Extract all the i2b2 source code into the $I2B2_SRC_DIR
unzip -q $I2B2_SCRIPTS_DIR/Version_$I2B2_VERSION/i2b2core-src-$I2B2_VERSION.zip -d $I2B2_SRC_DIR/.
unzip -q $I2B2_SCRIPTS_DIR/Version_$I2B2_VERSION/i2b2webclient-$I2B2_VERSION.zip -d $I2B2_SRC_DIR/.

interpolate_file $I2B2_SCRIPTS_DIR/skel/server-common/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $SERVER_BUILD_PROP_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/pm/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $PM_BUILD_FILE

interpolate_file $I2B2_SCRIPTS_DIR/skel/ont/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $ONT_BUILD_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/crc/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $CRC_BUILD_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/work/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $WORK_BUILD_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/im/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $IM_BUILD_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/fr/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $FR_BUILD_FILE

#Interpolate the application directory files
interpolate_file $I2B2_SCRIPTS_DIR/skel/ont/ontology_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $ONT_APP_DIR_FILE

interpolate_file $I2B2_SCRIPTS_DIR/skel/crc/crc_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $CRC_APP_DIR_FILE

interpolate_file $I2B2_SCRIPTS_DIR/skel/work/workplace_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $WORK_APP_DIR_FILE

interpolate_file $I2B2_SCRIPTS_DIR/skel/im/im_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $IM_APP_DIR_FILE

interpolate_file $I2B2_SCRIPTS_DIR/skel/fr/fr_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $FR_APP_DIR_FILE

#Interpolate the edu.harvard.i2b2.fr.properties and the edu.harvard.i2b2.crc.loader.properties files
interpolate_file $I2B2_SCRIPTS_DIR/skel/crc/edu.harvard.i2b2.crc.loader.properties "I2B2_HOME" "$I2B2_HOME" > $EDU_CRC_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/fr/edu.harvard.i2b2.fr.properties "I2B2_HOME" "$I2B2_HOME" > $EDU_FR_FILE

#Interpolate the ontology.properties, crc.properties, workplace.properties, im.properties files
interpolate_file $I2B2_SCRIPTS_DIR/skel/ont/ontology.properties "I2B2_HOME" "$I2B2_HOME" > $ONT_PROP_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/crc/crc.properties "I2B2_HOME" "$I2B2_HOME" > $CRC_PROP_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/work/workplace.properties "I2B2_HOME" "$I2B2_HOME" > $WORK_PROP_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/im/im.properties "I2B2_HOME" "$I2B2_HOME" > $IM_PROP_FILE

#Interpolate the CRCLoaderApplicationContext.xml file
interpolate_file $I2B2_SCRIPTS_DIR/skel/crc/CRCLoaderApplicationContext.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $CRC_LOAD_XML_FILE

#Interpolate the Datasource Files
interpolate_file $I2B2_SCRIPTS_DIR/skel/pm/pm-ds.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $PM_DS_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/ont/ont-ds.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $ONT_DS_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/crc/crc-ds.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $CRC_DS_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/work/work-ds.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $WORK_DS_FILE
interpolate_file $I2B2_SCRIPTS_DIR/skel/im/im-ds.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $IM_DS_FILE

#Interpolate the webclient i2b2_config_data.js file
interpolate_file $I2B2_SCRIPTS_DIR/skel/i2b2_config_data.js "I2B2_HOME" "$I2B2_HOME" > $WEBCLIENT_DATA_FILE


echo "[./i2b2-src-conf.sh] Done."
