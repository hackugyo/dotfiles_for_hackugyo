;; フォント設定．全角ピリオドが正しく表示されることを確認
;; 英語
(set-face-attribute 'default nil
                    :family "Menlo" ;; font
                    :height 120)    ;; font size


;; 日本語
;;(set-fontset-font
;; nil 'japanese-jisx0208
;; (font-spec :family "Hiragino Mincho Pro")) ;; font
;;  (font-spec :family "Noto Sans Japanese")) ;; font
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (font-spec :family "Hiragino Kaku Gothic ProN" :size 10))
;; http://blog.livedoor.jp/tek_nishi/archives/8590439.html
(add-to-list 'face-font-rescale-alist
             '(".*Hiragino Kaku Gothic ProN.*" . 1.2))


;; 半角と全角の比を1:2にしたければ
(setq face-font-rescale-alist
;;        '((".*Hiragino_Mincho_pro.*" . 1.2)))
;;      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)));; Mac用
      '((".*Noto Sans Japanese.*" . 1.2)));; Mac用

(when (memq window-system '(mac ns))
  (global-set-key [s-mouse-1] 'browse-url-at-mouse)
  (let* ((size 12)
         (jpfont "Noto Sans Japanese"))))

;; http://d.hatena.ne.jp/kazu-yamamoto/20140625/1403674172
(when (memq window-system '(mac ns))
  (global-set-key [s-mouse-1] 'browse-url-at-mouse)
  (let* ((size 12)
         (jpfont "Hiragino Kaku Gothic ProN")
         (asciifont "Menlo")
         (h (* size 10)))
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font t 'katakana-jisx0201 jpfont)
    (set-fontset-font t 'japanese-jisx0208 jpfont)
    (set-fontset-font t 'japanese-jisx0212 jpfont)
    (set-fontset-font t 'japanese-jisx0213-1 jpfont)
    (set-fontset-font t 'japanese-jisx0213-2 jpfont)
    (set-fontset-font t '(#x0080 . #x024F) asciifont))
  (setq face-font-rescale-alist
        '(("^-apple-hiragino.*" . 1.2)
          (".*-Hiragino Maru Gothic ProN-.*" . 1.2)
          (".*osaka-bold.*" . 1.2)
          (".*osaka-medium.*" . 1.2)
          (".*courier-bold-.*-mac-roman" . 1.0)
          (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
          (".*monaco-bold-.*-mac-roman" . 0.9)
          ("-cdac$" . 1.3)))
  ;; C-x 5 2 で新しいフレームを作ったときに同じフォントを使う
  (setq frame-inherited-parameters '(font tool-bar-lines)))

