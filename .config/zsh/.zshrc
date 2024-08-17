# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/pascal/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Custom keybindings
bindkey -rp ''
bindkey -R ' '-'~' self-insert
for key in ä ö ü Ä Ö Ü ß § °; do bindkey $key self-insert; done

bindkey '^M'      accept-line                          # Return
bindkey '^I'      expand-or-complete                   # Tab
bindkey '^[[C'    forward-char                         # Right arrow
bindkey '^[[1;5C' forward-word                         # Ctrl Right arrow
bindkey '^[[D'    backward-char                        # Left arrow
bindkey '^[[1;5D' backward-word                        # Ctrl Left arrow
bindkey '^[[H'    beginning-of-line                    # Home
bindkey '^[[F'    end-of-line                          # End
bindkey '^[[A'    up-line-or-history                   # Up arrow
bindkey '^[[B'    down-line-or-history                 # Down arrow
bindkey '^?'      backward-delete-char                 # Backspace
bindkey '^H'      backward-delete-word                 # Ctrl Backspace
bindkey '^[[3~'   delete-char                          # Delete
bindkey '^[[3;5~' delete-word                          # Ctrl Delete
bindkey '^V'      quoted-insert                        # Ctrl V
bindkey '^[[200~' bracketed-paste                      # Ctrl Shift V
bindkey '^R'      history-incremental-search-backward  # Ctrl F
bindkey '^L'      clear-screen                         # Ctrl L
bindkey '^Y'      redo                                 # Ctrl Y
bindkey '^Z'      undo                                 # Ctrl Z

# Alias definitions
alias copy="wl-copy"
alias dotfiles="git --git-dir '$HOME/.config/dotfiles/repo' --work-tree '$HOME'"
alias grep="grep --color=auto"
alias ll="ls -Alh"
alias ls="ls --color=auto"
alias open="xdg-open"
alias py="python3"

# Functions
function pyenv {
  [ -d .venv ] || python3 -m venv .venv
  source .venv/bin/activate
}

# Load plugins
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
