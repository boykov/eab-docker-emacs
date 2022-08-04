#!/bin/bash

mkdir /home/$UNAME/.gnupg
cp /RNTM/gpg.conf /home/$UNAME/.gnupg/gpg.conf
cp -r /RNTM/.eev /home/$UNAME/
sudo chown -R $UNAME:$GNAME /home/$UNAME/.eev
sudo chown -R $UNAME:$GNAME /home/$UNAME/.gnupg
sudo chmod 0700 /home/$UNAME/.gnupg

f=pub;           ln -s ~/pnt/$f ~/$f
f=git;  mkdir ~/$f; sudo mount --bind ~/pnt/$f ~/$f
f=data; mkdir ~/$f; sudo mount --bind ~/pnt/$f ~/$f
f=.ssh; mkdir ~/$f; sudo mount --bind ~/pnt/home/$f ~/$f
f=.emacs.d;      ln -s ~/pnt/home/$f ~/$f
f=.bashrc;       ln -s ~/pnt/home/$f ~/$f
f=.profile;      ln -s ~/pnt/home/$f ~/$f
f=.authinfo;     ln -s ~/pnt/home/$f ~/$f
f=.gitconfig;    ln -s ~/pnt/home/$f ~/$f

# Start supervisord and services
sudo /usr/bin/supervisord -n -c /etc/supervisord.conf &
sudo /etc/init.d/dictd start

sudo mkdir -p /tmp/user/$UID
sudo chmod 777 /tmp/user/$UID

. ~/pnt/home/.common_bash
emacs --daemon=$EDAEMON

sleep infinity
