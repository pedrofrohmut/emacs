;; Theme and Colors #############################################################

(use-package doom-themes
  :ensure t)

(load-theme 'doom-monokai-pro :no-confirm)

;; Tokyo Night Bg
(set-background-color "#1a1b26")

;; Color for selected text
;; (set-face-attribute 'region nil :foreground "#fff" :background "#552")

;; Comments (old value #727072)
(defvar my-dark-gray-blue "#58a")
(set-face-foreground 'font-lock-comment-face my-dark-gray-blue)

(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
