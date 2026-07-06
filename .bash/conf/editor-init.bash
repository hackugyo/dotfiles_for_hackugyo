# emacs24.4
# alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
# alias emacsclient='/usr/local/opt/emacs-mac/bin/emacsclient'
alias emacsclient='/usr/local/bin/emacsclient'

emacsc() {
    if [ "$#" -ne 1 ]; then
        emacsclient +$2 $1 --no-wait; # http://qiita.com/dtan4/items/9e2eb59373f0b2b5f17c
    else
        emacsclient $1 --no-wait;
    fi
}

# http://d.hatena.ne.jp/syohex/20101224/1293206906

# Find a file by name, and open the selected result by emacs or atom.
# powerd by percol.
emacsfind() { find ./ -name $1 | percol | xargs /usr/local/opt/emacs-mac/bin/emacsclient  --no-wait;}
 atomfind() { find ./ -name $1 | percol | xargs atom; }
 openfind() { find $1 -name $2 | percol | xargs open; }
 alias findemacs="emacsfind"
 alias findatom="atomfind"
 alias findopen="findopen"
