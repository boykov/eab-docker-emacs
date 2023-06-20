# Changelog

### 0.0.15

Add `tree-sitter`.
Update ubuntu version to `22.04`.
Switch to `podman build` and `29.0.92`.
Add `kairosC`, dockerize `clocksum` fully.
Fix `python3` packages, add `gnuplot`.

### 0.0.14

Setup tcp socket for `serverP`, `cyclos`.
Emacs `build.sh`: use auto `cores`.
Update to emacs `29.0.91`, add readme commands.

### 0.0.13

Add `socat`. Setup tcp socket for `serverC`.

### 0.0.12

Fix duplicate `cmd.sh/.bashrc` settings.

### 0.0.11

Use `mount --bind` in `cmd.sh`: prevent elongated `/pnt/bear/..` paths.
Add `nfs-common`.

### 0.0.10

Add `net-tools`, update [README](README.md).
Use symlinks in `cmd.sh`.

### 0.0.9

Add python 3 `joblib`.

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
