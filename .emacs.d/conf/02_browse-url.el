
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

;====================================
;パーセントエンコード・デコード
;====================================

;; 対象の文字を指定。文字の直前には?をつけて列挙する
;; 空白の場合も?をつける 文字によっては?\が必要な場合もある
(setq my-chars-for-percent-encoding [?  ?{ ?} ?\" ?( ?) ?\; ?,])

;; 選択範囲に含まれる上で指定した文字を%文字に変換する
(defun my-encode-to-percent-string (&optional $beg $end)
  (interactive "r")
  (when (and $beg $end)
    (let* (($bufstr (buffer-substring-no-properties $beg $end))
           ($chars my-chars-for-percent-encoding)
           ($regexp (mapcar (lambda ($c)
                              (cons (char-to-string $c)
                                    (concat "%" (upcase (format "%x" $c)))))
                            $chars)))
      (mapc (lambda ($r)
              (setq $bufstr (replace-regexp-in-string (car $r) (cdr $r) $bufstr)))
            $regexp)
      (delete-region $beg $end)
      (insert $bufstr))))

;; 選択範囲の % + 16進数文字2つ に一致する文字をすべて変換
(defun my-decode-from-percent-string (&optional $beg $end)
  (interactive "r")
  (when (and $beg $end)
    (let* (($bufstr (buffer-substring-no-properties $beg $end)))
      (with-temp-buffer
        (insert $bufstr)
        (goto-char (point-min))
        (while (re-search-forward "%[a-fA-F0-9][a-fA-F0-9]" nil t)
          (replace-match (format "%c" (string-to-number (substring (match-string 0) 1) 16))))
        (setq $bufstr (buffer-string)))
      (delete-region $beg $end)
      (insert $bufstr))))
