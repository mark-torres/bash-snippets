# THIS ALIASES ARE MEANT TO BE ADDED TO PERSONAL
# .bashrc FILE


# Quick "cd" to specific directory, like your ~/Git folder if it exists
if [ -d "$HOME/Git" ] ; then
	alias gogit="cd $HOME/Git"
else
	alias gogit="echo Directory $HOME/Git does not exist."
fi

