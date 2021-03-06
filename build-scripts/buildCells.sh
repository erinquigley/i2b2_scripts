#########################################################
#Script Name: buildCells.sh
#Created: August 26, 2015
#Purpose: Executes the ANT builds for each i2b2 Cell
#There is no need to edit this file
#########################################################
source ~/i2b2-variables.rc
source $I2B2_SCRIPTS_DIR/i2b2-variables.rc
###########
echo "[./buildCells.sh] build cells"
###########
echo "[./buildCells.sh] Build Server-common"
cd $SERVER_SRC_DIR
$ANT_HOME/bin/ant clean dist deploy jboss_pre_deployment_setup
echo "[./buildCells.sh] build PM Cell"
cd $PM_SRC_DIR
$ANT_HOME/bin/ant -f master_build.xml clean build-all deploy
echo "[./buildCells.sh] Build Ontology Cell"
cd $ONT_SRC_DIR
$ANT_HOME/bin/ant -f master_build.xml clean build-all deploy
echo "[./buildCells.sh] Build CRC Cell"
cd $CRC_SRC_DIR
$ANT_HOME/bin/ant -f master_build.xml clean build-all deploy
echo "[./buildCells.sh] Build IM Cell"
cd $IM_SRC_DIR
$ANT_HOME/bin/ant -f master_build.xml clean build-all deploy
echo "[./buildCells.sh] Build Workplace Cell"
cd $WORK_SRC_DIR
$ANT_HOME/bin/ant -f master_build.xml clean build-all deploy
echo "[./buildCells.sh] Build File Repository Cell"
cd $FR_SRC_DIR
$ANT_HOME/bin/ant -f master_build.xml clean build-all deploy