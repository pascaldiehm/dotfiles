#!/usr/bin/bash

cd $(realpath $(dirname $0))
sed "s#ExecStart=.*#ExecStart=\"$(pwd)/update.sh\"#" dotfiles-update.service > /etc/systemd/system/dotfiles-update.service
