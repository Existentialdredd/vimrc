# MacPorts Installer addition on 2017-02-28_at_16:15:36: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# added by Anaconda3 5.1.0 installer
export PATH="/Users/ericpenner/anaconda3/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ericpenner/Users/ericpenner/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ericpenner/Users/ericpenner/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ericpenner/Users/ericpenner/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/ericpenner/Users/ericpenner/google-cloud-sdk/completion.bash.inc'; fi

export PROG='/users/ericpenner/desktop/programming'

export	QUORA='/users/ericpenner/desktop/projects/quora'

if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi
