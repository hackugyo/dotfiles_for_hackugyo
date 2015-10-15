;;auto-installの設定
(when (require 'auto-install)
  ;; インストールディレクトリを設定する
  (setq auto-install-directory "~/.emacs.d/elisp"/)
  ;; EmacsWiki に登録されているelisp の名前を取得する
  (auto-install-update-emacswiki-package-name t)
  ;; 必要であればプロキシの設定を行う
  ;; (setq url-proxy-services '(("http" . "localhost:8339")))
  ;; install-elispの関数を利用可能にする
  (auto-install-compatibility-setup))

;;auto-installしたもの
;; (install-elisp "http://www.emacswiki.org/emacs/download/redo+.el")
;; (install-elisp "http://docutils.sourceforge.net/tools/editors/emacs/rst.el")
