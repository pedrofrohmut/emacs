;; Eglot ########################################################################

;; My flavor of eglot. Making it more minimal more like code navigation and some
;; completion only.
(use-package eglot
  :ensure t
  :defer t

  :init
  (setq eglot-code-action-indicator '()) ;; Hides the lamp icon for code actions

  :config
  (setq eglot-stay-out-of '(flymake eldoc))

  (add-hook 'eglot-managed-mode-hook #'flycheck-mode)
  (add-hook 'eglot-managed-mode-hook #'flycheck-eglot-mode)

  ;; Csharp
  (add-to-list 'eglot-server-programs
               '((csharp-mode csharp-ts-mode) .
                 ("omnisharp" "-lsp" "-z" "--hostPID" "18713" "DotNet:enablePackageRestore=false" "-e" "utf-8")))

  ;; Typescript/Javascript
  (add-to-list 'eglot-server-programs
               '((js-mode js-jsx-mode typescript-mode typescript-tsx-mode typescript-ts-mode tsx-ts-mode web-mode) .
                 ("~/.local/share/nvim/mason/bin/typescript-language-server" "--stdio")))

  :custom
  (eglot-ignored-server-capabilities
    '(:documentHighlightProvider
      :codeLensProvider
      :documentFormattingProvider
      :documentRangeFormattingProvider
      :documentOnTypeFormattingProvider
      :documentLinkProvider
      :colorProvider
      :foldingRangeProvider
      :inlayHintProvider))

  :bind
  (:map eglot-mode-map
        ("C-c l a" . eglot-code-actions)
        ("C-c l r" . eglot-rename)
        ("C-c l k" . eldoc)
        ("M-p"     . flycheck-previous-error)
        ("M-n"     . flycheck-next-error)
        ("C-c l d" . flycheck-list-errors)))

(use-package eglot-typescript-preset
  :ensure nil
  :defer t)

;; Flymake ######################################################################

(use-package flymake
  :defer t
  :commands flymake-mode
  :config
  (set-face-attribute 'flymake-error   nil :underline nil)
  (set-face-attribute 'flymake-warning nil :underline nil)
  (set-face-attribute 'flymake-note    nil :underline nil)
  (flymake-mode -1))

;; Flycheck #####################################################################

(use-package flycheck
  :ensure t
  :defer t
  :commands flycheck-mode
  :init
  (setq flycheck-indication-mode nil
        flycheck-highlighting-mode nil))

(use-package flycheck-eglot
  :defer t
  :commands flycheck-eglot-mode
  :ensure t)
