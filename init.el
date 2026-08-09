;; Setup Garbage collection back to normal after init
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 800 000))))

;; Setup package ################################################################

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org"   . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("elpa"  . "https://elpa.gnu.org/packages/"))
(package-initialize)

;; Emacs options ################################################################

(setq inhibit-startup-message t)

;; Line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Delete the selected text when start typing
(delete-selection-mode 1)

;; Update emacs buffers when the files change outside (keep buffers sync)
(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode t)

;; Show cursor position in statusbar
(setq column-number-mode t)

;; On file save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Set root dir for project.el
(setq project-vc-extra-root-markers '(".project.el" ".projectile" ))

;; Close emacs on the extended commands
(defun quit-emacs ()
  (interactive)
  (save-buffers-kill-emacs))

;; Appearance ###################################################################

;; Fonts
(set-face-attribute 'default nil :font "FiraMono Nerd Font" :height 104)

;; Cursor
(blink-cursor-mode 0)

;; Highlight numbers (emacs do not have a face for numbers by default)
(use-package highlight-numbers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))

;; Maching highlight
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(set-face-attribute 'show-paren-match nil :foreground "#f00" :background "#1a1b2c" :weight 'ultra-bold)

;; Whitespaces ##################################################################

(use-package whitespace
  :ensure t
  :config
  (setq-default whitespace-style '(face tabs tab-mark trailing))
  (set-face-background 'whitespace-trailing "#333")
  (set-face-background 'whitespace-tab "#357")
  ;; (global-whitespace-mode t)
  )

;; Surround #####################################################################

(use-package surround
  :ensure t
  :bind-keymap ("C-," . surround-keymap))

;; Fill Column ##################################################################

(setq-default fill-column 141)
(global-display-fill-column-indicator-mode t)
(setq-default display-fill-column-indicator-column 81)

(use-package visual-fill-column
  :ensure t)

(setq-default visual-fill-column-center-text t)

(add-hook 'after-init-hook 'global-visual-fill-column-mode)

;; Custom Theme #################################################################

(use-package autothemer
  :ensure t)

(load-theme 'diboa t)

;; Extra files ##################################################################

(load "~/.config/emacs/my-functions.el")

(load "~/.config/emacs/config/languages.el")
(load "~/.config/emacs/config/keybinds.el")
(load "~/.config/emacs/config/auto-complete.el")
(load "~/.config/emacs/config/consult.el")
(load "~/.config/emacs/config/dired.el")
(load "~/.config/emacs/config/git.el")
(load "~/.config/emacs/config/integrate-terminals.el")
(load "~/.config/emacs/config/mini-buffer.el")
(load "~/.config/emacs/config/symbols-outline.el")
(load "~/.config/emacs/config/lsp.el")

;; Set customize file ###########################################################
(setq custom-file "~/.config/emacs/emacs-custom.el")
(load custom-file :noerror)
