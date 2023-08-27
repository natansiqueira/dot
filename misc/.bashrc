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
	local AT='@' P='$' dir="${PWD##*/}" B R

	[[ $PWD = / ]] && dir=/
	[[ $PWD = "$HOME" ]] && dir='~'

	B=$(git branch --show-current 2>/dev/null)
	[[ -n "$B" ]] && B="($B)"

  [[ -n "$RUBY_VERRSION" ]] && R="[◇ $R]"

	PS1="\u$AT\h:$dir$R$B$P "
}

PROMPT_COMMAND="my_prompt"
