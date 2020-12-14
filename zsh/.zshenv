# =============================================================================
# File:        .zshenv
# Maintainer:  Alex Sun (ranmaru22)
# GitHub:      https://github.com/ranmaru22/dotfiles
# =============================================================================

# Basics
export XDG_CONFIG_HOME="$HOME/.config"
export DOTFILES="$HOME/.dotfiles"
export PAGER='less'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS='-F -g -i -M -R -S -w -X -z-4'
export CLICOLOR=1

# Highlighting
export HIGHLIGHT_STYLE='onedark'

# Program specific
export PF_INFO="ascii title os kernel shell uptime pkgs memory"

export FZF_DEFAULT_OPTS="-1 --ansi
--color=fg:#c5cdd9,bg:#2c2e34,hl:#6cb6eb
--color=fg+:#c5cdd9,bg+:#2c2e34,hl+:#5dbbc1
--color=info:#88909f,prompt:#ec7279,pointer:#d38aea
--color=marker:#a0c980,spinner:#ec7279,header:#5dbbc1"

# Custom terminfo for tmux (~/.config/terminfo)
# Supports italics inside tmux; must be compiled with tic
if type tmux &> /dev/null; then
    export TERM=xterm-256color
fi

# Editor
if type vim &> /dev/null; then
  export EDITOR='vim'
  export GIT_EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='vi'
  export GIT_EDITOR='vi'
  export VISUAL='vi'
fi

# Special paths
# export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
export GOPATH="$HOME/.go"

# vim:foldmethod=marker
