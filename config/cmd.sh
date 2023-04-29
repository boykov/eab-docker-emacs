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
rm -f ~/.emacs.d/server/$EDAEMON
emacs --daemon=$EDAEMON
if [ -s "/home/eab/.emacs.d/server/$EDAEMON" ]; then
    if [ "$EDAEMON" = "cyclos" ]; then
        sed -i "s/127.0.0.1:5001/172.16.82.5:5001/" ~/.emacs.d/server/$EDAEMON
    fi
    if [ "$EDAEMON" = "serverC" ]; then
        sed -i "s/127.0.0.1:5001/172.16.82.3:5001/" ~/.emacs.d/server/$EDAEMON
    fi
    if [ "$EDAEMON" = "serverP" ]; then
        sed -i "s/127.0.0.1:5001/172.16.82.3:5003/" ~/.emacs.d/server/$EDAEMON
    fi
bash -c "socat TCP4-LISTEN:5002,fork TCP4:127.0.0.1:5001" &
fi

sleep infinity
