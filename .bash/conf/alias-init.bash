
# emacs24.4
alias emacs='/Users/kwatanabe/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias emacsclient='~/opt/emacs-24.4/bin/emacsclient'
emacsc() { emacsclient $1 --no-wait; }
# http://d.hatena.ne.jp/syohex/20101224/1293206906

# rmtrash
#alias rm='rmtrash'
# rmtrashは-rオプションを受け付けないので，aliasして使えない．
alias mv='mv -i'


# ag
# http://qiita.com/yuyuchu3333/items/4c57186e37db9eb3db15
alias ag='ag --smart-case --color --stats -A 0' # --pager "less -F"'
alias agag='\ag'
alias ag_filenames='ag --smart-case --color --stats --files-with-matches'

# show path
alias show_path='echo -e ${PATH//:/\\n}'

# reload bashrc
alias reload_bashrc='source ~/.bashrc'


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
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`

# java
alias java_home='/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home'
alias javac="javac -J-Dfile.encoding=UTF-8"
alias java="java -Dfile.encoding=UTF-8"

alias sourcetree='open -a SourceTree'
