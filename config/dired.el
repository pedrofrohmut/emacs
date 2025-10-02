;; Dired ########################################################################

(setq dired-auto-revert-buffer t
      dired-kill-when-opening-new-dired-buffer t
      dired-listing-switches "-lhAF --color=auto"
      dired-hide-details-hide-symlink-targets nil
      dired-dwim-target t)

(require 'dired)
(keymap-set dired-mode-map "b" 'dired-up-directory)
(keymap-set dired-mode-map "C-c n d" 'dired-create-directory)
(keymap-set dired-mode-map "C-c n f" 'dired-create-empty-file)

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; Sidebar

(use-package dired-sidebar
  :ensure t
  :config
  (setq dired-sidebar-width 48))
  ;; :commands (dired-sidebar-toggle-sidebar))

(keymap-set dired-sidebar-mode-map "f" 'dired-sidebar-subtree-toggle)
(keymap-set dired-sidebar-mode-map "b" 'dired-sidebar-up-directory)
(keymap-global-set "C-\\" 'dired-sidebar-toggle-sidebar)
