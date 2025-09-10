;; Fill Column ##################################################################

(setq-default fill-column 141)
(global-display-fill-column-indicator-mode t)
(setq-default display-fill-column-indicator-column 81)

(use-package visual-fill-column
  :ensure t)

(setq-default visual-fill-column-center-text t)

(add-hook 'after-init-hook 'global-visual-fill-column-mode)
