#!/usr/bin/env bash

git --git-dir "$HOME/.config/dotfiles/repo" --work-tree "$HOME" fetch --force origin main
git --git-dir "$HOME/.config/dotfiles/repo" --work-tree "$HOME" reset --hard origin/main
