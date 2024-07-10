#!/usr/bin/bash

git --git-dir "$HOME/.config/dotfiles/repo" --work-tree "$HOME" fetch
git --git-dir "$HOME/.config/dotfiles/repo" --work-tree "$HOME" reset --hard
git --git-dir "$HOME/.config/dotfiles/repo" --work-tree "$HOME" pull -f origin main
