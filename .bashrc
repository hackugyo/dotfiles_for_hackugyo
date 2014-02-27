
PATH=/opt/local/bin:/opt/local/sbin:/Users/kwatanabe/shellscripts:$PATH
# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# phpenv
PATH=$PATH:$HOME/.phpenv/bin

# Android NDK
NDKROOT=$HOME/Developer/Android/android-ndk-r9b

# emacs23.4
alias emacs='/usr/local/Cellar/emacs/23.4/Emacs.app/Contents/MacOS/Emacs -nw'
emacsc() { emacsclient $1 --no-wait; }
# http://d.hatena.ne.jp/syohex/20101224/1293206906

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

# bashmarks
source ~/.local/bin/bashmarks.sh

# git completion
# http://yutapon.hatenablog.com/entry/2013/08/25/195126
source /opt/local/share/git-core/contrib/completion/git-completion.bash
source /opt/local/share/git-core/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
# PS1='\[\033[40;1;32m\]\u\[\033[2;32m\]@\[\033[0m\]\[\033[40;32m\]\h \[\033[1;36m\]\w \[\033[31m\]$(__git_ps1 "[%s]")\[\033[00m\] \[\033[0m\]\[\033[40;2;37m\]`date +"%Y/%m/%d %p %H:%M:%S"` \[\033[0m\]\n\\$ '
# 色変更開始：\[\033[0;36m\]
# 色変更終了（黒に戻す）：\[\033[0m\] 
PS1='\[\033[0;36m\]\u \[\033[0;32m\]\h:\[\033[0;33m\]\w\[\033[0;35m\] $(__git_ps1 "[%s]")\[\033[0;2;1m\] `date +" %H:%M:%S"`\[\033[0m\]\$ '
export PS1=$PS1

#phpenv
#eval "${phpenv init -}"

# Laucnch an app setting screen in the device
# http://qiita.com/t2low/items/4ec1e9cab8621cd23396
appinfo() { adb shell am start -a android.settings.APPLICATION_DETAILS_SETTINGS -d package:$1; }

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/kwatanabe/.gvm/bin/gvm-init.sh" ]] && source "/Users/kwatanabe/.gvm/bin/gvm-init.sh"

