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

pathAppend ~/.cabal/bin
pathAppend ~/.cargo/bin
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

# nnn settings {{{
function nLaunch {
  if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi

  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  nnn -c "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}

if type nnn &> /dev/null; then
  export NNN_OPENER="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins/nuke"
  export NNN_PLUG='f:fzcd;o:fzopen;p:preview-tui'
  alias nnn="nnn -c"
  alias n=nLaunch
fi
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

# Custom aliases & bindings {{{
alias myip="curl http://ipecho.net/plain; echo"
alias reload="source ~/.zshrc"

bindkey -s '^H' 'cd ~\n'

if type nvim &> /dev/null; then
  alias vim=nvim
  alias cvi="nvim ~/.config/nvim/init.vim"
fi

if type exa &> /dev/null; then
  alias ls="exa --icons"
fi
# }}}

# Enable kitty completion {{{
kitty + complete setup zsh | source /dev/stdin
# }}}

# vim:foldmethod=marker:foldlevel=0
