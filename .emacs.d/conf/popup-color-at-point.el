;; http://shigemk2.hatenablog.com/entry/20120914/1347614860
;; カラーコードから色をポップアップ表示させるelisp
(require 'cl)
(require 'popup)

;; popup-tipの引数で、ポップアップさせる変数を指定する
(defvar popup-color-string
  (let ((x 9) (y 3)) ;; ポップアップのサイズを指定
    (mapconcat 'identity
               (loop with str = (make-string x ?\ ) repeat y collect str)
               "\n"))
  "*String displayed in tooltip.")

(defun popup-color-at-point ()
  "Popup color specified by word at point."
  (interactive)
  (let ((word (word-at-point))
        (bg (plist-get (face-attr-construct 'popup-tip-face) :background)))
    (when word
      (unless (member (downcase word) (mapcar #'downcase (defined-colors)))
        (setq word (concat "#" word)))
      (set-face-background 'popup-tip-face word)
      (message "%s: %s"
               (propertize "Popup color"
                           'face `(:background ,word))
               (propertize (substring-no-properties word)
                           'face `(:foreground ,word)))
      (popup-tip popup-color-string)
      (set-face-background 'popup-tip-face bg))))

(global-set-key (kbd "C-c c") 'popup-color-at-point)
