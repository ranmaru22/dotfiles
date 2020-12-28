 # CUSTOM ALIASES

alias myip="curl http://ipecho.net/plain; echo"
alias shal="bat $XDG_CONFIG_HOME/zsh/aliases.zsh"
alias reload="source ~/.zshrc"

if type exa &> /dev/null; then
  alias ls="exa --icons"
fi

alias la="ls -a"
alias ll="ls -la"

alias rm="rm -v"
alias :q="exit"

# Quick open config files {{{
confedit() {
  if [ -n "$1" ]; then
    FILE=$(fd -t f -H "$1" "$DOTFILES")
    FNUM=$(echo "$FILE" | wc -l)
    if [ "$FNUM" -gt 1 ]; then
      echo "$FILE" | fzf | xargs vim
    else
      vim "$FILE"
    fi
  else
    fd -t f -H . "$DOTFILES" | fzf | xargs vim
  fi
} # }}}
alias ce=confedit

# Git wrapper {{{
git() {
  if [ "$1" = "root" ]; then
    shift
    local ROOT="$(command git rev-parse --show-toplevel 2> /dev/null || echo -n .)"
    if [ $# -eq 0 ]; then
      cd "$ROOT"
    else
      (cd "$ROOT" && eval "$@")
    fi
  else
    command git "$@"
  fi
} # }}}
alias g=git

# vim:foldmethod=marker
