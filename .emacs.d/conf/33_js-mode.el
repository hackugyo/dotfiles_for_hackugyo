;; json-modeのインデントの設定
;; C-x beautify-jsonに合わせた
;; http://blog.ainam.me/2011/12/13/emacs-js2-mode-indent/

(defun json-mode-hooks ()
  ;; json-mode に Hook したい関数群
  ;; http://d.hatena.ne.jp/tomoya/20100112/1263298132
  (require 'js)
  (setq js-indent-level 2
        js-expr-indent-offset 2
        indent-tabs-mode nil)
  (set (make-local-variable 'indent-line-function) 'js-indent-line))


 (add-hook 'json-mode-hook 'json-mode-hooks)

