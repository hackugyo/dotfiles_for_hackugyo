PATH=$PATH:/Applications/android-sdk-macosx/tools:/Users/kwatanabe/projects/android/android-ndk-r8b

# Android
ANDROID_HOME=/Users/kwatanabe/android-sdks/
PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools
PATH=/opt/local/bin:/opt/local/sbin:$PATH
MANPATH=/opt/local/man:$MANPATH

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# Load RVM function

# http://d.hatena.ne.jp/hana-da/20110817/1313579740
CC=gcc-4.2

# .bash_profile
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# bashでコマンド履歴を共有する
function share_history {  # 以下の内容を関数として定義
    history -a  # .bash_historyに前回コマンドを1行追記
    history -c  # 端末ローカルの履歴を一旦消去
    history -r  # .bash_historyから履歴を読み込み直す
}
PROMPT_COMMAND='share_history'  # 上記関数をプロンプト毎に自動実施
shopt -u histappend   # .bash_history追記モードは不要なのでOFFに
export HISTSIZE=9999  # 履歴のMAX保存数を指定
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/kwatanabe/.gvm/bin/gvm-init.sh" ]] && source "/Users/kwatanabe/.gvm/bin/gvm-init.sh"

# color Terminal
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad