#!/bin/bash

cp -r /opt/i2b2/source/webclient /var/www/html/.
chmod -R 777 /var/www/html/webclient
chown -R root:root /var/www/html/webclient
