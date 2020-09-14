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

# PATH {{{
function pathAppend {
  if [ -d "$1" ] && ! echo $PATH | grep -Eq "(^|:)$1($|:)"; then
    PATH="${PATH:+${PATH}:}$1"
  fi
}

pathAppend ~/.cabal/bin
pathAppend ~/.cargo/bin
pathAppend ~/.go/bin
pathAppend Library/Frameworks/Python.framework/Versions/3.8/bin
pathAppend ~/.scripts/bin

export PATH
# }}}

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

export GOPATH=$HOME/.go

export XDG_CONFIG_HOME=$HOME/.config
export PAGER='less'
export CLICOLOR=1
# }}}

# Enable starship {{{
if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
# }}}

# Sourcing {{{
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# }}}

# Custom aliases & bindings {{{
alias myip="curl http://ipecho.net/plain; echo"
alias reload="source ~/.zshrc"

if type nvim &> /dev/null; then
  alias vim=nvim
  alias cvi="nvim ~/.config/nvim/init.vim"
fi

if type exa &> /dev/null; then
  alias ls="exa --icons"
fi
# }}}

# Enable kitty completion {{{
kitty + complete setup zsh | source /dev/stdin
# }}}

# Icons {{{
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
# }}}

# vim:foldmethod=marker:foldlevel=0
