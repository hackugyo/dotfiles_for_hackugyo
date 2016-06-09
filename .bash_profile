PATH=$PATH:/Applications/android-sdk-macosx/tools:/Users/kwatanabe/projects/android/android-ndk-r8b

# Android
ANDROID_HOME=/Users/kwatanabe/android-sdks/
PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=/usr/local/bin:$PATH
MANPATH=/opt/local/man:$MANPATH

PGDATA=/usr/local/var/postgres
PGHOST=localhost

# http://d.hatena.ne.jp/hana-da/20110817/1313579740
CC=gcc-4.2

# .bash_profile
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# sudoでも補完
complete -cf sudo

# bashでコマンド履歴を共有する
function share_history {  # 以下の内容を関数として定義
    history -a  # .bash_historyに前回コマンドを1行追記
    history -c  # 端末ローカルの履歴を一旦消去
    history -r  # .bash_historyから履歴を読み込み直す
}
PROMPT_COMMAND='share_history'  # 上記関数をプロンプト毎に自動実施
shopt -u histappend   # .bash_history追記モードは不要なのでOFFに
export HISTSIZE=9999  # 履歴のMAX保存数を指定
export HISTFILESIE=9999 # 履歴ファイルの保存履歴数を指定
export HISTCONTROL=ignoreups # 同じコマンドが連続した場合に1k回だけ記録する
export HISTIGNORE=history # historyじしんの呼び出しは記録しない

# color Terminal
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# DYLD_LIBRARY_PATH bug of Mac
# http://qiita.com/dvorak__/items/4e365746adc8f56e9764
unset LD_LIBRARY_PATH
unset DYLD_LIBRARY_PATH

# binにパスを通す
MyBIN="${HOME}/bin"
if [ ! -d "${MyBIN}" ] ;then mkdir "${MyBIN}" ;fi
PATH="${MyBIN}:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/kwatanabe/.gvm/bin/gvm-init.sh" ]] && source "/Users/kwatanabe/.gvm/bin/gvm-init.sh"
