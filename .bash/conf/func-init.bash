
gsearch() {
    (if [ -p /dev/stdin ]; then
         argv=$(cat -)
     else
         argv=("$@")
     fi;\
     #argv=("$@"); \
     # arr=$(for v in "${argv[@]}"; do echo "$v"; done); \
     arr=$(for v in "${argv[@]}"; do echo "\"$v\""; done); \
     str="$(IFS=" "; echo "${arr[*]}")"; \
     echo search by $str; \
     open  https://www.google.co.jp/search?q="$str" & exit;\
     ) &
}

gsearch_d() {
    (if [ -p /dev/stdin ]; then
         # echo "pipe!"
         a=$(cat -)
     else
         a=$@
     fi;\
     argv=("$a"); \
     # http://u-tamax.jp/2012/08/nkfでurlエンコード/
     str="$(echo -n $argv | nkf -wMQ | sed 's/=$//g' | tr = % | tr -d "\n")"; \
     open https://www.google.co.jp/search?btnI'&'q="$str" & exit\
     ) &
}

tsearch() {
    (if [ -p /dev/stdin ]; then
         argv=$(cat -)
     else
         argv=("$@")
     fi;\
     #argv=("$@"); \
     # arr=$(for v in "${argv[@]}"; do echo "$v"; done); \
     arr=$(for v in "${argv[@]}"; do echo "\"$v\""; done); \
     str="$(IFS=" "; echo "${arr[*]}")"; \
     echo search by $str; \
     open https://twitter.com/search?f=tweets'&'vertical=default'&'q="$str"'&'src=typed & exit;\
    ) &
}


# reminder_cd
# .cd-reminderファイルを置いたディレクトリに移動したときにメッセージを出す
# ただしpushdを使う．pushdはよけいなことを標準出力するので無視させる
# http://unix.stackexchange.com/a/18533
reminder_cd() {
    builtin pushd "$@" >/dev/null && { [ ! -f .cd-reminder ] || cat .cd-reminder 1>&2; }
}

alias cd=reminder_cd

# count string length
# http://linux.just4fun.biz/逆引きシェルスクリプト/文字列の長さを調べる方法.html
count_length() {
    variable_for_count_length=$1;
    echo ${#variable_for_count_length};
    variable_for_count_length='';
}


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

# find the newest file.
lsnewest() { ls -tdF $1* | head -n 1 | sed -e "s% %\\\ %g" ;}
open_newest(){ ls -tdF $1* | head -n 1 | sed -e "s% %\\\ %g" | xargs open;}

# Find a file by name, and open the selected result by emacs or atom.
# powerd by percol.
emacsfind() { find ./ -name $1 | percol | xargs ~/opt/emacs-24.4/bin/emacsclient  --no-wait;}
atomfind() { find ./ -name $1 | percol | xargs atom; }
openfind() { find $1 -name $2 | percol | xargs open; }
alias findemacs="emacsfind"
alias findatom="atomfind"
alias findopen="findopen"

# Launch Browser with URL
adbbrowse() {
    adb_all shell am start -a android.intent.action.VIEW -d $1;
}

# http://qiita.com/hackugyo/items/a8688cb3ea236375d758
adb_all() {
    adb devices | sed '1d' | sed -e "s/device//" | sed '/^$/d' | while read i; do  echo ""; echo " -- " ${i}; adb -s ${i} $@; done;
}

# Launch an app setting screen in the device
# http://qiita.com/t2low/items/4ec1e9cab8621cd23396
appinfo() {
    adb_all shell am start -a android.settings.APPLICATION_DETAILS_SETTINGS -d package:$1;
}

appsinfo() {
    adb_all shell 'pm list packages -f';
}

clone_all_branch() { # 一発で全ブランチをcloneする
    (set -eu -o pipefail; \
     repo=${2:-"repo"}; \
     origin=$1; \
     git clone $origin $repo; \
     cd $repo; \
     for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master `; do \
         git branch --track ${branch#remotes/origin/} $branch;\
     done;\
    ) 
}

redmine() {
    (set -eu -o pipefail; \
     cat .redmine | xargs open;
    )
}

git_origin() {
    (set -eu -o pipefail; \
     commit_hash=${1:-""}; \
     blob_where=${2:-""};
     if [ -n "${commit_hash}" ]; then \
         if [ -n "${blob_where}" ]; then \
             commit_hash="/blob/${commit_hash}/${blob_where}"; \
         else \
             commit_hash="/commits/${commit_hash}"; \
         fi; \
     fi; \
     git remote -v | grep origin | \
         sed -e 's/origin//' | \
         sed -e 's/\/git\//\//' | \
         sed -e 's/\.git (.*$//' | \
         sed -e 's/git@github.com:/https:\/\/github.com\//' | \
         head -n 1 | \
         xargs -I {} echo {}${commit_hash};
    )
}

git_open_origin() {
    (set -eu -o pipefail; \
     commit_hash=${1:-""}; \
     blob_where=${2:-""}; \
     git_origin ${commit_hash} ${blob_where} | open_url;
    )
}

git_open_issue() {
    (set -eu -o pipefail; \
     issue=${1:-""}; \
     open `git_origin`"/issues/${issue}"
    )
}

open_url() {
    if [ -p /dev/stdin ]; then
        cat -
    else
        echo
    fi | xargs -I {} open {}
}

chrome_open_url() {
    if [ -p /dev/stdin ]; then
        cat -
    else
        echo
    fi | xargs -I {} open -a /Applications/Google\ Chrome.app/ {}
}

git_open_origin_chrome() {
    (set -eu -o pipefail; \
     commit_hash=${1:-""}; \
     blob_where=${2:-""}; \
     git_origin ${commit_hash} ${blob_where} | chrome_open_url;
    )
    }

does_follow_my_follower () {
    (set -ue;
     if [ -p /dev/stdin ]; then
        a=$(cat -);
    else
        a=$@;
    fi;
    argv=("$a");
    t followings $argv | xargs -I % t does_follow % pubkugyo;)
}

url_encode() {
  nkf -W8MQ |
    sed 's/=$//' |
    tr '=' '%' 
}

show_tabs() {
    cat ~/Library/Application\ Support/Firefox/Profiles/*.default/sessionstore-backups/recovery.js |
        jq -r '.windows[].tabs[].entries[] | { name: .title, url: .url }'
}

# Finderのアクティブウィンドウのパスにターミナルで移動
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]
  then
    cd "$target"
    pwd
  else
    echo 'No Finder window found' >&2
  fi
}

## Google推奨のエラー出力関数
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

## 本の検索
### https://manablog.org/google-books-apis/
book_search() {
    (if [ -p /dev/stdin ]; then
         argv=$(cat -)
     else
         argv=("$@")
     fi;\

     arr=$(for v in "${argv[@]}"; do echo "\"$v\""; done); \
     query="$(IFS=" "; echo "${arr[*]}")"; \
     echo search "https://www.googleapis.com/books/v1/volumes?country=JP&q=$query"; \
     http GET "https://www.googleapis.com/books/v1/volumes?country=JP&q=$query" | \
         jq '.items[].volumeInfo | {
title: (.title + (if ((.subtitle | length) > 0) then ("——" + .subtitle) else "" end)), 
url: ("http://www.amazon.co.jp/dp/" + (.industryIdentifiers[] | select(.type == "ISBN_10") | .identifier)), 
isbn: (.industryIdentifiers[] | select(.type == "ISBN_13") | .identifier)
}' & exit; \
    ) &
}

## 動画の取り出し
### http://qiita.com/961neko/items/5fa6a751d8ff26f45654
function dmovie() {
  adb pull /sdcard/movie.mp4 $1;
  ffmpeg -i movie.mp4 -vf "scale=min(iw\,400):-1" -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=15 --colors 128 > movie.gif $1;
}


function adb_shot() {
    DATE=`date +$@`
if [ $# -ne 1 ]; then
    DATE=`date +"%Y%m%d_%H%M%S_%s"`
fi
FILENAME="s_${DATE}"
echo "capturing ${FILENAME}_*.png..."
adb devices \
        | sed -e "s/device//" \
        | sed '/^$/d' \
        | sed '1d'  \
        | while read line;
          do
              echo "execute for "  ${line};
              FILENAME_INNER="${FILENAME}_${line/:/_COLON_}.png";
              adb -s ${line} shell screencap -p "/sdcard/${FILENAME_INNER}";
              adb -s ${line} pull "/sdcard/${FILENAME_INNER}";
              adb -s ${line} shell rm "/sdcard/${FILENAME_INNER}"
              echo "";
          done;
echo "saved ${FILENAME}_*.png."
}
