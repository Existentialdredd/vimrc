#!/bin/bash
echo "Sourcing .bashrc"

PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \w\[\033[0;32m\] - [$(git branch 2>/dev/null | grep "^*" )\[\033[0;32m\]]\[\033[0m\033[0;32m\]\n-> \[\033[0m\033[0;32m\]\[\033[0m\]'
export PS1

if [ -f $HOME'/dot_files/bash/bash_functions' ]; then
    source $HOME'/dot_files/bash/bash_functions'
else
    echo "bash_functions not found"
fi

if [ -f $HOME'/dot_files/bash/bash_aliases' ]; then
    source $HOME'/dot_files/bash/bash_aliases'
else
    echo "bash_aliases not found"
fi

if [ -f $HOME'/dot_files/bash/bash_secure_aliases' ]; then
    source $HOME'/dot_files/bash/bash_secure_aliases'
else
    echo "bash_aliases not found"
fi

if [ -f $HOME'/.fzf.bash' ]; then
    source $HOME'/.fzf.bash'
fi
