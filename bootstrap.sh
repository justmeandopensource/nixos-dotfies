#!/usr/bin/env bash

sudo mkdir -p /usr/share/backgrounds /usr/local/bin
sudo cp monk-wallpaper-zoom-blurred.jpg /usr/share/backgrounds
mkdir -p ~/{downloads,play,opt/scripts,dev/repos}
cp monk-wallpaper.jpg ~/.background-image
cp -r config/* ~/.config/
cp -r scripts/* ~/opt/scripts/
cp .zshrc .tmux.conf .p10k.zsh .Xresources ~/

