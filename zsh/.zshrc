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

# Environment variables {{{
export PATH=~/.cabal/bin:~/.cargo/bin:/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH

if ! type "$highlight" > /dev/null; then
    export HIGHLIGHT_STYLE='base16/spacemacs'
fi

if ! type "$nvim" > /dev/null; then
    export EDITOR='nvim'
    export VISUAL='nvim'
else
    export EDITOR='vim'
    export VISUAL='vim'
fi

export PAGER='less'
export CLICOLOR=1
# }}}

# Enable starship {{{
eval "$(starship init zsh)"
# }}}

# Sourcing {{{
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# }}}

# Custom aliases {{{
alias myip="curl http://ipecho.net/plain; echo"
alias reload="source ~/.zshrc"

if ! type "$nvim" > /dev/null; then
    alias vim=nvim
    alias cvi="nvim ~/.config/nvim/init.vim"
fi
# }}}

# vim:foldmethod=marker:foldlevel=0
