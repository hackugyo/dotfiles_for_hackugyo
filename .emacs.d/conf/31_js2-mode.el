
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
