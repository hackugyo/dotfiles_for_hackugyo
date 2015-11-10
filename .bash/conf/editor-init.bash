# emacs24.3でビルドした
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n"
emacsc() { emacsclient $1 --no-wait; }

# EDITOR
export EDITOR=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
