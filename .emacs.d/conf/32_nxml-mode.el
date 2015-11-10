
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
