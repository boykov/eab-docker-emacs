# eab-docker-emacs

see https://github.com/JAremko/docker-emacs

## build eab emacs 

See `.github/workflows/test.yml`

## additional

- [x] duplicate settings in `cmd.sh` and `.bashrc`:
  - `TMPDIR`, `~/.ssh/tramp`, `~/git/auto`

## host

    gnuplot
    emacs-bin-common # for emacsclient
    ripgrep

## build base image

    ssh chronos
    cd ~/git/eabmisc/eab-docker-emacs
    docker build -f dockerfiles/Dockerfile.emacs-base \
                 -t harbor.homew.keenetic.pro/eab/ubuntu-emacs:0.0.1 .
    docker push harbor.homew.keenetic.pro/eab/ubuntu-emacs:0.0.1

    wget http://mirror.tochlab.net/pub/gnu/emacs/emacs-29.1.tar.gz
    docker cp eab-emacs28:/usr/share/dictd ./
    docker cp eab-emacs28:/RNTM/.eev ./
    sudo podman build --build-arg EMACS_VERSION=29.1 -f dockerfiles/Dockerfile.emacs-base \
                 -t harbor.homew.keenetic.pro/eab/ubuntu-emacs:0.0.4 .
    sudo podman push harbor.homew.keenetic.pro/eab/ubuntu-emacs:0.0.4

    sed -i "s/0.0.4/0.0.4n/" dockerfiles/Dockerfile.eab-emacs
    sudo podman build -f dockerfiles/Dockerfile.eab-emacs -t harbor.homew.keenetic.pro/eab/eab-emacs:0.0.16n .
    sudo podman push harbor.homew.keenetic.pro/eab/eab-emacs:0.0.16n

    docker build --build-arg EMACS_VERSION=29.0.91 -f dockerfiles/Dockerfile.emacs-base \
                 -t harbor.homew.keenetic.pro/eab/ubuntu-emacs:0.0.2n .
    sed -i "s/0.0.1/0.0.2n/" dockerfiles/Dockerfile.eab-emacs
    docker build -f dockerfiles/Dockerfile.eab-emacs -t harbor.homew.keenetic.pro/eab/eab-emacs:0.0.14n .
<!-- dictionary -->

    apt-get install dictd
    cd /usr/share/dictd
    sudo /home/eab/git/auto/downdict.sh
    sudo dictdconfig -w
    dict -I
    sudo /etc/init.d/dictd stop
    sudo /etc/init.d/dictd start

Copy `~/.eev`, `emacs-28.1` folders.

## rebuild emacs

rebuild emacs with librsvg2-dev (also may be with)

- [x] libacl1-dev
- [x] libncurses-dev
- [ ] libgtk-3-dev
  - configure: WARNING: Your version of Gtk+ will have problems with
    closing open displays.  This is no problem if you just use one
    display, but if you use more than one and close one of them Emacs
    may crash.  See https://gitlab.gnome.org/GNOME/gtk/issues/221
- [ ] libxaw3dxft6
- [x] librsvg2-dev
- [x] imagemagick
- [ ] libgpm-dev
- [x] libdbus-1-dev
- [ ] libgconf-2-4
- [ ] libm17n-dev
- [x] libotf-dev

## more additional

- [x] man pages https://stackoverflow.com/questions/54152906/how-to-install-man-pages-on-an-ubuntu-docker-image
- [ ] ~~+svg java ditaa~~
  - wget https://github.com/stathissideris/ditaa/releases/download/v0.11.0/ditaa-0.11.0-standalone.jar
- [ ] ~~supervisord program:dictd, program:emacs~~
  - dictd и так через init.d
  - для emacs надо прокидывать параметры
    - `sudo EDAEMON=$EDAEMON /usr/bin/supervisord -n -c /etc/supervisord.conf &`
    - `%(ENV_DAEMON)s`
  - и, возможно, все остальные. Дальше разбираться не стал,
    т.к. возможны еще другие проблемы.
- [x] Source Code Pro fonts for emacs GUI
  - https://www.rogerpence.com/posts/install-source-code-pro-font-on-ubuntu
- [ ] ~~apt-get inside virtualenv~~
  - See 6a004c96fd7 commit, dockerfiles/Dockerfile.emacs28
