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
