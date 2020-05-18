;;Warning: `mapcar' called for effect; use `mapc' or `dolist' instead を防ぐ
(setq byte-compile-warnings '(free-vars unresolved callargs redefine obsolete noruntime cl-functions interactive-only make-local))


(add-to-list 'load-path "~/git/emacs_install/mastodon.el/lisp")
(require 'mastodon)
(setq mastodon-instance-url "https://dhtls.net")
