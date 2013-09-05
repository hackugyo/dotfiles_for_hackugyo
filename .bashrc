
PATH=/opt/local/bin:/opt/local/sbin:/Users/kwatanabe/shellscripts:$PATH
# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# emacs23.4
alias emacs='/usr/local/Cellar/emacs/23.4/Emacs.app/Contents/MacOS/Emacs -nw'

# rmtrash
alias rm='rmtrash'
alias mv='mv -i'

# ag
# http://qiita.com/yuyuchu3333/items/4c57186e37db9eb3db15
alias ag='ag --smart-case --color --stats' # --pager "less -F"'

# show path
alias show_path='echo -e ${PATH//:/\\n}'

# reload bashrc
alias reload_bashrc='source ~/.bashrc'

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/kwatanabe/.gvm/bin/gvm-init.sh" ]] && source "/Users/kwatanabe/.gvm/bin/gvm-init.sh"

