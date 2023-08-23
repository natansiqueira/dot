# homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
export FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"

# welcome message
# figlet "bash"

# variables
export GITUSER=$USER
export REPOS="$HOME/Repos"
export GREPOS="$HOME/Repos/github.com/$GITUSER"
export ZETDIR="$GHREPOS/zet"
export EDITOR="vi"
export GOBIN="~/.local/bin"

# prompt
PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
	local P='$' dir="${PWD##*/}" B countme short long double \
		r='\[\e[31m\]' g='\[\e[37m\]' h='\[\e[34m\]' \
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

  R=$(echo $RUBY_VERSION)
  [[ -n "$R" ]] && R="[◇ $b$R$g]"

	short="$u\u$g$PROMPT_AT$h\h$g:$w$dir $R$B$p$P$x "
	long="╔$g $u\u$g$PROMPT_AT$h\h$g:$w$dir $R$B\n╚$g $p$P$x "
	double="╔$g $u\u$g$PROMPT_AT$h\h$g:$w$dir\n║$g $R $B\n╚$g $p$P$x "

	if ((${#countme} > PROMPT_MAX)); then
		PS1="$double"
	elif ((${#countme} > PROMPT_LONG)); then
		PS1="$long"
	else
		PS1="$short"
	fi
}

PROMPT_COMMAND="__ps1"

# path
export PATH="$PATH:$GOBIN"

# aliases
alias repos="cd $GREPOS"
alias python="python3"
alias ll="ls -alhpG"
alias temp='cd $(mktemp -d)'


# source
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
