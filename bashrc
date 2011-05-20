bind "set completion-ignore-case on"
alias ..='cd ..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
set -o noclobber
if [ "$PS1" ]; then
	export PS1="\[\e]2;\u@\h:\w\a\]> "
fi

export EDITOR=/usr/bin/vi
