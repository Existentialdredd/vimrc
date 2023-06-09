#!/bin/bash

if [ -f $HOME'/dot_files/bash/bash_functions' ]; then
    source $HOME'/dot_files/bash/bash_functions';
else
    echo "bash functions not found"
fi

if [ -f $HOME'/dot_files/bash/bash_aliases' ]; then
    source $HOME'/dot_files/bash/bash_aliases'
then
    echo "bash aliases not found"
fi

if [ -f $HOME'/dot_files/bash/bash_secure_aliases' ]; then
    source $HOME'/dot_files/bash/bash_secure_aliases'
then
    echo "bash secure aliases not found"
fi

PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \w\[\033[0;32m\] - [$(git branch 2>/dev/null | grep "^*" | colrm 1 2)\[\033[0;32m\]]\[\033[0m\033[0;32m\]\n-> \[\033[0m\033[0;32m\]\[\033[0m\] '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PS1
