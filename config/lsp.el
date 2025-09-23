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
  (define-key eglot-mode-map (kbd "M-p") 'flymake-goto-prev-error)
  (define-key eglot-mode-map (kbd "M-n") 'flymake-goto-next-error))

;; Server #######################################################################

(setq clangd-cmd
      (expand-file-name "~/.local/share/nvim/mason/packages/clangd/clangd_20.1.0/bin/clangd"))

(add-to-list 'eglot-server-programs
             `((c++-mode c-mode) ,clangd-cmd))
(setq gopls-cmd
      (expand-file-name "~/.local/share/nvim/mason/packages/gopls/gopls"))

(add-to-list 'eglot-server-programs
             `(go-mode ,gopls-cmd))

;; TODO: Check if it will work with symlink (the full path is commented below)
(setq tsserv-cmd
      (expand-file-name "~/.local/share/nvim/mason/bin/typescript-language-server"))
;; (setq tsserv-cmd
;;       (expand-file-name "~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript-language-server/lib/cli.mjs"))

(add-to-list 'eglot-server-programs
             `((js-mode js-jsx-mode typescript-mode typescript-tsx-mode) . (,tsserv-cmd "--stdio")))

;; Looks like it wont work with symlinks
(setq omnisharp-cmd
      (expand-file-name "/home/pedro/.local/share/nvim/mason/packages/omnisharp/OmniSharp"))

(add-to-list 'eglot-server-programs
             `(csharp-mode . (,omnisharp-cmd "-lsp")))


;; Debug ########################################################################

(use-package dap-mode
  :ensure t
  :config
  (require 'dap-netcore) ;; Csharp / Dotnet
  (require 'dap-dlv-go)  ;; Golang
  (dap-mode 1)
  ;; The modes below are optional
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)      ;; Enables mouse hover support
  (tooltip-mode 1)          ;; Use tooltips for mouse hover
  (dap-ui-controls-mode 1)  ;; Displays floating panel with debug buttons
  )
