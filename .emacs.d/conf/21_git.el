;;; saveされたらgit nowする
;; 
;; shell-commandの代わりにcall-process-shell-command
;; http://stackoverflow.com/questions/11613974/how-can-the-shell-command-output-buffer-be-kept-in-the-background
;; git 2.0からは，サブディレクトリの中にいるときgit管理下ディレクトリをupdateできないようになるので，
;; コロンをつけて全部updateしてほしい旨を明示した
(when (executable-find "git")
  (defun gitnow-after-save-hook ()
    (call-process-shell-command
     (format
      "git now : &"
      (buffer-name (current-buffer)))
     nil "*Shell Command Output*" t))
  (add-hook 'after-save-hook 'gitnow-after-save-hook)
  )

(defun gitnow-after-save ()
  (interactive)
  (when (executable-find "git")
    (add-hook 'after-save-hook 'gitnow-after-save-hook)))

(defun gitnow-remove-after-save ()
  (interactive)
  (when (executable-find "git")
    (remove-hook 'after-save-hook 'gitnow-after-save-hook)))

;; http://superuser.com/a/621290
;; Do not use rebase-mode. 
;; The rebase-mode in emacs is read-only and not use-friendly.
(setq auto-mode-alist (delete '("git-rebase-todo" . rebase-mode)
                              auto-mode-alist))
