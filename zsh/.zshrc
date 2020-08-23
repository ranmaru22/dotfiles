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

# Variables {{{
export PATH=~/.cabal/bin:~/.cargo/bin:$PATH
export EDITOR=nvim
# }}}

# Enable p10k {{{
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# }}}

# Enable starship {{{
eval "$(starship init zsh)"
# }}}

# Source Prezto {{{
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# }}}

# Custom aliases {{{
alias c=clear
alias vim=nvim
alias cvi="nvim ~/.config/nvim/init.vim"
alias myip="curl http://ipecho.net/plain; echo"
alias reload="source ~/.zshrc"
# }}}

# Source p10k {{{
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# [ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
# }}}

# Misc {{{
source ~/.config/zsh/zsh-theme-edge-dark
# }}}

# vim:foldmethod=marker:foldlevel=0
