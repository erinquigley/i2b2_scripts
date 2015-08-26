#!/bin/bash

###########
echo "[./buildCells.sh] build cells"
###########
echo "[./buildCells.sh] Build Server-common"
cd /opt/i2b2/source/edu.harvard.i2b2.server-common
/opt/i2b2/ant/bin/ant clean dist deploy jboss_pre_deployment_setup
echo "[./buildCells.sh] build PM Cell"
cd ../edu.harvard.i2b2.pm
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy
echo "[./buildCells.sh] Build Ontology Cell"
cd /opt/i2b2/source/edu.harvard.i2b2.ontology
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy
echo "[./buildCells.sh] Build CRC Cell"
cd ../edu.harvard.i2b2.crc
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy
echo "[./buildCells.sh] Build IM Cell"
cd ../edu.harvard.i2b2.im
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy
echo "[./buildCells.sh] Build Workplace Cell"
cd ../edu.harvard.i2b2.workplace
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy
echo "[./buildCells.sh] Build File Repository Cell"
cd ../edu.harvard.i2b2.fr
/opt/i2b2/ant/bin/ant -f master_build.xml clean build-all deploy