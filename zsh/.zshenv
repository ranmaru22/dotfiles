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
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export LESS='-F -g -i -M -R -S -w -X -z-4'
export CLICOLOR=1

# Highlighting
export HIGHLIGHT_STYLE='dracula'

# Program specific
export PF_INFO="ascii title os kernel shell uptime pkgs memory"

# Custom terminfo for tmux (~/.config/terminfo)
# Supports italics inside tmux; must be compiled with tic
if type tmux &> /dev/null; then
    export TERM=xterm-256color
fi

# Editor
# if type nvim &> /dev/null; then
  export EDITOR='nvim'
  export GIT_EDITOR='nvim'
  export VISUAL='nvim'
# elif type vim &> /dev/null; then
#   export EDITOR='vim'
#   export GIT_EDITOR='vim'
#   export VISUAL='vim'
# else
#   export EDITOR='vi'
#   export GIT_EDITOR='vi'
#   export VISUAL='vi'
# fi

# Special paths
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
export GOPATH="$HOME/.go"

# vim:foldmethod=marker:foldlevel=0
