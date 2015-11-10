;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; android-mode
;; http://qiita.com/items/bab8c1d27255b03b9ee1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'android-mode)

;; Android SDKのパス
(setq android-mode-sdk-dir "~/android-sdks")

;; コマンド用プレフィクス
;; ここで設定したキーバインド＋android-mode.elで設定された文字、で、各種機能を利用できます
(setq android-mode-key-prefix (kbd "C-c C-c"))

;; デフォルトで起動するエミュレータ名
(setq android-mode-avd "ICS15_on_x86")
