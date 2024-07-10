#!/usr/bin/bash

cd $(realpath $(dirname $0))
sed "s#ExecStart=.*#ExecStart=\"$(pwd)/update.sh\"#" dotfiles-update.service > /etc/systemd/system/dotfiles-update.service

cp ./pacman.conf /etc/pacman.conf
cp ./paru.conf /etc/paru.conf
cp ./zshenv /etc/zsh/zshenv
