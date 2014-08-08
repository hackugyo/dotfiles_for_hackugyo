
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
#alias rm='rmtrash'
# rmtrashは-rオプションを受け付けないので，aliasして使えない．
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

# users
# http://kazmax.zpp.jp/linux_beginner/etc_passwd.html
alias listusers="cut -d: -f1 /etc/passwd"

# List usb devices up.
# http://qiita.com/jumbOS5/items/98b84da339833e42df8a
alias usb_list="system_profiler SPUSBDataType"
alias list_usbs="usb_list"

# List JDK versions up.
# http://qiita.com/mas0061/items/2fe9333f045800d00b5c
alias java_list="/usr/libexec/java_home -V"
alias list_javas="java_list"
alias java_version="/usr/libexec/java_home" # java -version
# export JAVA_HOME=`/usr/libexec/java_home -v 1.6.0`

# Find a file by name, and open the selected result by emacs or atom.
# powerd by percol.
emacsfind() { find ./ -name $1 | percol | xargs emacsclient --no-wait; }
atomfind() { find ./ -name $1 | percol | xargs atom; }
openfind() { find $1 -name $2 | percol | xargs open; }
alias findemacs="emacsfind"
alias findatom="atomfind"
alias findopen="findopen"


# alias cd to pushd, bd to popd
# http://rcmdnk.github.io/blog/2013/04/10/computer-bash/
function cd {
    if [ $# = 0 ];then
        command cd
    elif [ "$1" = "-" ];then
        local opwd=$OLDPWD
        pushd . >/dev/null
        command cd $opwd
    elif [ -f "$1" ];then
        pushd . >/dev/null
        command cd $(dirname "$@")
    else
        pushd . >/dev/null
        command cd "$@"
    fi
}
alias bd="popd >/dev/null"

# count string length
# http://linux.just4fun.biz/逆引きシェルスクリプト/文字列の長さを調べる方法.html
count_length() {
    variable_for_count_length=$1;
    echo ${#variable_for_count_length};
    variable_for_count_length='';
}

# Ctrl+Sでターミナルへの出力をロックされると腹立つので，
# 解除しておく
# http://gordonshumway.seesaa.net/article/127966445.html
stty stop undef

# bash-completion
# http://qiita.com/soramugi/items/846e6eac0ce1d3dc1e42
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/kwatanabe/.gvm/bin/gvm-init.sh" ]] && source "/Users/kwatanabe/.gvm/bin/gvm-init.sh"

