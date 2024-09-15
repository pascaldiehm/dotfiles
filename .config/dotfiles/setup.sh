#!/usr/bin/env bash

# Setup dotfiles
git --git-dir "$HOME/.config/dotfiles/repo" config --local status.showUntrackedFiles no
git --git-dir "$HOME/.config/dotfiles/repo" remote set-branches --add origin main

# Install paru
if ! command -v paru; then
    git clone https://aur.archlinux.org/paru-git.git /tmp/paru
    cd /tmp/paru
    makepkg -sirc --noconfirm
    cd -
fi

# Install packages
unset CMAKE_GENERATOR; paru -S --noconfirm --asexplicit zsh zsh-autosuggestions-git zsh-completions-git zsh-syntax-highlighting-git zsh-theme-powerlevel10k-git
paru -S --noconfirm --asdeps ttf-meslo-nerd-font-powerlevel10k

paru -S --noconfirm --asexplicit ark dolphin filelight gwenview kate kdeconnect konsole kwallet kwalletmanager okular partitionmanager spectacle
paru -S --noconfirm --asdeps ffmpegthumbs kdegraphics-thumbnailers

paru -S --noconfirm --asexplicit clang cmake
paru -S --noconfirm --asdeps ninja

paru -S --noconfirm --asexplicit texlive-meta texlive-langgerman
paru -S --noconfirm --asdeps perl-yaml-tiny perl-file-homedir

paru -S --noconfirm --asexplicit networkmanager-openconnect subversion
paru -S --noconfirm --asdeps perl-term-readkey

paru -S --noconfirm --asexplicit noto-fonts-extra noto-fonts-emoji noto-fonts-cjk
paru -S --noconfirm --asexplicit cloc fwupd hexedit htop imagemagick jq man-db php reflector vim wl-clipboard xdg-ninja yarn yt-dlp
paru -S --noconfirm --asexplicit bitwarden google-chrome signal-desktop thunderbird visual-studio-code-bin vlc
paru -S --noconfirm --asexplicit docker docker-compose
paru -S --noconfirm --asexplicit bind traceroute websocat wget wireguard-tools
paru -S --noconfirm --asexplicit dosfstools exfat-utils testdisk

# Setup user
sudo chsh -s /usr/bin/zsh $USER
sudo usermod -aG docker $USER

# Setup system
sudo "$HOME/.config/dotfiles/system/update.sh"

# Enable systemd services
systemctl --user daemon-reload
systemctl --user enable --now dotfiles-update
systemctl --user enable clean-home

sudo systemctl daemon-reload
sudo systemctl enable --now dotfiles-update
sudo systemctl enable docker
sudo systemctl enable reflector
