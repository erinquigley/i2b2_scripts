echo "[./i2b2-src-conf.sh] Begin."

#########
# i2b2 Source Code Configuration File Setup
# Sets up all the files that are needed for the i2b2
#########

source $I2B2_SCRIPTS_DIR/i2b2-variables.rc
source ~/i2b2-variables.rc

#Extract all the i2b2 source code into the $I2B2_SRC_DIR
unzip -q $I2B2_SCRIPTS_DIR/i2b2-source-code/Version_$I2B2_VERSION/i2b2core-src-$I2B2_VERSION.zip -d $I2B2_SRC_DIR/.
#unzip -q $I2B2_SCRIPTS_DIR/i2b2-source-code/Version_$I2B2_VERSION/i2b2webclient-$I2B2_VERSION.zip -d $I2B2_SRC_DIR/.
echo "Configure build.properties files for each cell"
interpolate_file $SKEL_DIR/server-common/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $SERVER_BUILD_PROP_FILE
interpolate_file $SKEL_DIR/pm/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $PM_BUILD_FILE
interpolate_file $SKEL_DIR/ont/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $ONT_BUILD_FILE
interpolate_file $SKEL_DIR/crc/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $CRC_BUILD_FILE
interpolate_file $SKEL_DIR/work/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $WORK_BUILD_FILE
interpolate_file $SKEL_DIR/im/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $IM_BUILD_FILE
interpolate_file $SKEL_DIR/fr/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $FR_BUILD_FILE

#Interpolate the application directory files
echo "Configure application_directory.properties files"
interpolate_file $SKEL_DIR/ont/ontology_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $ONT_APP_DIR_FILE
interpolate_file $SKEL_DIR/crc/crc_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $CRC_APP_DIR_FILE
interpolate_file $SKEL_DIR/work/workplace_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $WORK_APP_DIR_FILE
interpolate_file $SKEL_DIR/im/im_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $IM_APP_DIR_FILE
interpolate_file $SKEL_DIR/fr/fr_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $FR_APP_DIR_FILE

#Interpolate the edu.harvard.i2b2.fr.properties and the edu.harvard.i2b2.crc.loader.properties files
echo "Configure the edu.harvard.i2b2...properties files"
interpolate_file $SKEL_DIR/crc/edu.harvard.i2b2.crc.loader.properties "I2B2_URL" "$I2B2_URL" > $EDU_CRC_FILE
interpolate_file $SKEL_DIR/fr/edu.harvard.i2b2.fr.properties "I2B2_URL" "$I2B2_URL" > $EDU_FR_FILE

#Interpolate the ontology.properties, crc.properties, workplace.properties, im.properties files
echo "configure the cell's .properties files"
interpolate_file $SKEL_DIR/ont/ontology.properties "I2B2_URL" "$I2B2_URL" > $ONT_PROP_FILE
interpolate_file $SKEL_DIR/crc/crc.properties "I2B2_URL" "$I2B2_URL" > $CRC_PROP_FILE
interpolate_file $SKEL_DIR/work/workplace.properties "I2B2_URL" "$I2B2_URL" > $WORK_PROP_FILE
interpolate_file $SKEL_DIR/im/im.properties "I2B2_URL" "$I2B2_URL" > $IM_PROP_FILE

#Interpolate the CRCLoaderApplicationContext.xml file
interpolate_file $SKEL_DIR/crc/CRCLoaderApplicationContext.xml "I2B2_DB" "$I2B2_DB" > $CRC_LOAD_XML_FILE

#Interpolate the Datasource Files
echo "Configure the datasource xml files"
interpolate_file $SKEL_DIR/pm/pm-ds.xml "I2B2_DB" "$I2B2_DB" > $PM_DS_FILE
interpolate_file $SKEL_DIR/ont/ont-ds.xml "I2B2_DB" "$I2B2_DB" > $ONT_DS_FILE
interpolate_file $SKEL_DIR/crc/crc-ds.xml "I2B2_DB" "$I2B2_DB" > $CRC_DS_FILE
interpolate_file $SKEL_DIR/work/work-ds.xml "I2B2_DB" "$I2B2_DB" > $WORK_DS_FILE
interpolate_file $SKEL_DIR/im/im-ds.xml "I2B2_DB" "$I2B2_DB" > $IM_DS_FILE

#Interpolate the webclient i2b2_config_data.js file
#interpolate_file $I2B2_SCRIPTS_DIR/skel/i2b2_config_data.js "I2B2_URL" "$I2B2_URL" > $WEBCLIENT_DATA_FILE


echo "[./i2b2-src-conf.sh] Done."
