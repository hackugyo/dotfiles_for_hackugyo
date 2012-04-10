
;; Emacs 23より前のバージョン用に変数定義
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))
;; 大竹,2012 p.61だとwhen (> emacs-major-version 23)となっているが間違い

;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	     (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "/elisp" "/conf" "/public_repos") ;（大竹,2012 p.61だと，"elisp"となっている）
;; ~/.emacs.d/elispディレクトリをロードパス変数に追加するだけなら以下でよかった
;; (add-to-list 'load-path "~/.emacs.d/elisp")

;; install-elispを使えるようにし、インストール場所を指定する．
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp")

;; http://corerepos.org/share/browser/lang/elisp/init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

(setq-default tab-width 4) 
(setq-default indent-tabs-mode nil)

;;タイトルバーにファイルのフルパスを表示
(setq frame:title-format "%f")
;;ウィンドウ左に行番号を表示
(global-linum-mode t)

;; Rakefileもruby-modeで動かす
;; http://jampin.blog20.fc2.com/blog-entry-117.html
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))


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