#
# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
# File:        .zshrc
# Maintainer:  Alex Sun (ranmaru22)
# GitHub:      https://github.com/ranmaru22/dotfiles
#

zstyle ':completion:*' menu select
autoload -Uz compinit && compinit -i
zmodload -i zsh/complist

# Plugins & addons {{{
ZSH_CONFIG_DIR="$HOME/.config/zsh"

function loadZshPlugins {
  antibody bundle < $ZSH_CONFIG_DIR/plugins.txt > $ZSH_CONFIG_DIR/load_plugins.sh
}

bindkey '^J' history-substring-search-down
bindkey '^K' history-substring-search-up

source "$ZSH_CONFIG_DIR/load_plugins.sh"
source "$ZSH_CONFIG_DIR/icons.zsh"
source "$ZSH_CONFIG_DIR/aliases.zsh"
# }}}

# Language {{{
if [[ -z "$LANG" ]]; then
  export LANG='en_CA.UTF-8'
fi
# }}}

# PATH {{{
typeset -gU cdpath fpath mailpath path

function pathAppend {
  if [ -d "$1" ] && ! echo $PATH | grep -Eq "(^|:)$1($|:)"; then
    PATH="${PATH:+${PATH}:}$1"
  fi
}

pathAppend /usr/local/sbin
pathAppend ~/.cabal/bin
pathAppend ~/.cargo/bin
pathAppend ~/.go/bin
pathAppend Library/Frameworks/Python.framework/Versions/3.8/bin
pathAppend ~/.scripts/bin

export PATH
# }}}

# Enable starship {{{
if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
# }}}

# Enable kitty completion {{{
kitty + complete setup zsh | source /dev/stdin
# }}}

# Tmux {{{
function startTmux {
  if type tmux &> /dev/null; then
    if [[ -z "$TMUX" && -z "$TERMINAL_CONTEXT" && $(whoami) != "root" ]]; then
      (tmux -2 attach || tmux -2 new-session)
    fi
  fi
}

startTmux
# }}}

# vim:foldmethod=marker:foldlevel=0
