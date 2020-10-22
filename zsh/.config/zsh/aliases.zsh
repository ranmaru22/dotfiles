 # CUSTOM ALIASES

alias myip="curl http://ipecho.net/plain; echo"
alias shal="bat $XDG_CONFIG_HOME/zsh/aliases.zsh"
alias reload="source ~/.zshrc"

if type nvim &> /dev/null; then
  alias vim=nvim
  alias cvi="nvim ~/.config/nvim/init.vim"
fi

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
      echo "$FILE" | fzf | xargs nvim
    else
      nvim "$FILE"
    fi
  else
    fd -t f -H . "$DOTFILES" | fzf | xargs nvim
  fi
} # }}}
alias ce=confedit

# Git aliases {{{
alias gp="git push"
alias gf="git fetch"
alias gc="git clone"
alias gb="git branch"
alias gm="git merge"
alias gip="git pull"

# add
alias gia="git add"
alias gaa="git add -A"
alias gap="git add -p"

# checkout
alias gco="git checkout"
alias gcb="git checkout -b"
alias gcom="git checkout master"

# status, diff, etc.
alias gds="git status"
alias gdi="git diff"
alias gdc="git diff --cached"
alias glog="git log --oneline --decorate --graph"

# stashing
alias gst="git stash"
alias gsp="git stash pop"

# cherry picking
alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"

# committing
alias gcm="git commit -m"
alias gcA="git commit -a --amend"

# rebasing
alias grb="git rebase"
alias gri="git rebase -i"

# uncommitting
guc() {
  git reset @~ "$@" && git commit --amend --no-edit
}

# git fuzzy
alias gzf="git fuzzy"
alias gzs="git fuzzy status"
alias gzb="git fuzzy branch"
alias gzl="git fuzzy log"
alias gzr="git fuzzy reflog"
alias gzst="git fuzzy stash"
alias gzd="git fuzzy diff"
alias gzp="git fuzzy pr"
# }}}

# vim:foldmethod=marker:foldlevel=0
