(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

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

;;;
;;; Unicode use
;; http://d.hatena.ne.jp/syou6162/20080519/1211133695
;; 漢字よりも前にひらがながないとフォントが意図したものにならない問題を軽減するため，
;; set-locale-environmentを設定しない．
;; (set-locale-environment "utf-8")
(set-locale-environment nil)
;; また，フォントが著しく壊れないだけで，フォントが変わってしまう問題が生じていたが，それはset-language-enviromentで修正できた．
(set-language-environment "Japanese")
(setenv "LANG" "ja_JP.UTF-8")
;; http://www.emacswiki.org/emacs/EmacsForMacOS#toc18
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

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

;; el-getを使えるようにすることはできない
;;; el-get 4.stableではel-get-bundleが使用できない
;;; ところがmasterではel-get-dirが使用できない

;; el-get
;;; (add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
;;; (require 'el-get)
;; el-getでダウンロードしたパッケージは ~/.emacs.d/el-get に入るようにする
;;; (setq el-get-dir (locate-user-emacs-file "el-get"))

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
;Powerline: fancy status line
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
(scroll-bar-mode -1)
;; マウス・スクロールを滑らかにする（Mac Emacs 専用）
(setq mac-mouse-wheel-smooth-scroll t)

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

;; where to see

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

(unless (package-installed-p 'inf-ruby)
  (package-install 'inf-ruby))


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
;; Emacs23.4からEmacs24.4にあげたら動かなくなった
;; Emacs24.4に上げたら'unknown color'のエラーが出るようになった
;; (require 'hiwin)
;; (hiwin-mode)


;; http://qiita.com/scalper/items/c98f97ecc516aaaa8c32
(if (eq window-system 'ns)
    (progn
      ; ここにGUIアプリとして起動したときの設定を追加
      ;; menu-barを非表示
      (menu-bar-mode 0)

      (server-start) ; server起動
      ))

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

;;====================================
;; 
;; https://github.com/ichibeikatura/nipposi
;;====================================
; (require 'niposi) (add-hook 'text-mode-hook '(lambda () (niposi-mode t)))


;;========================================
;; http://fukuyama.co/emacs-percent-encoding
;; Emacsでパーセントエンコード/デコードするスニペット
;;========================================
;; 対象の文字を指定。文字の直前には?をつけて列挙する
;; 空白の場合も?をつける 文字によっては?\が必要な場合もある
(setq my-chars-for-percent-encoding [?  ?{ ?} ?\" ?( ?) ?\; ?,])

;; 選択範囲に含まれる上で指定した文字を%文字に変換する
(defun my-encode-to-percent-string (&optional $beg $end)
  (interactive "r")
  (when (and $beg $end)
    (let* (($bufstr (buffer-substring-no-properties $beg $end))
           ($chars my-chars-for-percent-encoding)
           ($regexp (mapcar (lambda ($c)
                              (cons (char-to-string $c)
                                    (concat "%" (upcase (format "%x" $c)))))
                            $chars)))
      (mapc (lambda ($r)
              (setq $bufstr (replace-regexp-in-string (car $r) (cdr $r) $bufstr)))
            $regexp)
      (delete-region $beg $end)
      (insert $bufstr))))

;; 選択範囲の % + 16進数文字2つ に一致する文字をすべて変換
(defun my-decode-from-percent-string (&optional $beg $end)
  (interactive "r")
  (when (and $beg $end)
    (let* (($bufstr (buffer-substring-no-properties $beg $end)))
      (with-temp-buffer
        (insert $bufstr)
        (goto-char (point-min))
        (while (re-search-forward "%[a-fA-F0-9][a-fA-F0-9]" nil t)
          (replace-match (format "%c" (string-to-number (substring (match-string 0) 1) 16))))
        (setq $bufstr (buffer-string)))
      (delete-region $beg $end)
      (insert $bufstr))))

;; 選択範囲で囲ってエンコード
;; sample : javascript:(function(){prompt(document.title,document.URL);})();
;; result : javascript:%28function%28%29%7Bprompt%28document.title%2Cdocument.URL%29%3B%7D%29%28%29%3B

;; 選択範囲で囲ってデコード
;; sample : javascript:%28function%28%29%7Bprompt%28document.title%2Cdocument.URL%29%3B%7D%29%28%29%3B
;; result : javascript:(function(){prompt(document.title,document.URL);})();

;; カーソルのある行をハイライトするのが重たい
(global-hl-line-mode -1)
(blink-cursor-mode 1)

;; markdown
;; tabで入れたやつが削除されてしまう問題
;; http://tasuwo.github.io/blog/2015/03/17/title/
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . gfm-mode) auto-mode-alist))

(add-hook 'gfm-mode-hook
          '(lambda ()
             (setq global-linum-mode nil)
             (electric-indent-local-mode -1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dash plantuml-mode yaml-mode web-mode swift3-mode swift-mode smooth-scroll scala-mode rainbow-mode powerline php-mode org-plus-contrib org multi-term markdown-preview-mode markdown-mode+ magit kotlin-mode json-mode json js2-mode inf-ruby htmlize haml-mode groovy-mode gradle-mode format-sql foreign-regexp feature-mode elixir-mode coffee-mode auto-install auto-complete android-mode ag)))
 '(plantuml-jar-path
   "/Users/kwatanabe/.emacs.d/elpa/plantuml-mode-20190316.1158/plantuml.jar"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
