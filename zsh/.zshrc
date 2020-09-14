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
autoload -Uz compinit && compinit
zmodload -i zsh/complist

# Plugins & addons {{{
ZSH_CONFIG_DIR="$HOME/.config/zsh"

source <(antibody init)
antibody bundle < "$ZSH_CONFIG_DIR/plugins.txt"
source "$ZSH_CONFIG_DIR/icons.zsh"
source "$ZSH_CONFIG_DIR/aliases.zsh"
# }}}

# PATH {{{
function pathAppend {
  if [ -d "$1" ] && ! echo $PATH | grep -Eq "(^|:)$1($|:)"; then
    PATH="${PATH:+${PATH}:}$1"
  fi
}

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

# vim:foldmethod=marker:foldlevel=0
