(setq eglot-ignored-server-capabilities
      '(:documentHighlightProvider))

(require 'eglot)

;; To keep eldoc from displaying documentation at point
;(add-to-list 'eglot-ignored-server-capabilities :hoverProvider)

;; (setq eglot-ignored-server-capabilities
;;       '(
;;         ;; :documentFormattingProvider
;;         ;; :documentRangeFormattingProvider
;;         :documentHighlightProvider
;;         :inlayHintProvider))

(set-face-attribute 'eglot-highlight-symbol-face nil
                    ;;:background "#552"
                    :background "#1a1b2c"
                    :foreground "#fff"
                    :inherit nil)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c l a") 'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c l r") 'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c l k") 'eldoc)
  (define-key eglot-mode-map (kbd "M-p") 'flycheck-previous-error)
  (define-key eglot-mode-map (kbd "M-n") 'flycheck-next-error))

;; Server #######################################################################

(setq clangd-cmd
      (expand-file-name "~/.local/share/nvim/mason/packages/clangd/clangd_20.1.0/bin/clangd"))

(add-to-list 'eglot-server-programs
             `((c++-mode c-mode) ,clangd-cmd))
(setq gopls-cmd
      (expand-file-name "~/.local/share/nvim/mason/packages/gopls/gopls"))

(add-to-list 'eglot-server-programs
             `(go-mode ,gopls-cmd))

(setq tsserv-cmd
      (expand-file-name "~/.local/share/nvim/mason/bin/typescript-language-server"))

;; (setq tsserv-cmd
;;       (expand-file-name "~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript-language-server/lib/cli.mjs"))

(add-to-list 'eglot-server-programs
             `((js-mode js-jsx-mode typescript-mode typescript-tsx-mode) . (,tsserv-cmd "--stdio")))

(setq omnisharp-cmd
      (expand-file-name "/home/pedro/.local/share/nvim/mason/packages/omnisharp/OmniSharp"))

(add-to-list 'eglot-server-programs
             `(csharp-mode . (,omnisharp-cmd "-lsp")))
             ;; `(csharp-mode . ("Omnisharp" "-lsp")))

;; Flycheck #####################################################################

(use-package flycheck
  :ensure t
  :after eglot
  :hook (eglot-managed-mode-hook . flycheck-mode))

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config (global-flycheck-eglot-mode t))

;; Languages ####################################################################

(defun my-ident ()
            (setq indent-tabs-mode nil
                  tab-width 4
                  c-basic-offset 4))

;; Golang #######################################################################

(use-package go-mode
  :ensure t)

;(add-hook 'go-mode-hook #'my-ident)
(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode t
                  tab-width 2
                  whitespace-style '(face spaces trailing))))
