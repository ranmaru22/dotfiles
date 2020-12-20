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

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'

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
