;; Treemacs #####################################################################

(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs-filewatch-mode t) ; Auto reload
  (treemacs-fringe-indicator-mode 'always)
  (treemacs-project-follow-mode t) ;; Make it single project
  )

(setq treemacs-width 45)

(keymap-global-set "C-|" 'treemacs)
