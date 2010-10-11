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

# for laptop
alias matlab='/Applications/MATLAB_R2008a/bin/matlab -nodesktop -nosplash'
alias X11="/Applications/Utilities/X11.app/Contents/MacOS/X11"
alias sshece='ssh -Y jkuan@ssh.ece.ubc.ca'
alias ssharch='ssh -Y ssh.ece.ubc.ca -tY ssh arch'
alias sshsoca='ssh -Y jkuan@soca.ece.ubc.ca'
alias sshubuntu='ssh -Y johnny@ubuntu.local'
alias eject='diskutil umount'
export PATH="$PATH:/Users/johnny/Scripts"

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export EDITOR=/usr/bin/vi
export PATH="$PATH:/usr/local/bin"
export DISPLAY=:0.0
export PATH="$PATH:/usr/X11R6/bin"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"

export PATH="$PATH:."
alias gvim="open -a MacVim"
