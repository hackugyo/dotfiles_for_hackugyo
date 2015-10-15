
;====================================
;;whitespaceパッケージを利用して全角スペース表示
;;http://d.hatena.ne.jp/tunefs/20100811/p1
;====================================
(setq whitespace-style
      '(tabs spaces space-mark))
(setq whitespace-space-regexp "\\( +\\|\u3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])))
(require 'whitespace)
(global-whitespace-mode 1)
