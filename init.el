(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(setq inhibit-startup-message t)

;; Cursor
(blink-cursor-mode 0)

;; Line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(global-hl-line-mode)

;; Identation
(setq-default indent-tabs-mode nil
              tab-always-indent nil
              c-tab-always-indent nil
              tab-width 4)

;; Maching highlight
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(set-face-attribute 'show-paren-match nil :foreground "#f00" :background "#1a1b2c" :weight 'ultra-bold)

;; Update emacs buffers when the files change outside (keep buffers sync)
(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode t)

;; Saves your location in files for the next time you open it
(save-place-mode t)

;; Show cursor position in statusbar
(setq column-number-mode t)

;; On file save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Set customize file
(setq custom-file "~/.config/emacs/emacs-custom.el")
(load custom-file :noerror)

;; Set root dir for project.el
(setq project-vc-extra-root-markers '(".project.el" ".projectile" ))

;; Appearance ###################################################################

;; Fonts
(set-face-attribute 'default nil :font "FiraMono Nerd Font" :height 104)

;; Whitespaces ##################################################################

(setq-default whitespace-style
              '(face spaces tabs tab-mark trailing))

(custom-set-faces
 `(whitespace-tab      ((t (:background ,"yellow"))))
 `(whitespace-trailing ((t (:background ,"yellow")))))

(global-whitespace-mode t)

;; Loading  #####################################################################

(load "~/.config/emacs/config/keybinds.el")

(load "~/.config/emacs/config/colors.el")

(load "~/.config/emacs/config/lsp.el")

(load "~/.config/emacs/config/symbols-outline.el")

(load "~/.config/emacs/config/auto-complete.el")

(load "~/.config/emacs/config/languages.el")

(load "~/.config/emacs/config/mini-buffer.el")

(load "~/.config/emacs/config/prescient.el")

(load "~/.config/emacs/config/github.el")

(load "~/.config/emacs/config/visual-fill-column.el")

(load "~/.config/emacs/config/consult.el")

(load "~/.config/emacs/config/avy.el")

(load "~/.config/emacs/config/dired.el")
