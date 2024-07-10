# Setup XDG homes
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# XDG Ninja recommendations
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# Export variables
export CMAKE_GENERATOR=Ninja
export EDITOR=vim
export GPG_TTY=$(tty)

# Add folders to PATH
path+="/home/pascal/.yarn/bin"
export PATH
