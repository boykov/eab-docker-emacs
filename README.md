# eab-docker-emacs

see https://github.com/JAremko/docker-emacs

## TODO man

https://stackoverflow.com/questions/54152906/how-to-install-man-pages-on-an-ubuntu-docker-image

## TODO Source Code Pro fonts for emacs GUI

https://www.rogerpence.com/posts/install-source-code-pro-font-on-ubuntu

## TODO apt-get inside virtualenv

https://stackoverflow.com/questions/11441546/how-i-can-make-apt-get-install-to-my-virtualenv
pip зависимости из моего вспомогательного "слоя" можно попробовать разместить в virtualenv
а потом использовать их через wrap workon

С новой версией ubuntu появилась новая версия python, с проблемами
совместимости с протестированным в Dockerfile.emacs25 слоем.
Нужно сделать virtualenv со старой версией python?
https://stackoverflow.com/questions/14591579/how-to-isolate-virtualenv-from-local-dist-packages

Похоже, дело не только в версии питона, а еще и в других библиотеках,
например ssl, устанавливаемых через apt. Значит, надо запускать
подобные слои через контейнер? но это будет docker inside docker? или podman

## build

ssh chronos
cd ~/data/gitno/github/eab-docker-emacs
docker build -f dockerfiles/Dockerfile.emacs28.1 -t harbor.homew.keenetic.pro/eab/eab-emacs28:0.0.2 .
docker push harbor.homew.keenetic.pro/eab/eab-emacs28:0.0.2

docker rm eab-emacs
/bin/bash emacs-docker.sh
docker ps
# docker exec -it eab-emacs asEnvUser /bin/bash
ps aux 
tmux
tmux set -g status off;

demacs
tmux
tmux set -g status off;

docker stop eab-emacs
docker rm eab-emacs


## openvpn 

sudo apt-get install openvpn
# + cp config; mount /etc/openvpn?
sudo apt-get install curl
echo     ServerAliveInterval 120 >> /etc/ssh/ssh_config


## emacs28

ENV LIBRARY_PATH=/install_dir/lib
ENV LD_LIBRARY_PATH=/install_dir/lib
ENV PATH=/install_dir/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

PATH=/install_dir/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

sudo apt-get install libtinfo-dev
sudo apt-get install ncurses-dev
sudo apt-get install libncurses5-dev
sudo apt-get remove libncurses5-dev
sudo apt-get install libncursesw5-dev

ldd /install_dir/bin/emacs | grep libtin

ls /usr/lib/x86_64-linux-gnu/ | grep libtinf
ls /usr/lib/x86_64-linux-gnu/ | grep libnc
sudo ln -s /usr/lib/x86_64-linux-gnu/libncurses.so /usr/lib/x86_64-linux-gnu/libtinfo.so.6
sudo ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6.1 /usr/lib/x86_64-linux-gnu/libtinfo.so.6
sudo rm -f /usr/lib/x86_64-linux-gnu/libtinfo.so.6

sudo apt-get install libtinfo-dev=6.1-1ubuntu.1
LIBRARY_PATH=/install_dir/lib LD_LIBRARY_PATH=/install_dir/lib dcemacs
dcemacs

docker stop eab-emacs28
docker rm eab-emacs28



ssh 172.17.0.3
export LIBRARY_PATH=/install_dir/lib LD_LIBRARY_PATH=/install_dir/lib
sudo apt-get update
sudo apt-get install libjpeg62

## DONE

apt-get update
apt-get install bc

apt install cmake
apt install build-essential
apt install libssl-dev
apt install ispell
apt install xterm (for org :session)
apt install graphviz

pip3 install gitlabber
sudo apt install ansible

cat ~/.gnupg/gpg.conf
ignore-mdc-error


<!-- dictionary -->
apt-get install dictd
cd /usr/share/dictd
sudo /home/eab/git/auto/downdict.sh
sudo dictdconfig -w
dict -I
sudo /etc/init.d/dictd stop
sudo /etc/init.d/dictd start

copy ~/.eev folder

rebuild emacs with librsvg2-dev
also may be with
[x] libacl1-dev
[x] libncurses-dev
[ ] libgtk-3-dev
configure: WARNING: Your version of Gtk+ will have problems with
       closing open displays.  This is no problem if you just use
       one display, but if you use more than one and close one of them
       Emacs may crash.
       See https://gitlab.gnome.org/GNOME/gtk/issues/221
[ ] libxaw3dxft6
[x] librsvg2-dev
[x] imagemagick
[ ] libgpm-dev
[x] libdbus-1-dev
[ ] libgconf-2-4
[ ] libm17n-dev
[x] libotf-dev

host:
gnuplot
emacs-bin-common (for emacsclient)

## additional

TODO +svg java ditaa
wget https://github.com/stathissideris/ditaa/releases/download/v0.11.0/ditaa-0.11.0-standalone.jar


TODO duplicate settings cmd.sh and .bashrc
TMPDIR, ~/.ssh/tramp, ~/git/auto

TODO to stabilize current build; separated compiled emacs image
