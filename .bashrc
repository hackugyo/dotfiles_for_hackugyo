
PATH=/opt/local/bin:/opt/local/sbin:/Users/kwatanabe/shellscripts:$PATH
# RVM
# phpenv
PATH=$PATH:$HOME/.phpenv/bin

#dyld(Dynamic Loader)
if [ -n "$DYLD_LIBRARY_PATH" ]; then
DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/lib
else
DYLD_LIBRARY_PATH=/usr/local/lib
fi
export DYLD_LIBRARY_PATH

# Android NDK
NDKROOT=$HOME/Developer/Android/android-ndk-r9b

# nodebrew
PATH=$HOME/.nodebrew/current/bin:$PATH


# EDITOR
export EDITOR=~/opt/emacs-24.4/bin/emacsclient

# sudo に続くコマンドの補完を有効にする
# sudo completion
complete -cf sudo

# ヒストリーのダイエット
# http://takuya-1st.hatenablog.jp/entry/20090828/1251474360
export HISTCONTROL=ignoredups
export HISTIGNORE="fg*:bg*:history*:"
HISTTIMEFORMAT='%Y%m%d %T';
export HISTTIMEFORMAT

# bashmarks
source ~/.local/bin/bashmarks.sh

# git completion
# http://yutapon.hatenablog.com/entry/2013/08/25/195126
# 先にgit-promptを読み込ませる
# http://qiita.com/note109/items/2adb71024d675bc43177
source /opt/local/share/git-core/git-prompt.sh
source /opt/local/share/git-core/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
# PS1='\[\033[40;1;32m\]\u\[\033[2;32m\]@\[\033[0m\]\[\033[40;32m\]\h \[\033[1;36m\]\w \[\033[31m\]$(__git_ps1 "[%s]")\[\033[00m\] \[\033[0m\]\[\033[40;2;37m\]`date +"%Y/%m/%d %p %H:%M:%S"` \[\033[0m\]\n\\$ '
# 色変更開始：\[\033[0;36m\]
# 色変更終了（黒に戻す）：\[\033[0m\]
PS1='\[\033[0;36m\]\u \[\033[0;32m\]\h:\[\033[0;33m\]\w\[\033[0;35m\] $(__git_ps1 "[%s]")\[\033[0;2;1m\] `date +" %H:%M:%S"`\[\033[0m\]\$ '
export PS1=$PS1

#phpenv
#eval "${phpenv init -}"


# Ctrl+Sでターミナルへの出力をロックされると腹立つので，
# 解除しておく
# http://gordonshumway.seesaa.net/article/127966445.html
stty stop undef

# bash-completion
# http://qiita.com/soramugi/items/846e6eac0ce1d3dc1e42
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi


# go
export GOPATH=$HOME/Developer/go/third-party:$HOME/Developer/go/my-project
export PATH=/usr/local/go/bin/:$HOME/Developer/go/third-party/bin:$HOME/Developer/go/my-project/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/kwatanabe/.gvm/bin/gvm-init.sh" ]] && source "/Users/kwatanabe/.gvm/bin/gvm-init.sh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
source /Users/kwatanabe/perl5/perlbrew/etc/bashrc

# http://qiita.com/skkzsh/items/20af9affd5cc1e9678f8
bash_conf=~/.bash/conf
. $bash_conf/alias-init.bash
. $bash_conf/env-init.bash
. $bash_conf/func-init.bash
