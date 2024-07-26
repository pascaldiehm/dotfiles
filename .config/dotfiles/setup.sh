#!/usr/bin/bash

# Setup dotfiles
git --git-dir "$HOME/.config/dotfiles/repo" config --local status.showUntrackedFiles no
git --git-dir "$HOME/.config/dotfiles/repo" remote set-branches --add origin main

# Install paru
if ! command -v paru; then
    git clone https://aur.archlinux.org/paru-bin.git /tmp/paru
    cd /tmp/paru
    makepkg -sirc --noconfirm
    cd -
fi

# Install packages
paru -S --noconfirm zsh zsh-autosuggestions-git zsh-completions-git zsh-syntax-highlighting-git zsh-theme-powerlevel10k-git
paru -S --noconfirm --asdeps ttf-meslo-nerd-font-powerlevel10k

paru -S --noconfirm ark dolphin filelight gwenview kate kdeconnect konsole kwallet okular partitionmanager spectacle
paru -S --noconfirm --asdeps ffmpegthumbs kdegraphics-thumbnailers kwalletmanager

paru -S --noconfirm clang cmake
paru -S --noconfirm --asdeps ninja

paru -S --noconfirm texlive-meta texlive-langgerman
paru -S --noconfirm --asdeps perl-yaml-tiny perl-file-homedir

paru -S --noconfirm networkmanager-openconnect subversion
paru -S --noconfirm --asdeps perl-term-readkey

paru -S --noconfirm cloc fwupd hexedit htop imagemagick man-db reflector vim xdg-ninja yarn yt-dlp
paru -S --noconfirm bitwarden google-chrome thunderbird visual-studio-code-bin vlc
paru -S --noconfirm docker docker-compose
paru -S --noconfirm bind traceroute websocat wget wireguard-tools
paru -S --noconfirm dosfstools exfat-utils testdisk

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
