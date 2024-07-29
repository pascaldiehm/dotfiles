#!/usr/bin/env bash

cd $(realpath $(dirname $0))
sed "s#ExecStart=.*#ExecStart=\"$(pwd)/update.sh\"#" dotfiles-update.service > /etc/systemd/system/dotfiles-update.service

mkdir -p /etc/xdg/reflector
mkdir -p /etc/sddm.conf.d
mkdir -p /etc/zsh

cp ./locale.gen /etc/locale.gen
cp ./pacman.conf /etc/pacman.conf
cp ./paru.conf /etc/paru.conf
cp ./reflector.conf /etc/xdg/reflector/reflector.conf
cp ./sddm_kde_settings.conf /etc/sddm.conf.d/kde_settings.conf
cp ./zshenv /etc/zsh/zshenv

locale-gen
