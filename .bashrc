# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# alias
unalias -a
alias l="ls -G"
alias ll="ls -lG"
alias lll="ls -lahG"

# prompt
__ps1() {
	local B

	B=$(git branch --show-current 2>/dev/null)
  [[ $(git status --porcelain 2> /dev/null) ]] &&  B="$B *"

	[[ -n "$B" ]] && B="($B)"

	PS1="\w $B\n\$ "
}

PROMPT_COMMAND="__ps1"
