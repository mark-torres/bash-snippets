# nano for crontab edit
export VISUAL=nano

# PS1 is the promt string, this changes your promt to:
# [user@hostname]<working-directory>$
PS1="[\u@\h]<\W>\$ "

# git promt {
if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
	#export PS1='[\u@\h:\W$(__git_ps1 "(%s)")]\$ '
	export PS1='\u\[$(tput sgr0)\]@\h\[$(tput sgr0)\][\[$(tput setaf 4)\]\W\[$(tput setaf 1)\]$(__git_ps1 "(%s)")\[$(tput sgr0)\]]$\[$(tput sgr0)\] '
fi
# }

# load git autocompletion
if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

# user bin directory
if [[ -d $HOME/bin ]]; then
	export PATH=$PATH:$HOME/bin
fi
