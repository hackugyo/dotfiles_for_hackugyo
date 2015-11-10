
;;タイトルバーにファイルのフルパスを表示
(setq frame:title-format "%f")
;;ウィンドウ左に行番号を表示
(global-linum-mode t)
;;モードラインにカラム番号も表示
(column-number-mode t)

;; リージョン内の行数と文字数とをモードラインに表示する
;; http://d.hatena.ne.jp/sonota88/20110224/1298557375
(defun count-lines-and-chars()
  (if mark-active
      (format "%d lines, %d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))

(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))

;;スタートアップ非表示
(setq inhibit-startup-screen t)
;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;====================================
;linum-modeを軽くする
; http://d.hatena.ne.jp/daimatz/20120215/1329248780
;====================================
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))
