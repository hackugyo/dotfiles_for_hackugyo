# ターミナルにgitのブランチ名を表示する。
# https://qiita.com/yamaday0u/items/ee8acb35709bcc8c7fc7
source /opt/local/share/git-core/git-prompt.sh
# source /opt/local/share/git-core/git-completion.zsh
zstyle ':completion:*:*:git:*' source /usr/local/share/zsh/site-functions/_git

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true

# プロンプトの表示設定
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f:%F{143}%1~%f %F{magenta}$(__git_ps1 "[%s]")%f%F{138}`date +" %H:%M:%S"`%f\$ '

