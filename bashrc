alias ls='ls -G'
alias ll='ls -lA'
alias l='ls'
alias du='du -h'
bind "set completion-ignore-case on"
alias ..='cd ..'
alias dir='ls -Fla|more'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
set -o noclobber
if [ "$PS1" ]; then
	export PS1="\[\e]2;\u@\h:\w\a\]> "
fi

set -o vi
