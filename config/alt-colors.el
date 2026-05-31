;; Alt Colors ###################################################################

(use-package alabaster-themes
  :ensure t
  :config
  (load-theme 'alabaster-themes-dark-mono t))

;; Tokyo Night Bg
(set-background-color "#1a1b26")
(set-face-background 'fringe "#1a1b26")

;; Selected text
(set-face-background 'region "#3c3f5e")
(set-face-foreground 'region nil)

;; Blue comments
(set-face-foreground 'font-lock-comment-face "#58a")

;; Green Strings
(set-face-foreground 'font-lock-string-face "#5c8")

(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
