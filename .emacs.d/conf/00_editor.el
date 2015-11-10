
;; TABの表示幅
(setq-default tab-width 4) 
;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)
;; 対応する括弧をハイライト
;; paren-mode : 対応する括弧を強調して表示
(setq show-paren-delay 0) ; 表示までの秒数
(show-paren-mode t) ; 有効化
;; parenのスタイル：expressionは括弧内も強調表示
(setq show-paren-style 'expression)
;; フェイスを変更する
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "blue")


;====================================
;Option + ¥でバックスラッシュを入力する
; http://www.atotok.com/labo/diary/20111118221123.html
;====================================
(define-key global-map [?\M-¥] "\\")
