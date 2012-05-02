
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

;; TABの表示幅
(setq-default tab-width 4) 
;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)
;; 対応する括弧をハイライト
;; paren-mode : 対応する括弧を強調して表示
(setq show-paren-delay 0) ; 表示までの秒数
(show-paren-mode t) ; 有効化
;; parenのスタイル：expressionは括弧内も強調表示
(setq show-paren-style 'expression)
;; フェイスを変更する
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "blue")


;;タイトルバーにファイルのフルパスを表示
(setq frame:title-format "%f")
;;ウィンドウ左に行番号を表示
(global-linum-mode t)
;;モードラインにカラム番号も表示
(column-number-mode t)

;; リージョン内の行数と文字数とをモードラインに表示する
;; http://d.hatena.ne.jp/sonota88/20110224/1298557375
(defun count-lines-and-chars()
  (if mark-active
      (format "%d lines, %d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))

(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))

;;タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;;スタートアップ非表示
(setq inhibit-startup-screen t)
;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;;折り返しトグルコマンドのエイリアスを設定
(define-key global-map  (kbd "C-c l") 'toggle-truncate-lines)

;; バックアップファイルの作成場所をシステムのTempディレクトリに変更する
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
;; バックアップファイルの作成場所をシステムのTempディレクトリに変更する
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

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
;; (install-elisp "http://docutils.sourceforge.net/tools/editors/emacs/rst.el")

;; package.el(ELPA)の設定
(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeと開発者運営のELPAとを追加
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
               '("ELPA" . "http://tromey.com/elpa"))
  ;; インストールしたパッケージにロードパスを通して読み込む
  (package-initialize))

;; インストールしたもの
;; Anything
;; htmlize
;; auto-complete

;; auto-completeの設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))


;;; rst.el --- Mode for viewing and editing reStructuredText
;; 設定サンプル：http://d.hatena.ne.jp/CortYuming/20081231/p1
(setq auto-mode-alist
      (append '(
               ;("\\.txt$" . rst-mode)
               ("\\.rst$" . rst-mode)
               ) auto-mode-alist))
;; slidesを動かす
(add-hook 'rst-mode-hook
          (lambda ()
            (setq rst-slides-program "open -a Firefox")
            ))
;; バックグラウンドが暗い場合の設定
; (setq frame-background-mode 'dark)

;; cua-modeの設定
(cua-mode t) ; cua-modeをオン
(setq cua-enable-cua-keys nil) ; cuaキーバインドをオフ

;; js-mode の基本設定
(defun js-indent-hook()
  ;; インデント幅を2にする
  (setq js-indent-level 2
        js-expr-indent-offset 2
        indent-tabs-mode nil)
  ;; switch文のcaseラベルをインデントする関数を定義する
  (defun my-js-indent-line ()
    (interactive)
    (let* ((parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (js--proper-indentation parse-status)))
      (back-to-indentation)
      (if (looking-at "case\\s-")
          (indent-line-to (+ indentation 2))
        (js-indent-line))
      (when (> offset 0) (forward-char offset))))
  ;; caseラベルのインデント処理をセットする
  (set (make-local-variable 'indent-line-function) 'my-js-indent-line)
  )

;; js-modeの起動時にhookを追加
(add-hook 'js-mode-hook 'js-indent-hook)

;; js2-modeの起動時にjs-modeのインデント機能を追加
(add-hook 'js2-mode-hook 'js-indent-hook)
      