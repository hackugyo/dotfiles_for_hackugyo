
PATH=/opt/local/bin:/opt/local/sbin:$PATH
# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# emacs23.4
alias emacs='/usr/local/Cellar/emacs/23.4/Emacs.app/Contents/MacOS/Emacs -nw'


#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/kwatanabe/.gvm/bin/gvm-init.sh" ]] && source "/Users/kwatanabe/.gvm/bin/gvm-init.sh"
