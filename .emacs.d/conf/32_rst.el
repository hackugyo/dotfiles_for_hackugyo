
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


