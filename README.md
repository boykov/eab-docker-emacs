# eab-docker-emacs

see https://github.com/JAremko/docker-emacs

## build eab emacs 

See .github/workflows/test.yml

## additional

TODO duplicate settings cmd.sh and .bashrc
TMPDIR, ~/.ssh/tramp, ~/git/auto

## CANCELLED apt-get inside virtualenv

See 6a004c96fd7 commit, dockerfiles/Dockerfile.emacs28

## host

gnuplot
emacs-bin-common (for emacsclient)
ripgrep

## build base image

ssh chronos
cd ~/git/eabmisc/eab-docker-emacs
docker build -f dockerfiles/Dockerfile.emacs-base -t harbor.homew.keenetic.pro/eab/ubuntu-emacs:0.0.1 .
docker push harbor.homew.keenetic.pro/eab/ubuntu-emacs:0.0.1

<!-- dictionary -->
apt-get install dictd
cd /usr/share/dictd
sudo /home/eab/git/auto/downdict.sh
sudo dictdconfig -w
dict -I
sudo /etc/init.d/dictd stop
sudo /etc/init.d/dictd start

copy ~/.eev folder

copy emacs-28.1 folder

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

DONE man pages https://stackoverflow.com/questions/54152906/how-to-install-man-pages-on-an-ubuntu-docker-image

CANCELLED +svg java ditaa
wget https://github.com/stathissideris/ditaa/releases/download/v0.11.0/ditaa-0.11.0-standalone.jar

CANCELLED supervisord program:dictd, program:emacs
dictd и так через init.d
для emacs надо прокидывать параметры 
sudo EDAEMON=$EDAEMON /usr/bin/supervisord -n -c /etc/supervisord.conf &
%(ENV_DAEMON)s
и, возможно, все остальные
Дальше разбираться не стал, т.к. возможны еще другие проблемы.

DONE Source Code Pro fonts for emacs GUI
https://www.rogerpence.com/posts/install-source-code-pro-font-on-ubuntu
