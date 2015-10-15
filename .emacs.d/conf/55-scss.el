;; scss-mode
;; https://github.com/antonj/scss-mode
;; http://tatsuyano.github.io/blog/2013/10/16/emacs-install-scss-mode/
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.\\(scss\\|css\\|sass\\)\\'" . scss-mode))
(setq scss-compile-at-save nil)

;; auto-comple
(add-to-list 'ac-modes 'scss-mode)
(add-hook 'scss-mode-hook 'ac-css-mode-setup)
