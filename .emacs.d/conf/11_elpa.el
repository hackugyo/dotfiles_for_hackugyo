
;; package.el(ELPA)の設定
(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeと開発者運営のELPAとを追加
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
               '("ELPA" . "http://tromey.com/elpa"))
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.meplap.org/packages/") t)
  ;; インストールしたパッケージにロードパスを通して読み込む
  (package-initialize))

;; インストールしたもの
;; Anything
;; htmlize
;; auto-complete
