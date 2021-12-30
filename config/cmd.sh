#!/bin/bash

mkdir /home/$UNAME/.gnupg
cp /RNTM/gpg.conf /home/$UNAME/.gnupg/gpg.conf
cp -r /RNTM/.eev /home/$UNAME/
sudo chown -R $UNAME:$GNAME /home/$UNAME/.eev
sudo chown -R $UNAME:$GNAME /home/$UNAME/.gnupg
sudo chmod 0700 /home/$UNAME/.gnupg



# Start supervisord and services
sudo /usr/bin/supervisord -n -c /etc/supervisord.conf &
sudo /etc/init.d/dictd start
sleep infinity
