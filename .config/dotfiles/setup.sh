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

# Install packages
paru -S zsh zsh-autosuggestions-git zsh-completions-git zsh-syntax-highlighting-git zsh-theme-powerlevel10k-git
paru -S --asdeps ttf-meslo-nerd-font-powerlevel10k

# Setup system
sudo "$HOME/.config/dotfiles/root/update.sh"
sudo locale-gen

# Enable systemd services
sudo systemctl daemon-reload
sudo systemctl enable --now dotfiles-update

systemctl --user daemon-reload
systemctl --user enable --now dotfiles-update
