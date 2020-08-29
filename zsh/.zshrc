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

# Enable starship {{{
eval "$(starship init zsh)"
# }}}

# Sourcing {{{
source ~/.config/zsh/zsh-theme-edge-dark
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# }}}

# Custom aliases {{{
alias myip="curl http://ipecho.net/plain; echo"
alias reload="source ~/.zprofile; source ~/.zshrc; source ~/.zshenv"

if ! type "$nvim" > /dev/null; then
    alias vim=nvim
    alias cvi="nvim ~/.config/nvim/init.vim"
fi

if ! type "$lsd" > /dev/null; then
    alias ls=lsd
fi
# }}}

# vim:foldmethod=marker:foldlevel=0
