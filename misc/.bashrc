# --------------–-------–--------–--------–-------–--–-----
# VARIABLES
# --------------–-------–--------–--------–-------–--–-----
export GITUSER="$USER"
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export ZETDIR="$GHREPOS/zet"
export GOBIN="$HOME/.local/bin"

# --------------–-------–--------–--------–-------–--–-----
# PATH
# --------------–-------–--------–--------–-------–--–-----
pathprepend() {
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//:"$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="$arg${PATH:+":${PATH}"}"
	done
} && export -f pathprepend

# remember last arg will be first in path
pathprepend \
	"$HOME/.local/bin" \
	"$SCRIPTS"

# --------------–-------–--------–--------–-------–--–-----
# ALIASES
# --------------–-------–--------–--------–-------–--–-----
alias '?'=duck
alias '??'=gpt
alias '???'=google
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias ls='ls -h --color=auto'
alias df='df -h'
alias chmox='chmod +x'
alias temp='cd $(mktemp -d)'
alias more="less"

complete -C keg keg
