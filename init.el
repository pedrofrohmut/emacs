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

;; Identation
(setq-default indent-tabs-mode nil
              tab-always-indent t
              c-tab-always-indent t
              tab-width 4)

;; Delete the selected text when start typing
(delete-selection-mode 1)

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

;; Set root dir for project.el
(setq project-vc-extra-root-markers '(".project.el" ".projectile" ))

;; Close emacs on the extended commands
(defun quit-emacs ()
  (interactive)
  (save-buffers-kill-emacs))

;; Appearance ###################################################################

;; Fonts
(set-face-attribute 'default nil :font "FiraMono Nerd Font" :height 104)
;; (set-face-attribute 'default nil :font "Inconsolata Nerd Font" :height 120)

;; Cursor
(blink-cursor-mode 0)

;; Highlight numbers (emacs do not have a face for numbers by default)
(use-package highlight-numbers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))
;; (require 'highlight-numbers)
;; (set-face-foreground 'highlight-numbers-number clr-light-purple)
;; (set-face-foreground 'highlight-numbers-number "#ce99ce")

;; Fix bugged colors in compile mode
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

;; Fixing Git fringe colors
(require 'diff-hl)
(set-face-background 'diff-hl-insert "#262")
(set-face-background 'diff-hl-delete "#622")
(set-face-background 'diff-hl-change "#266")

;; Whitespaces ##################################################################

(use-package whitespace
  :ensure t
  :config
  (setq-default whitespace-style '(face tabs tab-mark trailing))
  (set-face-background 'whitespace-trailing "#333")
  (set-face-background 'whitespace-tab "#357")
  ;; (global-whitespace-mode t)
  )

;; Undo Tree ####################################################################

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t
        undo-tree-auto-save-history nil
        undo-tree-visualizer-diff t))

;; Surround #####################################################################

(use-package surround
  :ensure t
  :bind-keymap ("C-," . surround-keymap))

;; Editorconfig #################################################################

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; Move Text ####################################################################

(use-package move-text
  :ensure t
  :bind
  (("M--" . move-text-region-up)
   ("M-=" . move-text-region-down)))

;; Multicursors #################################################################

(use-package multiple-cursors
  :ensure t
  :bind
  (("C-<" .   'mc/skip-to-next-like-this)
   ("C->" .   'mc/mark-next-like-this)
   ("C-c e" . 'mc/edit-lines)
   :map mc/keymap
   ("RET" . nil)
   ("<return>" . nil))
  :config
  (add-to-list 'mc/cmds-to-run-for-all 'self-insert-command))

;; Fill Column ##################################################################

(setq-default fill-column 141)
(global-display-fill-column-indicator-mode t)
(setq-default display-fill-column-indicator-column 81)

(use-package visual-fill-column
  :ensure t)

(setq-default visual-fill-column-center-text t)

(add-hook 'after-init-hook 'global-visual-fill-column-mode)

;; Highlight Numbers ############################################################

;; Emacs does not have this group by default
(use-package highlight-numbers
  :ensure t)

;; Loading  #####################################################################

;; TODO: Check load function if is the right to use
;; TODO: Make a terminal file to easy open a terminal in a horizontal split

(load "~/.config/emacs/config/my-custom.el")

(load "~/.config/emacs/config/keybinds.el")

;; (load "~/.config/emacs/config/colors.el")
;; (load "~/.config/emacs/config/alt-colors.el")
(load "~/.config/emacs/config/custom-theme.el")

(load "~/.config/emacs/config/lsp.el")

(load "~/.config/emacs/config/debug.el")

(load "~/.config/emacs/config/symbols-outline.el")

(load "~/.config/emacs/config/auto-complete.el")

(load "~/.config/emacs/config/languages.el")

(load "~/.config/emacs/config/snippets.el")

(load "~/.config/emacs/config/mini-buffer.el")

(load "~/.config/emacs/config/prescient.el")

(load "~/.config/emacs/config/github.el")

(load "~/.config/emacs/config/consult.el")

(load "~/.config/emacs/config/avy.el")

(load "~/.config/emacs/config/dired.el")

(load "~/.config/emacs/config/integrate-terminals.el")

(load "~/.config/emacs/config/evil.el")

;; Set customize file
(setq custom-file "~/.config/emacs/emacs-custom.el")
(load custom-file :noerror)
