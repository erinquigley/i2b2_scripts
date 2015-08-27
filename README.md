# i2b2_scripts
This automates an i2b2 install down to a few steps and very little configuration.
On the server:

1. (as root) Pull down the i2b2_scripts repo into /opt                                 
   git clone https://github.com/erinquigley/i2b2_scripts.git

2. Edit the i2b2-variables.rc file under /opt/i2b2_scripts. All you need to edit are the first four variables: I2B2_VERSION, I2B2_DB (format: dbServer:port:SID), I2B2_URL (format: i2b2Server:port) and WEBCLIENT_DIR

3. Run the i2b2_prereqs.sh script (does the yum installs, the wget downloads, the i2b2.war configuration, webclient configuration)
   /opt/i2b2_scripts/root_scripts/i2b2_prereqs.sh
3. Become the i2b2 user
   sudo su - i2b2
   cd /opt/i2b2_scripts
4. (as i2b2) Run install-i2b2.sh
   ./install-i2b2.sh
5. Verify your install
