#
#  ███████╗███████╗██╗  ██╗███████╗███╗   ██╗██╗   ██╗
#  ╚══███╔╝██╔════╝██║  ██║██╔════╝████╗  ██║██║   ██║
#    ███╔╝ ███████╗███████║█████╗  ██╔██╗ ██║██║   ██║
#   ███╔╝  ╚════██║██╔══██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝
#  ███████╗███████║██║  ██║███████╗██║ ╚████║ ╚████╔╝ 
#  ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝  
#
# File:        .zshenv
# Maintainer:  Alex Sun (ranmaru22)
# GitHub:      https://github.com/ranmaru22/dotfiles
#

# Basics
export XDG_CONFIG_HOME="$HOME/.config"
export DOTFILES="$HOME/.dotfiles"
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export CLICOLOR=1

# Highlighting
if type highlight > /dev/null; then
  export HIGHLIGHT_STYLE='duotone-dark-space'
fi

# Editor
if type nvim &> /dev/null; then
  export EDITOR='nvim'
  export GIT_EDITOR='nvim'
  export VISUAL='nvim'
elif type vim &> /dev/null; then
  export EDITOR='vim'
  export GIT_EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='vi'
  export GIT_EDITOR='vi'
  export VISUAL='vi'
fi

# Special paths
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
export GOPATH="$HOME/.go"

# vim:foldmethod=marker:foldlevel=0
