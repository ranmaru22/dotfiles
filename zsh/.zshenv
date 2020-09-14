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

export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

export GOPATH="$HOME/.go"

export XDG_CONFIG_HOME="$HOME/.config"
export PAGER='less'
export CLICOLOR=1
# }}}
