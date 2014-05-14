# Adds colors to LS
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# A few usefull aliases
alias l='ls -la'
alias ll='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias gs='git status'
alias gl='git log'
alias gt='git log --graph --oneline --all'

# Create simple aliases for colors
export BLACK="\033[01;30m"
export MAGENTA="\033[1;31m"
export ORANGE="\033[1;33m"
export GREEN="\033[1;32m"
export PURPLE="\033[1;35m"
export WHITE="\033[1;37m"
export BOLD=""
export RESET="\033[m"

function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\] \[$RESET\]"

# A nice function to simplify extraction
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1		;;
			*.tar.gz)	tar xzf $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		rar x $1		;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xf $1		;;
			*.tbz2)		tar xjf $1		;;
			*.tgz)		tar xzf $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# Run .bashrc
if [ -r ~/.bashrc ]; then 
	. ~/.bashrc; 
fi
