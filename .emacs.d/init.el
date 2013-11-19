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

;;スタートアップ非表示
(setq inhibit-startup-screen t)
;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;;折り返しトグルコマンドのエイリアスを設定
(define-key global-map  (kbd "C-c l") 'toggle-truncate-lines)

;;yankとOSのクリップボードとを共有
;; http://qiita.com/items/f5ccc2b027a9aaa13fe4
;; Mac OS Xの場合は上記だとだめかも？ 
;; http://blog.lathi.net/articles/2007/11/07/sharing-the-mac-clipboard-with-emacs

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

;; js2-modeを利用する設定（本来はjs2-mode-autoloads.elに記述ずみのはずだが？）
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

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

;; HTML編集のデフォルトモードをnxml-modeにする
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\(\\.[a-zA-Z_]+\\)?\\'" . nxml-mode))

;; HTML5対応
(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files
                "~//.emacs.d/public_repos/html5-el/schemas.xml"))
(require 'whattf-dt)

;; nxml-modeの基本設定
;; </を入力すると自動的にタグを閉じる
(setq nxml-slash-auto-complete-flag t)
;; M-TABでタグを補完
(setq nxml-bind-meta-tab-to-complete-flag t)
;; nxml-modeでauto-complete-modeを使用する
(add-to-list 'ac-modes 'nxml-mode)
;; インデント幅調整
(setq nxml-child-indent 2);初期値は2
(setq nxml-attribute-indent 4);初期値は4

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

;====================================
;;whitespaceパッケージを利用して全角スペース表示
;;http://d.hatena.ne.jp/tunefs/20100811/p1
;====================================
(setq whitespace-style
      '(tabs spaces space-mark))
(setq whitespace-space-regexp "\\( +\\|\u3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])))
(require 'whitespace)
(global-whitespace-mode 1)

;====================================
;; セッション
;; http://ubulog.blogspot.jp/2007/09/emacs_15.html
;====================================
;;Emacsを終了してもファイルを編集してた位置や
;;minibuffer への入力内容を覚えててくれます。
(when (require 'session nil t)
  (setq session-initialize '(de-saveplace session keys menus places)
      session-globals-include '((kill-ring 50)
                                (session-file-alist 500 t)
                                (file-name-history 10000)))
  ;; これがないと file-name-history に500個保存する前に max-string に達する
  (setq session-globals-max-string 100000000)
  ;; デフォルトでは30!
  (setq history-length t)
  (add-hook 'after-init-hook 'session-initialize))

;;; windmove
;; http://d.hatena.ne.jp/tomoya/20120512/1336832436
;; MacのCommand+やじるしでウィンドウを移動する
(windmove-default-keybindings 'super)

;====================================
;Mac OSXのEmacs 23でURLをデフォルトのブラウザで起動させる。
;====================================
(defun browse-url-default-macosx-browser (url &optional new-window)
  (interactive (browse-url-interactive-arg "URL: "))
  (if (and new-window (>= emacs-major-version 23))
      (ns-do-applescript
       (format
        (concat "tell application \"Safari\" to make document with properties {URL:\"%s\"}\n"
                "tell application \"Safari\" to activate") url))
    (start-process (concat "open " url) nil "open" url)))
(put 'upcase-region 'disabled nil)

;====================================
;現在の時刻を入力
;http://www.bookshelf.jp/soft/meadow_37.html#SEC547
;====================================
(defun my-insert-time ()
  (interactive)
  (insert (concat
           "Time:" (format-time-string "%H:%M:%S"))))

;====================================
;REST記法
;====================================

;REST記法のリンクを作成
;====================================
(defun my-insert-rest-link ()
  (interactive)
  (insert (concat
           "`リンクテキスト <http://>`_")))


;REST記法の中見出しを作成
;====================================
(defun my-insert-rest-headword-middle ()
  (interactive)
  (insert (concat
           "====================")))


;====================================
;linum-modeを軽くする
; http://d.hatena.ne.jp/daimatz/20120215/1329248780
;====================================
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))

;====================================
;Option + ¥でバックスラッシュを入力する
; http://www.atotok.com/labo/diary/20111118221123.html
;====================================
(define-key global-map [?\M-¥] "\\")

;====================================
;Powerline: fancy status ine
;====================================
(require 'powerline)

(defun arrow-right-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 24 2 1\",
\". c %s\",
\"  c %s\",
\".           \",
\"..          \",
\"...         \",
\"....        \",
\".....       \",
\"......      \",
\".......     \",
\"........    \",
\".........   \",
\"..........  \",
\"........... \",
\"............\",
\"........... \",
\"..........  \",
\".........   \",
\"........    \",
\".......     \",
\"......      \",
\".....       \",
\"....        \",
\"...         \",
\"..          \",
\".           \",
\"            \"};"  color1 color2))



(defun arrow-left-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 24 2 1\",
\". c %s\",
\"  c %s\",
\"           .\",
\"          ..\",
\"         ...\",
\"        ....\",
\"       .....\",
\"      ......\",
\"     .......\",
\"    ........\",
\"   .........\",
\"  ..........\",
\" ...........\",
\"............\",
\" ...........\",
\"  ..........\",
\"   .........\",
\"    ........\",
\"     .......\",
\"      ......\",
\"       .....\",
\"        ....\",
\"         ...\",
\"          ..\",
\"           .\",
\"            \"};"  color2 color1))

(defconst color1 "#6699ff")
(defconst color2 "#ff66ff")
(defconst color3 "#696969")

(defvar arrow-right-1 (create-image (arrow-right-xpm color1 color2) 'xpm t :ascent 'center))
(defvar arrow-right-2 (create-image (arrow-right-xpm color2 color3) 'xpm t :ascent 'center))
(defvar arrow-right-3 (create-image (arrow-right-xpm color3 "None") 'xpm t :ascent 'center))
(defvar arrow-left-1  (create-image (arrow-left-xpm color2 color1) 'xpm t :ascent 'center))
(defvar arrow-left-2  (create-image (arrow-left-xpm "None" color2) 'xpm t :ascent 'center))

(setq-default mode-line-format
 (list  '(:eval (concat (propertize " %* %b " 'face 'mode-line-color-1)
                        (propertize " " 'display arrow-right-1)))
        '(:eval (concat (propertize " %Z " 'face 'mode-line-color-2)
                        (propertize " " 'display arrow-right-2)))
        '(:eval (concat (propertize " %m " 'face 'mode-line-color-3)
                        (propertize " " 'display arrow-right-3)))

        ;; Justify right by filling with spaces to right fringe - 16
        ;; (16 should be computed rahter than hardcoded)
        '(:eval (propertize " " 'display '((space :align-to (- right-fringe 17)))))

        '(:eval (concat (propertize " " 'display arrow-left-2)
                        (propertize " %p " 'face 'mode-line-color-2)))
        '(:eval (concat (propertize " " 'display arrow-left-1)
                        (propertize "%4l:%2c  " 'face 'mode-line-color-1)))
))

(make-face 'mode-line-color-1)
(set-face-attribute 'mode-line-color-1 nil
                    :foreground "#fff"
                    :background color1)

(make-face 'mode-line-color-2)
(set-face-attribute 'mode-line-color-2 nil
                    :foreground "#fff"
                    :background color2)

(make-face 'mode-line-color-3)
(set-face-attribute 'mode-line-color-3 nil
                    :foreground "#fff"
                    :background color3)

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "#000"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :foreground "#fff"
                    :background "#000")

;; smooth-scroll
(require 'smooth-scroll)
(smooth-scroll-mode t)

;; filecache
;;あらかじめディレクトリ名のリストを作成しておくと、カレントディレクトリがどこであるかにかかわらず、指定したディレクトリ以下のファイルはパスを辿らずに簡単に補完して開くことができます。
;; http://maruta.be/intfloat_staff/53
(require 'filecache)
(file-cache-add-directory-list
  (list "~/Developer/" "~/daily_working_log/log/")) ;; ディレクトリを追加
; (file-cache-add-file-list
;  (list "~/memo/memo.txt")) ;; ファイルを追加
(define-key minibuffer-local-completion-map "\C-c\C-i"
  'file-cache-minibuffer-complete)
; Emacs起動後に作成し阿多ファイルを対象にするには， M-x file-cache-add-directory-recursively

;; dired を使って、一気にファイルの coding system (漢字) を変換する
;; m でマークして T で一括変換
;; http://d.hatena.ne.jp/gan2/20070705/1183640419
(require 'dired-aux)
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key (current-local-map) "T"
              'dired-do-convert-coding-system)))

(defvar dired-default-file-coding-system nil
  "*Default coding system for converting file (s).")

(defvar dired-file-coding-system 'no-conversion)

(defun dired-convert-coding-system ()
  (let ((file (dired-get-filename))
        (coding-system-for-write dired-file-coding-system)
        failure)
    (condition-case err
        (with-temp-buffer
          (insert-file file)
          (write-region (point-min) (point-max) file))

    (if (not failure)
        nil
      (dired-log "convert coding system error for %s:\n%s\n" file failure)
      (dired-make-relative file)))))

(defun dired-do-convert-coding-system (coding-system &optional arg)
  "Convert file (s) in specified coding system."
  (interactive
   (list (let ((default (or dired-default-file-coding-system
                            buffer-file-coding-system)))
           (read-coding-system
            (format "Coding system for converting file (s) (default, %s): "
                    default)
            default))
         current-prefix-arg))
  (check-coding-system coding-system)
  (setq dired-file-coding-system coding-system)
  (dired-map-over-marks-check
   (function dired-convert-coding-system) arg 'convert-coding-system t))

;; json-modeのインデントの設定
;; C-x beautify-jsonに合わせた
;; http://blog.ainam.me/2011/12/13/emacs-js2-mode-indent/
 (add-hook 'json-mode-hook
           #'(lambda ()
               (require 'js)
               (setq js-indent-level 2
                     js-expr-indent-offset 2
                     indent-tabs-mode nil)
               (set (make-local-variable 'indent-line-function) 'js-indent-line)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; android-mode
;; http://qiita.com/items/bab8c1d27255b03b9ee1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'android-mode)

;; Android SDKのパス
(setq android-mode-sdk-dir "~/android-sdks")

;; コマンド用プレフィクス
;; ここで設定したキーバインド＋android-mode.elで設定された文字、で、各種機能を利用できます
(setq android-mode-key-prefix (kbd "C-c C-c"))

;; デフォルトで起動するエミュレータ名
(setq android-mode-avd "ICS15_on_x86")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ruby-encoding-mapがRuby1.9の扱えないエンコードを入れてしまうので抑制
;; http://d.hatena.ne.jp/arikui1911/20091126/1259217255
;; (add-to-list 'ruby-encoding-map '(japanese-cp932 . cp932))
;; http://atssh-knk.iobb.net/blog/?p=538
(add-hook 'ruby-mode-hook
          '(lambda ()
             (add-to-list 'ruby-encoding-map '(japanese-cp932 . cp932))
             (add-to-list 'ruby-encoding-map '(undecided . cp932))
             )
          )


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

