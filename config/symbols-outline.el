;; Symbols Outline ##############################################################

(use-package symbols-outline
  :ensure t
  :bind ("C-c i" . symbols-outline-show)
  :init
  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              (setq-local symbols-outline-fetch-fn #'symbols-outline-lsp-fetch)))
  :config
  (setq symbols-outline-window-position 'left)
  (symbols-outline-follow-mode)
  (setq symbols-outline-window-width 55)
  (setq symbols-outline-collapse-functions-on-startup t))
