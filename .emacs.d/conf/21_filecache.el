
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
; Emacs起動後に作成したファイルを対象にするには， M-x file-cache-add-directory-recursively
