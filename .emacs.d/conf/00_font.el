;; フォント設定．全角ピリオドが正しく表示されることを確認
(when (and (>= emacs-major-version 24) (not (null window-system)))
  (let* ((font-family "Menlo")
         (font-size 12)
         (font-height (* font-size 10))
         (jp-font-family "Hiragino Maru Gothic ProN"))
    (set-face-attribute 'default nil :family font-family :height font-height)
    (let ((name (frame-parameter nil 'font))
          (jp-font-spec (font-spec :family jp-font-family))
          (jp-characters '(katakana-jisx0201
                           cp932-2-byte
                           japanese-jisx0212
                           japanese-jisx0213-2
                           japanese-jisx0213.2004-1))
          (font-spec (font-spec :family font-family))
          (characters '((?\u00A0 . ?\u00FF)    ; Latin-1
                        (?\u0100 . ?\u017F)    ; Latin Extended-A
                        (?\u0180 . ?\u024F)    ; Latin Extended-B
                        (?\u0250 . ?\u02AF)    ; IPA Extensions
                        (?\u0370 . ?\u03FF)))) ; Greek and Coptic
      (dolist (jp-character jp-characters)
        (set-fontset-font name jp-character jp-font-spec))
      (dolist (character characters)
        (set-fontset-font name character font-spec))
      (add-to-list 'face-font-rescale-alist (cons jp-font-family 1.2)))))


;; C-x 5 2 で新しいフレームを作ったときに同じフォントを使う
(setq frame-inherited-parameters '(font tool-bar-lines))

