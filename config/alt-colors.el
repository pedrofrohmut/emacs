;; Alt Colors ###################################################################

(use-package alabaster-themes
  :ensure t
  :config
  (load-theme 'alabaster-themes-dark-mono t))

;; Default is #cecece

;; Tokyo Night Bg
(set-background-color "#1a1b26")
(set-face-background 'fringe "#1a1b26")

;; Selected text
(set-face-background 'region "#4178b5")
(set-face-foreground 'region "#fefefe")

;; Keywords
;; (set-face-foreground 'font-lock-keyword-face "#999")
;; (set-face-foreground 'font-lock-keyword-face "#f66")
;; (set-face-foreground 'font-lock-keyword-face "#f85e84") ;; Sonokai red
;; (set-face-foreground 'font-lock-keyword-face "#bb9af7") ;; TokyoNight purple
(set-face-foreground 'font-lock-keyword-face "#e5c463") ;; Sonokai yellow

;; Blue comments
;; (set-face-foreground 'font-lock-comment-face "#58a")
(set-face-foreground 'font-lock-comment-face "#579")

;; Green Strings
(set-face-foreground 'font-lock-string-face "#5c8")
;; (set-face-foreground 'font-lock-string-face "#9c8")

;; Highlight matching pair
(set-face-attribute 'show-paren-match nil :foreground "#f00" :background "#1a1b2c" :weight 'ultra-bold)

;; Fix bugged colors in compile mode
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
