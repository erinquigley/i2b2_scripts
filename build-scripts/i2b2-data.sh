echo "[./i2b2-data.sh] Begin."

#########
# i2b2 Data Code Configuration File Setup
# Sets up all the files that are needed for the i2b2 database
#########

source $I2B2_SCRIPTS_DIR/i2b2-variables.rc
source ~/i2b2-variables.rc
#Extract all the i2b2 source code into the $I2B2_SRC_DIR
unzip -q $I2B2_SCRIPTS_DIR/i2b2-source-code/Version_$I2B2_VERSION/i2b2createdb-$I2B2_VERSION.zip -d $I2B2_SRC_DIR/.

echo "Configure db.properties files for each schema"
interpolate_file $SKEL_DIR/database/Metadata/db.properties "I2B2_DB" "$I2B2_DB" > $METADATA_BUILD_FILE
interpolate_file $SKEL_DIR/database/Pmdata/db.properties "I2B2_DB" "$I2B2_DB" > $PMDATA_BUILD_FILE
interpolate_file $SKEL_DIR/database/Hivedata/build.properties "I2B2_DB" "$I2B2_DB" > $HIVEDATA_BUILD_FILE
interpolate_file $SKEL_DIR/database/Crcdata/db.properties "I2B2_DB" "$I2B2_DB" > $CRCDATA_BUILD_FILE
interpolate_file $SKEL_DIR/database/Workdata/db.properties "I2B2_DB" "$I2B2_DB" > $WORKDATA_BUILD_FILE
interpolate_file $SKEL_DIR/database/Imdata/db.properties "I2B2_DB" "$I2B2_DB" > $IMDATA_BUILD_FILE

echo "[./i2b2-data.sh] Finished."