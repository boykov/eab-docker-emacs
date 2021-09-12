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

## compose

docker-compose -f clocksum-compose.yml up -d
docker-compose -f eab-emacs28-compose.yml up -d
docker-compose -f eab-emacs-compose.yml up -d
docker-compose -f clocksum-compose.yml down

## build

ssh kairos-host
cd ~/data/gitno/github/eab-docker-emacs
docker build -f dockerfiles/Dockerfile.emacs25 -t eab-emacs14 .
docker build -f dockerfiles/Dockerfile.emacs28 -t eab-emacs28 .
docker build -f dockerfiles/Dockerfile.andrea -t eab-andrea .

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

## additional

apt-get update
apt-get install bc

apt install cmake
apt install build-essential
apt install libssl-dev
apt install ispell

pip3 install gitlabber
sudo pip install ansible

cat ~/.gnupg/gpg.conf
ignore-mdc-error
