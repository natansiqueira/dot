eval $(/opt/homebrew/bin/brew shellenv)

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
my_prompt() {
    local AT='@' P='$' dir='${PWD##*/}' B R \
    w='\e[30m' r='\e[31m' g='\e[32m' bl='\e[34m' \
    y='\e[33m' m='\e[35m' cy='\e[36m' gr='\e[37m' n='\e[0m'

    [[ $PWD = / ]] && dir=/
    [[ $PWD = "$HOME" ]] && dir='~'

    B=$(git branch --show-current 2>/dev/null)
    [[ -n "$B" ]] && B="$gr($cy$B$gr)"

    [[ -n "$RUBY_VERRSION" ]] && R="$gr[◇ $cy$R$gr]"

    PS1="╔ $y\u$g$AT$bl\h$n:$m$dir$R$B\n╚ $bl$P$n "
}

PROMPT_COMMAND="my_prompt"
