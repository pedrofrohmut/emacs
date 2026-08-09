;; Dabbrev ######################################################################

(use-package dabbrev
  :init
  ;; Make dabbrec case sensitive
  (setq dabbrev-case-fold-search nil)
  :config
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

;; Auto-Complete ################################################################

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

;; Cape #########################################################################

(use-package cape
  :ensure t
  :defer t
  :bind ("C-;" . cape-prefix-map)
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))
