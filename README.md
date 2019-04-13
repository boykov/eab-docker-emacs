# eab-docker-emacs

see https://github.com/JAremko/docker-emacs

## build

ssh kairos-host
cd ~/data/gitno/github/eab-docker-emacs
docker build -f dockerfiles/Dockerfile.emacs25 -t eab-emacs14 .

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


