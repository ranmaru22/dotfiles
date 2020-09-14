alias myip="curl http://ipecho.net/plain; echo"
alias reload="source ~/.zshrc"

if type nvim &> /dev/null; then
  alias vim=nvim
  alias cvi="nvim ~/.config/nvim/init.vim"
fi

if type exa &> /dev/null; then
  alias ls="exa --icons"
fi

# Git aliases {{{
alias gp="git push"
alias gf="git fetch"
alias gc="git clone"
alias gb="git branch"
alias gb="git merge"
alias gip="git pull"
alias gia="git add"
alias giA="git add -A"

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

# uncommitting
function guc {
  git reset @~ "$@" && git commit --amend --no-edit
}
# }}}
