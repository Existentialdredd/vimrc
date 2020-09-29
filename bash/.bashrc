#!/bin/bash

if [ -f '/Users/upenner/dot_files/bash/bash_functions' ]; then source '/Users/upenner/dot_files/bash/bash_functions'; fi

if [ -f '/Users/upenner/dot_files/bash/bash_aliases' ]; then source '/Users/upenner/dot_files/bash/bash_aliases'; fi

PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \w\[\033[0;32m\] - [$(git branch 2>/dev/null | grep "^*" | colrm 1 2)\[\033[0;32m\]]\[\033[0m\033[0;32m\]\n-> \[\033[0m\033[0;32m\]\[\033[0m\] '

export PS1
