# =============================================================================
# File:        .zshrc
# Maintainer:  Alex Sun (ranmaru22)
# GitHub:      https://github.com/ranmaru22/dotfiles
# =============================================================================

zstyle ':completion:*' menu select
autoload -Uz compinit && compinit -i
zmodload -i zsh/complist
if [[ "$TERM" == "xterm-kitty" ]]; then
  kitty + complete setup zsh | source /dev/stdin
fi

setopt extended_glob
bindkey -e

# Plugins & addons
ZSH_CONFIG_DIR="$HOME/.config/zsh"

loadZshPlugins() {
  antibody bundle < $ZSH_CONFIG_DIR/plugins.txt > $ZSH_CONFIG_DIR/load_plugins.sh
}

source "$ZSH_CONFIG_DIR/load_plugins.sh"
source "$ZSH_CONFIG_DIR/icons.zsh"
source "$ZSH_CONFIG_DIR/aliases.zsh"
source "$ZSH_CONFIG_DIR/fzf.zsh"

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_CA.UTF-8'
fi

# PATH
typeset -gU cdpath fpath mailpath path

_pathAppend() {
  if [ -d "$1" ] && ! echo $PATH | grep -Eq "(^|:)$1($|:)"; then
    PATH="${PATH:+${PATH}:}$1"
  fi
}

_pathAppend /usr/local/sbin
_pathAppend ~/.local/bin
_pathAppend ~/.cabal/bin
_pathAppend ~/.cargo/bin
_pathAppend ~/.go/bin
_pathAppend /Library/Frameworks/Python.framework/Versions/3.8/bin
_pathAppend ~/.scripts/bin
_pathAppend /Library/TeX/texbin

export PATH

# Fasd
eval "$(fasd --init auto)"

# Enable starship
if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
