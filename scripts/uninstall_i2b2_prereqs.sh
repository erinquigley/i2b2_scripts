#!bin/bash
echo "[./uninstall_i2b2_prereqs.sh] begin"
###########
# Remove i2b2-owned directories and i2b2 user
###########
rm -rf /opt/i2b2
rm -rf /opt/quick_install
userdel -r i2b2	
###########
# Stop httpd
###########
service httpd stop
###########
# remove yum installs
###########
yum remove neon.x86_64 pakchois.x86_64 perl-URI.noarch subversion.x86_64
yum remove php-cli.x86_64 php-common.x86_64 php.x86_64
yum remove apr.x86_64 apr-util.x86_64 apr-util-ldap.x86_64 httpd-tools.x86_64 httpd.x86_64
yum remove GConf2.x86_64 ORBit2.x86_64 flac.x86_64 giflib.x86_64 jpackage-utils.noarch libIDL.x86_64 libXfont.x86_64 libXtst.x86_64 libasyncns.x86_64 libfontenc.x86_64 libogg.x86_64 libsndfile.x86_64 libvorbis.x86_64 pcsc-lite-libs.x86_64 pulseaudio-libs.x86_64 sgml-common.noarch ttmkfdir.x86_64 tzdata-java.noarch xorg-x11-font-utils.x86_64 xorg-x11-fonts-Type1.noarch java-1.7.0-openjdk.x86_64