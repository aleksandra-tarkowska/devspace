#!/bin/bash
sudo chmod 777 -R /home/omero/static/

CONF_FILE=/etc/nginx/conf.d/main.conf

if [ ! -f "$FILE" ]
then
    echo "$CONF_FILE config does not exist."
    sudo cp /tmp/main.conf $CONF_FILE
fi

/tmp/jenkins-slave.sh &
sudo nginx -g "daemon off;"