
if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc
fi

if [ -f $HOME/.bash/bash_aliases ]; then
	source $HOME/.bash/bash_aliases
fi

if [ -f $HOME/.bash/bash_functions ]; then
	source $HOME/.bash/bash_functions
fi

# added by Anaconda3 installer
# export PATH="/Users/upenner/anaconda3/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/upenner/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/upenner/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/upenner/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/upenner/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
