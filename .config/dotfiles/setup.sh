#!/usr/bin/bash

# Setup dotfiles
git --git-dir "$HOME/.config/dotfiles/repo" config --local status.showUntrackedFiles no

# Install paru
if ! command -v paru; then
    git clone https://aur.archlinux.org/paru-bin.git /tmp/paru
    cd /tmp/paru
    makepkg -sirc
    cd -
fi

# Setup system
sudo "$HOME/.config/dotfiles/root/update.sh"

# Enable systemd services
sudo systemctl daemon-reload
sudo systemctl enable --now dotfiles-update

systemctl --user daemon-reload
systemctl --user enable --now dotfiles-update
