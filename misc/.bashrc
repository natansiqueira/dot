# homebrew
eval $(/opt/homebrew/bin/brew shellenv)
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# variables
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com"
export DOTFILES="$GHREPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export EDITOR="zed -w"

# aliases
alias l="ls"
alias ll="ls -l"
alias lll="ls -alhG"
alias temp="cd $(mktemp -d)"

# path
export PATH=$PATH:$SCRIPTS

# prompt
__ps1() {
  local AT='@' P='$' dir="${PWD##*/}" B R \
  r='\[\e[31m\]' w='\[\e[32m\]' bl='\[\e[34m\]' \
  y='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
  cy='\[\e[36m\]' x='\[\e[0m\]'

  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $(git status --porcelain 2> /dev/null) ]] && B="$B *"
  [[ -n "$B" ]] && B="$w($cy$B$w)"

  [[ -n "$RUBY_VERSION" ]] && R="$w[◇ $cy$RUBY_VERSION$w]"

  PS1="╔ $w:$w$dir $B $R\n╚ $bl$P$x "
}

PROMPT_COMMAND="__ps1"

