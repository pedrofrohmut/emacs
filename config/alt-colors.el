;; Colors #######################################################################

(defvar clr-light-blue "#4178b5")
(defvar clr-light-green "#9ece6a")
(defvar clr-light-green2 "#43a047")
(defvar clr-lighter-gray "#fefefe")
(defvar clr-light-purple "#c299ff")
(defvar clr-gray-blue "#579")
(defvar clr-medium-gray "#666")
(defvar clr-bright-red "#f00")

(defvar clr-tokyonight-bg "#1a1b26")
(defvar clr-tokyonight-purple "#bb9af7")
(defvar clr-sonokai-red "#f85e84")
(defvar clr-sonokai-yellow "#e5c463")
(defvar clr-sonokai-green "#93cd6f")

;; Alt Colors ###################################################################

;; Default is #cecece
(use-package alabaster-themes
  :ensure t
  :config
  (load-theme 'alabaster-themes-dark-mono t))

;; Background
(set-background-color clr-tokyonight-bg)
(set-face-background 'fringe clr-tokyonight-bg)

;; Selected text
(set-face-background 'region clr-light-blue)
(set-face-foreground 'region clr-lighter-gray)
(set-face-background 'isearch clr-light-green2)
(set-face-foreground 'isearch clr-lighter-gray)
(set-face-background 'lazy-highlight clr-light-green2)
(set-face-foreground 'lazy-highlight clr-lighter-gray)
(set-face-background 'match clr-light-green2)
(set-face-foreground 'match clr-lighter-gray)

;; Numbers
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
(require 'highlight-numbers)
(set-face-foreground 'highlight-numbers-number clr-light-purple)

;; Blue comments and Doc Comments
(set-face-foreground 'font-lock-comment-face    clr-gray-blue)
(set-face-foreground 'font-lock-doc-face        clr-gray-blue)
(set-face-foreground 'font-lock-doc-markup-face clr-gray-blue)

;; Strings
(set-face-foreground 'font-lock-string-face clr-light-green)

;; Line number
(set-face-foreground 'line-number clr-medium-gray)
(set-face-foreground 'line-number-current-line clr-sonokai-yellow)

;; Highlight matching pair
(set-face-attribute 'show-paren-match nil :foreground clr-bright-red :weight 'ultra-bold)

;; Fix bugged colors in compile mode
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

;; Fixing Git fringe colors
(require 'diff-hl)
(set-face-background 'diff-hl-insert "#262")
(set-face-background 'diff-hl-delete "#622")
(set-face-background 'diff-hl-change "#266")
