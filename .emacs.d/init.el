;; 環境変数を基準に
;; http://sakito.jp/emacs/emacsshell.html#path
;; より下に記述した物が PATH の先頭に追加されます
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
;; PATH と exec-path に同じ物を追加します
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))


;; Emacs 23より前のバージョン用に変数定義
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))
;; 大竹,2012 p.61だとwhen (> emacs-major-version 23)となっているが間違い

;; キーボード設定
;; これやるとCmdがそもそもOSから来なくなる(setq mac-command-modifier nil)
(setq mac-command-modifier 'super)
;; なぜかCmd+VやCmd+Cが効果なくなってしまったので，独自に明示的なショートカットとして定義した

(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-c") 'kill-ring-save)
;; metaキーはopt(alt)
(setq mac-option-modifier 'meta)

;; http://d.hatena.ne.jp/aoe-tk/20120916/1347797072
;; バックスラッシュ
;; バグっている？
;;(define-key global-map [?\M-\] "\\") ;; Alt/OptキーをMetaキーとしてりようしているため
;; 1もじさくじょ
(global-set-key "\C-h" 'backward-delete-char)
;; なぜかC-uがきかないのでめいじてきについか
(define-key global-map "\C-u" 'universal-argument)
;; なぜか明示的に追加しても無効なのでCmd+uを割り当てた
(global-set-key (kbd "s-u") 'universal-argument)

;; smooth-scroll
(require 'smooth-scroll)
(smooth-scroll-mode t)
;; マウス・スクロールを滑らかにする（Mac Emacs 専用）
(setq mac-mouse-wheel-smooth-scroll t)

;; 
(setq scroll-conservatively 1000)
(setq scroll-step 1)
(setq scroll-margin 0) ; default=0

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; http://www.nobu417.jp/weblog/hacks/how-to-controll-emacs-on-terminal-with-mouse.html
(mouse-wheel-mode t)
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))

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


;;yankとOSのクリップボードとを共有
;; http://qiita.com/items/f5ccc2b027a9aaa13fe4
;; Mac OS Xの場合は上記だとだめかも？ 
;; http://blog.lathi.net/articles/2007/11/07/sharing-the-mac-clipboard-with-emacs

;; バックアップファイルの作成場所をシステムのTempディレクトリに変更する
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; バックグラウンドが暗い場合の設定
; (setq frame-background-mode 'dark)

;====================================
;;jaspace.el を使った全角空白、タブ、改行表示モード
;;切り替えは M-x jaspace-mode-on or -off
;;http://ubulog.blogspot.jp/2007/09/emacs_09.html
;====================================
;;(require 'jaspace)
;; 全角空白を表示させる。
;;(setq jaspace-alternate-jaspace-string "□")
;; 改行記号を表示させる。
;;(setq jaspace-alternate-eol-string "↓\n")
;; タブ記号を表示。
;;(setq jaspace-highlight-tabs t) ; highlight tabs


;;; windmove
;; http://d.hatena.ne.jp/tomoya/20120512/1336832436
;; MacのCommand+やじるしでウィンドウを移動する
(windmove-default-keybindings 'super)


;====================================
;現在の時刻を入力
;http://www.bookshelf.jp/soft/meadow_37.html#SEC547
;====================================
(defun my-insert-time ()
  (interactive)
  (insert (concat
           "Time:" (format-time-string "%H:%M:%S"))))

;;; init.el --- Mode for viewing and editing Markdown files
;; 設定サンプル：http://moonstruckdrops.github.io/blog/2013/03/24/markdown-mode/
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;;; saveされたらgit nowする
;; 
;; shell-commandの代わりにcall-process-shell-command
;; http://stackoverflow.com/questions/11613974/how-can-the-shell-command-output-buffer-be-kept-in-the-background
;; git 2.0からは，サブディレクトリの中にいるときgit管理下ディレクトリをupdateできないようになるので，
;; コロンをつけて全部updateしてほしい旨を明示した
(when (executable-find "git")
  (defun gitnow-after-save-hook ()
    (call-process-shell-command
     (format
      "git now : &"
      (buffer-name (current-buffer)))
     nil "*Shell Command Output*" t))
  (add-hook 'after-save-hook 'gitnow-after-save-hook)
  )

(defun gitnow-after-save ()
  (interactive)
  (when (executable-find "git")
    (add-hook 'after-save-hook 'gitnow-after-save-hook)))

(defun gitnow-remove-after-save ()
  (interactive)
  (when (executable-find "git")
    (remove-hook 'after-save-hook 'gitnow-after-save-hook)))

;; http://superuser.com/a/621290
;; Do not use rebase-mode. 
;; The rebase-mode in emacs is read-only and not use-friendly.
(setq auto-mode-alist (delete '("git-rebase-todo" . rebase-mode)
                              auto-mode-alist))


;; http://pokutech.hatenablog.com/entry/2012/07/14/233900
;; バッファローカルに，shell-commandを実行する一時的なafter-save-hookを追加するelispを追加する．
;; 動作しない．
(defun temp-shell-command-after-save ()
  (interactive)
  (let* command-to-exec
    (setq command-to-exec (read-input "shell-command: "))
    (add-hook 'after-save-hook
              '(lambda ()
                 (shell-command command-to-exec)
                 ) nil t)
    (princ (format "Shell-command `%s` will run when after saving this buffer." command-to-exec))
    ))

;; 最近開いたファイル機能を有効化
;; 開くときはM-x recentf-open-files
(recentf-mode 1)

;; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))

;; php-modeを入れたが，
;;; Symbol's function definition is void: php-heredoc-syntax
;; のエラーが出てしまうため削除．
;; php-mode-improvedをel-get経由で再度インストールした
;; http://d.hatena.ne.jp/rubikitch/20101209/elget
;;; 暇を見てこちらも設定予定
;;; http://mugijiru.seesaa.net/article/326967860.html
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))


;====================================
;; 背景色を設定する
;; http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html#color
;====================================
(if window-system (progn
                    ;; モードライン（アクティブでないバッファ）の背景色を設定します。
                    (set-face-background 'mode-line-inactive "gray85")
                    ))

;; https://github.com/tomoya/hiwin-mode
;; (require 'hiwin)
;; (hiwin-mode)
;; Emacs23.4からEmacs24.4にあげたら動かなくなった

;; http://qiita.com/scalper/items/c98f97ecc516aaaa8c32
(if (eq window-system 'ns)
    (progn
      ; ここにGUIアプリとして起動したときの設定を追加
      ;; menu-barを非表示
      (menu-bar-mode 0)

      (server-start) ; server起動
      ))

;========================================
; Mac用フォント設定
;========================================

 ;; 英語
 (set-face-attribute 'default nil
             :family "Menlo" ;; font
             :height 120)    ;; font size

;; 日本語
;;(set-fontset-font
;; nil 'japanese-jisx0208
;; (font-spec :family "Hiragino Mincho Pro")) ;; font
;;  (font-spec :family "Noto Sans Japanese")) ;; font

;; 半角と全角の比を1:2にしたければ
(setq face-font-rescale-alist
;;        '((".*Hiragino_Mincho_pro.*" . 1.2)))
;;      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)));; Mac用
      '((".*Noto Sans Japanese.*" . 1.2)));; Mac用

(when (memq window-system '(mac ns))
  (global-set-key [s-mouse-1] 'browse-url-at-mouse)
  (let* ((size 12)
	 (jpfont "Noto Sans Japanese")
	 (asciifont "Menlo")
	 (h (* size 10)))
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font t 'katakana-jisx0201 jpfont)
    (set-fontset-font t 'japanese-jisx0208 jpfont)
    (set-fontset-font t 'japanese-jisx0212 jpfont)
    (set-fontset-font t 'japanese-jisx0213-1 jpfont)
    (set-fontset-font t 'japanese-jisx0213-2 jpfont)
    (set-fontset-font t '(#x0080 . #x024F) asciifont))
  (setq face-font-rescale-alist
	'(("^-apple-hiragino.*" . 1.2)
	  (".*-Hiragino Maru Gothic ProN-.*" . 1.2)
	  (".*osaka-bold.*" . 1.2)
	  (".*osaka-medium.*" . 1.2)
	  (".*courier-bold-.*-mac-roman" . 1.0)
	  (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
	  (".*monaco-bold-.*-mac-roman" . 0.9)
	  ("-cdac$" . 1.3)))
  ;; C-x 5 2 で新しいフレームを作ったときに同じフォントを使う
  (setq frame-inherited-parameters '(font tool-bar-lines)))

;====================================
;;全角スペースとかに色を付ける
;; http://ubulog.blogspot.jp/2007/09/emacs_09.html
;====================================
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil)
(defface my-face-b-1 '((t (:background "dark turquoise"))) nil)
(defface my-face-b-2 '((t (:background "cyan"))) nil)
(defface my-face-b-2 '((t (:background "SeaGreen"))) nil)
(defface my-face-u-1 '((t (:background "SeaGreen"))) nil)
;(defface my-face-u-1 '((t (:foreground "SeaGreen" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
            (font-lock-add-keywords
                 major-mode
                    '(
                           ("　" 0 my-face-b-1 append)
                           ("\t" 0 my-face-b-2 append)
                           ("[ ]+$" 0 my-face-u-1 append)
          )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                             (if font-lock-mode
                               nil
                               (font-lock-mode t))))

;========================================
;; 以前開いたファイルを再度開いたとき、元のカーソル位置を復元する
;; http://www.emacswiki.org/emacs/SavePlace
;; http://d.hatena.ne.jp/hnw/20140111
;========================================

(when (require 'saveplace nil t)
  (setq-default save-place t)
  (setq save-place-file "~/.emacs.d/saved-places"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; gradle-mode
; install-elipsコマンドでインストールした
; https://github.com/jacobono/emacs-gradle-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'gradle-mode)
;; (gradle-mode 1)

;;;;;;;;;;;;;;;;;;;;
;; "リージョンの各行に行番号とファイル名をつけてヤンクバッファにコピー"
;; http://www.bookshelf.jp/soft/meadow_32.html#SEC454
;;;;;;;;;;;;;;;;;;;;
(defun copy-region-with-info (arg)
  "リージョンの各行に行番号とファイル名をつけてヤンクバッファにコピー
   C-u で数引数をつけると、ファイル名がフルパスで付与される"
  (interactive "p")
  (save-excursion
    (let ((e (max (region-end) (region-beginning)))
          (b (min (region-end) (region-beginning)))
          (str)
          (first t))
      (goto-char b)
      (while (<= (+ (point) 1) e)
        (beginning-of-line)
        (setq str
              (format
               "%s:%d:%s"
               (if (not (eq arg 1))
                   (buffer-file-name)
                 (buffer-name))
               (1+ (count-lines 1 (point)))
               (buffer-substring
                (point)
                (progn
                  (end-of-line)
                  (if (eobp)
                      (signal 'end-of-buffer nil))
                  (forward-char)
                  (point)))))
        (backward-char)
        (if (not first)
            (kill-append str nil)
          (setq kill-ring
                (cons str
                      kill-ring))
          (if (> (length kill-ring) kill-ring-max)
              (setcdr (nthcdr (1- kill-ring-max) kill-ring) nil))
          (setq kill-ring-yank-pointer kill-ring)
          (setq first nil))
        (forward-line 1)))))
(put 'set-goal-column 'disabled nil)


;========================================
;; はてなダイアリー
;; http://d.hatena.ne.jp/tarao/20130110/1357821338
;; 依存先としてsha1-el.elが必要
;========================================
; (add-to-load-path "/public_repos/hatena-dialy")
; (add-to-load-path "/public_repos/hatena-markup-mode")
; (require 'hatena-diary)
; (setq hatena:d:major-mode 'hatena:markup-mode)
; うまく動かなかった
;========================================
; はてな記法
; http://d.hatena.ne.jp/amt/20060115/HatenaHelperMode
;========================================
(add-to-load-path "/public_repos/hatena-mode")
(require 'hatenahelper-mode)
;(add-hook 'hatena-mode-hook 'hatenahelper-mode)  ; 本当はこう
(add-hook 'hatena-mode-hook
	  '(lambda ()
          ; other hooks must be wrote here!
	     (hatenahelper-mode 1)))
;;========================================
;; http://qiita.com/k_ui/items/d9e03ea9523036970519
;;========================================
(defun reopen-with-sudo ()
  "Reopen current buffer-file with sudo using tramp."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if file-name
        (find-alternate-file (concat "/sudo::" file-name))
      (error "Cannot get a file name"))))

;;========================================
;; web-mode
;;========================================
;; 拡張子の設定
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
