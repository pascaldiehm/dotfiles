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
paru -S --noconfirm zsh zsh-autosuggestions-git zsh-completions-git zsh-syntax-highlighting-git zsh-theme-powerlevel10k-git
paru -S --noconfirm --asdeps ttf-meslo-nerd-font-powerlevel10k

paru -S --noconfirm ark dolphin filelight gwenview kate kdeconnect konsole kwallet okular partitionmanager spectacle
paru -S --noconfirm --asdeps ffmpegthumbs kdegraphics-thumbnailers kwalletmanager

paru -S --noconfirm clang cmake
paru -S --noconfirm --asdeps ninja

paru -S --noconfirm cloc fwupd hexedit htop imagemagick man-db reflector vim xdg-ninja yarn
paru -S --noconfirm bitwarden google-chrome thunderbird visual-studio-code-bin vlc

# Setup user
sudo chsh -s /usr/bin/zsh $USER

# Setup system
sudo "$HOME/.config/dotfiles/system/update.sh"
sudo locale-gen

# Enable systemd services
sudo systemctl daemon-reload
sudo systemctl enable --now dotfiles-update
sudo systemctl enable reflector

systemctl --user daemon-reload
systemctl --user enable --now dotfiles-update
systemctl --user enable clean-home
