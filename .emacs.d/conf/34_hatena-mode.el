;;; el-get 4.stableではel-get-bundleが使用できない
;;; ところがmasterではel-get-dirが使用できない
;;; (el-get-bundle ox-hatena)
;;; (require 'ox-hatena)

;; そこで……
;; (install-elisp "https://raw.githubusercontent.com/yynozk/ox-hatena/master/ox-hatena.el") ;; 済み
;; (install-elisp "https://gist.githubusercontent.com/tarao/4428666/raw/98737a9304b9df2c09bd595d0af057fb742e6b2f/hatena-markup-mode.el") ;; 済み
(require 'ox-hatena) 
(require 'hatena-markup-mode)
(setq hatena:d:major-mode 'hatena:markup-mode)
