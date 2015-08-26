echo "[./i2b2-src-conf.sh] Begin."

#########
# i2b2 Source Code Configuration File Setup
# Sets up all the files that are needed for the i2b2
#########

source ./i2b2-variables.rc
interpolate_file ./skel/server-common/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $SERVER_BUILD_PROP_FILE
interpolate_file ./skel/cells/build.properties "JBOSS_HOME" "$JBOSS_HOME" > $BUILD_PROP_FILE

#Interpolate the application directory files
interpolate_file ./skel/app_dir/ontology_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $ONT_APP_DIR_FILE

interpolate_file ./skel/app_dir/crc_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $CRC_APP_DIR_FILE

interpolate_file ./skel/app_dir/workplace_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $WORK_APP_DIR_FILE

interpolate_file ./skel/app_dir/im_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $IM_APP_DIR_FILE

interpolate_file ./skel/app_dir/fr_application_directory.properties "JBOSS_HOME" "$JBOSS_HOME" > $FR_APP_DIR_FILE

#Interpolate the edu.harvard.i2b2.fr.properties and the edu.harvard.i2b2.crc.loader.properties files
interpolate_file ./skel/edu.harvard.i2b2.crc.loader.properties "I2B2_HOME" "$I2B2_HOME" > $EDU_CRC_FILE
interpolate_file ./skel/edu.harvard.i2b2.fr.properties "I2B2_HOME" "$I2B2_HOME" > $EDU_FR_FILE

#Interpolate the ontology.properties, crc.properties, workplace.properties, im.properties files
interpolate_file ./skel/ontology.properties "I2B2_HOME" "$I2B2_HOME" > $ONT_PROP_FILE
interpolate_file ./skel/crc.properties "I2B2_HOME" "$I2B2_HOME" > $CRC_PROP_FILE
interpolate_file ./skel/workplace.properties "I2B2_HOME" "$I2B2_HOME" > $WORK_PROP_FILE
interpolate_file ./skel/im.properties "I2B2_HOME" "$I2B2_HOME" > $IM_PROP_FILE

#Interpolate the CRCLoaderApplicationContext.xml file
interpolate_file ./skel/CRCLoaderApplicationContext.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $CRC_LOAD_XML_FILE

#Interpolate the Datasource Files
interpolate_file ./skel/ds/pm-ds.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $PM_DS_FILE
interpolate_file ./skel/ds/ont-ds.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $ONT_DS_FILE
interpolate_file ./skel/ds/crc-ds.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $CRC_DS_FILE
interpolate_file ./skel/ds/work-ds.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $WORK_DS_FILE
interpolate_file ./skel/ds/im-ds.xml "I2B2_DB_HOME" "$I2B2_DB_HOME" > $IM_DS_FILE

#Interpolate the webclient i2b2_config_data.js file
interpolate_file ./skel/i2b2_config_data.js "I2B2_HOME" "$I2B2_HOME" > $WEBCLIENT_DATA_FILE

#Extract all the i2b2 source code into the $I2B2_SRC_DIR
unzip -q $I2B2_SRC_DIR/i2b2_scripts/Version_$I2B2_VERSION/i2b2core-src-$I2B2_VERSION.zip -d $I2B2_SRC_DIR
unzip -q $I2B2_SRC_DIR/i2b2_scripts/Version_$I2B2_VERSION/i2b2webclient-$I2B2_VERSION.zip -d $I2B2_SRC_DIR

#Copy all the build.properties file to the $I2B2_SRC_DIR location for each cell
cp $SERVER_BUILD_PROP_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.server-common/.
cp $BUILD_PROP_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.pm/.
cp $BUILD_PROP_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.ontology/.
cp $BUILD_PROP_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.crc/.
cp $BUILD_PROP_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.workplace/.
cp $BUILD_PROP_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.im/.
cp $BUILD_PROP_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.fr/.

#Copy all the application_directory.properties files to the $I2B2_SRC_DIR location for each cell
cp $ONT_APP_DIR_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.ontology/etc/spring/.
cp $CRC_APP_DIR_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.crc/etc/spring/.
cp $WORK_APP_DIR_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.workplace/etc/spring/.
cp $IM_APP_DIR_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.im/etc/spring/.
cp $FR_APP_DIR_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.fr/etc/spring/.

#Copy all the edu.harvard...properties files to the $I2B2_SRC_DIR location for each cell
cp $EDU_CRC_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.crc/etc/spring/.
cp $EDU_FR_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.fr/etc/spring/.

#Copy the CRCLoader.xml file to the $I2B2_SRC_DIR location for the CRC cell
cp $CRC_LOAD_XML_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.crc/etc/spring/.

#Copy the i2b2_config_data.js file file to the $I2B2_SRC_DIR location for the webclient
cp $WEBCLIENT_DATA_FILE $I2B2_SRC_DIR/webclient/.

#Copy the ds.xml files to the $I2B2_SRC_DIR location for each cell
cp $PM_DS_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.pm/etc/jboss/.
cp $ONT_DS_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.ontology/etc/jboss/.
cp $CRC_DS_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.crc/etc/jboss/.
cp $WORK_DS_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.workplace/etc/jboss/.
cp $IM_DS_FILE $I2B2_SRC_DIR/edu.harvard.i2b2.im/etc/jboss/.


echo "[./i2b2-src-conf.sh] Done."