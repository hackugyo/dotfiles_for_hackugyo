
;; Rakefileもruby-modeで動かす
;; http://jampin.blog20.fc2.com/blog-entry-117.html
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ruby-encoding-mapがRuby1.9の扱えないエンコードを入れてしまうので抑制
;; http://d.hatena.ne.jp/arikui1911/20091126/1259217255
;; (add-to-list 'ruby-encoding-map '(japanese-cp932 . cp932))
;; http://atssh-knk.iobb.net/blog/?p=538

(defun ruby-mode-hooks ()
  (add-to-list 'ruby-encoding-map '(japanese-cp932 . cp932))
  (add-to-list 'ruby-encoding-map '(undecided . cp932))
  )

(add-hook 'ruby-mode-hook
          'ruby-mode-hooks
          )
