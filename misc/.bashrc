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
# PROMPT
# --------------–-------–--------–--------–-------–--–-----
PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
	local P='$' dir="${PWD##*/}" B countme short long double \
		r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
		u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
		b='\[\e[36m\]' x='\[\e[0m\]'

	[[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
	[[ $PWD = / ]] && dir=/
	[[ $PWD = "$HOME" ]] && dir='~'

	B=$(git branch --show-current 2>/dev/null)
	[[ $dir = "$B" ]] && B=.
	countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

	[[ $B == master || $B == main ]] && b="$r"
	[[ -n "$B" ]] && B="$g($b$B$g)"

	short="$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
	long="╔$g $u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n╚$g $p$P$x "
	double="╔$g $u\u$g$PROMPT_AT$h\h$g:$w$dir\n║$g $B\n╚$g $p$P$x "

	if ((${#countme} > PROMPT_MAX)); then
		PS1="$double"
	elif ((${#countme} > PROMPT_LONG)); then
		PS1="$long"
	else
		PS1="$short"
	fi
}

PROMPT_COMMAND="__ps1"

# --------------–-------–--------–--------–-------–--–-----
# ALIASES
# --------------–-------–--------–--------–-------–--–-----
alias '?'=duck
# alias '??'=google
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias ls='ls -h --color=auto'
alias df='df -h'
alias chmox='chmod +x'
alias temp='cd $(mktemp -d)'
alias more="less"

complete -C keg keg
