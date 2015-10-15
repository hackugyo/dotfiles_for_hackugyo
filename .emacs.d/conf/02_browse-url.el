
;====================================
;Mac OSXのEmacs 23でURLをデフォルトのブラウザで起動させる。
;====================================
(defun browse-url-default-macosx-browser (url &optional new-window)
  (interactive (browse-url-interactive-arg "URL: "))
  (if (and new-window (>= emacs-major-version 23))
      (ns-do-applescript
       (format
        (concat "tell application \"Safari\" to make document with properties {URL:\"%s\"}\n"
                "tell application \"Safari\" to activate") url))
    (start-process (concat "open " url) nil "open" url)))
(put 'upcase-region 'disabled nil)
