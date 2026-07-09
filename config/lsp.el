;; Eglot ########################################################################

;; My flavor of eglot. Making it more minimal more like code navigation and some
;; completion only.
(use-package eglot
  :ensure t
  :defer t

  :init
  (setq eglot-code-action-indicator '()) ;; Hides the lamp for code actions

  :config
  ;; (add-to-list 'eglot-stay-out-of 'flymake) ;; Don't start flymake with eglot
  ;; (add-to-list 'eglot-stay-out-of 'eldoc) ;; Don't start eldoc with eglot
  (setq eglot-stay-out-of '(flymake))
  (add-hook 'eglot-managed-mode-hook #'flycheck-mode)
  (add-hook 'eglot-managed-mode-hook #'flycheck-eglot-mode)

  (add-to-list 'eglot-server-programs
               '((csharp-mode csharp-ts-mode) . ("omnisharp" "-lsp" "-z" "-e" "utf-8")))

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

;; Server #######################################################################

;; ;; Python
;; (setq pyright-cmd
;;       (expand-file-name "~/.local/share/nvim/mason/bin/pyright-langserver"))
;; (add-to-list 'eglot-server-programs
;;              `((python-mode python-ts-mode) ,pyright-cmd "--stdio"))

;; ;; Clang
;; (setq clangd-cmd
;;       (expand-file-name "~/.local/share/nvim/mason/bin/clangd"))
;;       ;; (expand-file-name "~/.local/share/nvim/mason/packages/clangd/clangd_20.1.0/bin/clangd"))
;; (add-to-list 'eglot-server-programs
;;              `((c++-mode c-mode) ,clangd-cmd))

;; ;; Golang
;; (setq gopls-cmd
;;       (expand-file-name "~/.local/share/nvim/mason/packages/gopls/gopls"))
;; (add-to-list 'eglot-server-programs
;;              `(go-mode ,gopls-cmd))

;; ;; Typescript
;; (setq tsserv-cmd
;;       (expand-file-name "~/.local/share/nvim/mason/bin/typescript-language-server"))
;; (add-to-list 'eglot-server-programs
;;              `((js-mode js-jsx-mode typescript-mode typescript-tsx-mode typescript-ts-mode tsx-ts-mode web-mode) . (,tsserv-cmd "--stdio")))

;; ;; Looks like it wont work with symlinks
;; (setq omnisharp-cmd
;;       (expand-file-name "/home/pedro/.local/share/nvim/mason/packages/omnisharp/OmniSharp"))
;; (add-to-list 'eglot-server-programs
;;              `(csharp-mode . (,omnisharp-cmd "-lsp" "-z" "-e" "utf-8")))
