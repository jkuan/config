bind "set completion-ignore-case on"
alias ..='cd ..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
set -o noclobber

# function to get current path with ~ for home dir
function fullpath {
	local x=`echo $HOME | sed s/\\\//\\\\\\\\\\\//g`
	pwd | sed s/$x/\~/
}
export PROMPT_DIRTRIM=2
# show more status is git_ps1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
# only show fancy prompt in xterm window
case $TERM in
	xterm*)
	PS1='\[\e]2;\u@\h:$(fullpath)\a\]\w$(__git_ps1)\e[1m\$ \e[0m'
	;;
	*)
	PS1="[\w]\$ "
	;;
esac
