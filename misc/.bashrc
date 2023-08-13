# --------------–-------–--------–--------–-------–--–-----
# VARIABLES
# --------------–-------–--------–--------–-------–--–-----
export GITUSER="$USER"
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export ZET="$GHREPOS/zet"
export LAB="$GHREPOS/lab"
export GOBIN="$HOME/.local/bin"
export EDITOR="vim"

# --------------–-------–--------–--------–-------–--–-----
# ALIASES
# --------------–-------–--------–--------–-------–--–-----
alias g='git'
alias dot='cd $DOTFILES'
alias zet="cd $ZET"
alias repos="cd $REPOS"
alias scripts='cd $SCRIPTS'
alias lab='cd $LAB'
alias ls='ls -h --color=auto'
alias df='df -h'
alias chmox='chmod +x'
alias temp='cd $(mktemp -d)'
alias more='less'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias show='defaults write com.apple.Finder AppleShowAllFiles -bool true; killall Finder'
alias hide='defaults write com.apple.Finder AppleShowAllFiles -bool false; killall Finder'

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
# AUTO COMPLETE
# --------------–-------–--------–--------–-------–--–-----
complete -C keg keg

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
