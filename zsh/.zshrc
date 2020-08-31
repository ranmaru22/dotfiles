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

# PATH {{{
function pathAppend {
  if [ -d "$1" ] && ! echo $PATH | grep -Eq "(^|:)$1($|:)"; then
    PATH="${PATH:+${PATH}:}$1"
  fi
}

pathAppend ~/.cabal/bin:~/.cargo/bin
pathAppend Library/Frameworks/Python.framework/Versions/3.8/bin
pathAppend ~/.scripts/bin

export PATH
# }}}

# Environment variables {{{
if type highlight > /dev/null; then
  export HIGHLIGHT_STYLE='duotone-dark-space'
fi

if type nvim &> /dev/null; then
  export EDITOR='nvim'
  export VISUAL='nvim'
elif type vim &> /dev/null; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='vi'
  export VISUAL='vi'
fi

export PAGER='less'
export CLICOLOR=1
# }}}

# Enable starship {{{
if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
# }}}

# Sourcing {{{
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# }}}

# Custom aliases {{{
alias myip="curl http://ipecho.net/plain; echo"
alias reload="source ~/.zshrc"

if type nvim &> /dev/null; then
  alias vim=nvim
  alias cvi="nvim ~/.config/nvim/init.vim"
fi
# }}}

# vim:foldmethod=marker:foldlevel=0
