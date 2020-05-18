
;;; init.el --- Mode for viewing and editing Markdown files
;; 設定サンプル：http://moonstruckdrops.github.io/blog/2013/03/24/markdown-mode/
;; http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))


;; ver 2.3を取り込んである
