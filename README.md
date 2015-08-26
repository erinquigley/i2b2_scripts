# i2b2_scripts

1. (as root) Pull down the i2b2_scripts repo into /opt
   git clone https://github.com/erinquigley/i2b2_scripts.git
2. (as root) Run the i2b2_prereqs.sh script (does the yum installs, the wget downloads, the i2b2.war configuration
   /opt/i2b2_scripts/root_scripts/i2b2_prereqs.sh
3. Become the i2b2 user
   sudo su - i2b2
   cd /opt/i2b2_scripts
4. Edit the i2b2-variables.rc file in i2b2_scripts/ with your i2b2 installs information
5. (as i2b2) Run install-i2b2.sh
   ./install-i2b2.sh
6. webclient
