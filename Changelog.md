# Changelog

### 0.0.8

Build `ubuntu-emacs:0.0.1` base image with

* man pages fixed
* emacs-28.1
* dictd
* .eev

Build `eab-emacs:0.0.8` image.

### 0.0.7

Add `man` pages.
Fix syntax `push:` and add `actions/checkout` in github workflow.

### 0.0.6

Move to `~/git/eabmisc/`.
Add `sqlite3`, `aspell`, `figlet`, `libcanberra-gtk-module`.
Improve make speed `-j12`.
Reorder packages, add `FROM ubuntu-emacs` layer.
Rm legacy `package-keyring.gpg`.
Init github workflow for self-hosted runner.

### 0.0.5

Move compose related stuff to `portal`.

### 0.0.4

Image `eab-emacs28:0.0.2`.

Leave actual `Dockerfile.emacs28.1` only.
Rm extra Dockerfile and compose files.
Add `librsvg2-dev` and others.
Add `~/pnt/pub` link in `cmd.sh`.
Use `eab-pnt`.

### 0.0.3

Add `EDAEMON` parameter. Fix `/tmp/user/$UID`. Fix `nolock` for nfs volume.

### 0.0.2

Emacs version up to `Dockerfile.emacs28.0.90` (`--with-native-compilation`).
Add `browser-remote`, `gpg.conf`.
Add `eab-emacs28.0.90-compose.yml`: 3.2 compose, nfs volume.
Fix `asEnvUser`: remove recursive `chown -R`.
Update `cmd.sh`: .gnupg, .eev, start dictd.

### 0.0.1

Image `eab-emacs28:0.0.1`.

* based 18.04
* built 04.11.2020
