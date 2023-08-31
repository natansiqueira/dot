# homebrew
eval $(/opt/homebrew/bin/brew shellenv)
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

. /opt/homebrew/opt/chruby/share/chruby/chruby.sh
. /opt/homebrew/opt/chruby/share/chruby/auto.sh

# variables
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com"
export DOTFILES="$GHREPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export nDITOR="code -w"

# aliases
alias g="git"
alias l="ls"
alias ll="ls -l"
alias lll="ls -alhG"
alias temp="cd $(mktemp -d)"

# path
export PATH=$PATH:$SCRIPTS

# prompt
__ps1() {
  local P='$' dir="${PWD##*/}" B R \
  r='\[\e[31m\]' y='\[\e[33m\]' \
  x='\[\e[0m\]'

  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $(git status --porcelain 2> /dev/null) ]] && B="$B *"
  [[ -n "$B" ]] && B=" ($y$B$x)"

  [[ -n "$RUBY_VERSION" ]] && R=" [$r\[◇\] $RUBY_VERSION$x]"

  PS1="╔ $dir$B$R\n╚ $P$x "
}

PROMPT_COMMAND="__ps1"

