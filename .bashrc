bind "set completion-ignore-case on"
alias ..='cd ..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls'
alias ll='ls -ltra'
alias v='vim'
set -o noclobber

# don't use <C-S> to turn off flow
stty stop undef

# http://www.blog.montgomerie.net/pwd-in-the-title-bar-or-a-regex-adventure-in-bash
function directory_to_titlebar {
	# The maximum length we want (seems to fit nicely in a default length Terminal title bar).
	local pwd_length=42

	# Get the current working directory. We'll format it in $dir.
	local dir="$PWD"

	# Substitute a leading path that's in $HOME for "~"
	if [[ "$HOME" == ${dir:0:${#HOME}} ]] ; then
		dir="~${dir:${#HOME}}"
	fi

	# Append a trailing slash if it's not there already.
	if [[ ${dir:${#dir}-1} != "/" ]] ; then
		dir="$dir/"
	fi

	# Truncate if we're too long.
	# We preserve the leading '/' or '~/', and substitute
	# ellipses for some directories in the middle.
	if [[ "$dir" =~ (~){0,1}/.*(.{${pwd_length}}) ]] ; then
		local tilde=${BASH_REMATCH[1]}
		local directory=${BASH_REMATCH[2]}

		# At this point, $directory is the truncated end-section of the
		# path. We will now make it only contain full directory names
		# (e.g. "ibrary/Mail" -> "/Mail").
		if [[ "$directory" =~ [^/]*(.*) ]] ; then
			directory=${BASH_REMATCH[1]}
		fi

		# Can't work out if it's possible to use the Unicode ellipsis,
		# '…' (Unicode 2026). Directly embedding it in the string does not
		# seem to work, and \u escape sequences ('\u2026') are not expanded.
		#printf -v dir "$tilde/\u2026$s", $directory"
		dir="$tilde/...$directory"
	fi

	local host="$HOSTNAME"
	if [[ "$host" =~ ([^\.]*)\..* ]] ; then
		host=${BASH_REMATCH[1]}
	fi

	# Don't embed $dir directly in printf's first argument, because it's
	# possible it could contain printf escape sequences.
	printf "\033]0;%s\007" "$USER@$host:$dir"
}

export PROMPT_DIRTRIM=2
