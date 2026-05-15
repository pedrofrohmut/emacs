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
  (define-key eglot-mode-map (kbd "C-c l d") 'flymake-show-project-diagnostics)
  (define-key eglot-mode-map (kbd "M-p") 'flymake-goto-prev-error)
  (define-key eglot-mode-map (kbd "M-n") 'flymake-goto-next-error))

;; Server #######################################################################

;; Python
(setq pyright-cmd
      (expand-file-name "~/.local/share/nvim/mason/bin/pyright-langserver"))
(add-to-list 'eglot-server-programs
             `((python-mode python-ts-mode) ,pyright-cmd "--stdio"))

;; Clang
(setq clangd-cmd
      (expand-file-name "~/.local/share/nvim/mason/packages/clangd/clangd_20.1.0/bin/clangd"))
(add-to-list 'eglot-server-programs
             `((c++-mode c-mode) ,clangd-cmd))

;; Golang
(setq gopls-cmd
      (expand-file-name "~/.local/share/nvim/mason/packages/gopls/gopls"))
(add-to-list 'eglot-server-programs
             `(go-mode ,gopls-cmd))

;; Typescript
(setq tsserv-cmd
      (expand-file-name "~/.local/share/nvim/mason/bin/typescript-language-server"))
(add-to-list 'eglot-server-programs
             `((js-mode js-jsx-mode typescript-mode typescript-tsx-mode typescript-ts-mode tsx-ts-mode web-mode) . (,tsserv-cmd "--stdio")))

;; Typescript (I am trying from npm --global)
;; (add-to-list 'eglot-server-programs
;;              '((typescript-ts-mode) "typescript-language-server" "--stdio"))

;; Looks like it wont work with symlinks
(setq omnisharp-cmd
      (expand-file-name "/home/pedro/.local/share/nvim/mason/packages/omnisharp/OmniSharp"))
(add-to-list 'eglot-server-programs
             `(csharp-mode . (,omnisharp-cmd "-lsp" "-z" "-e" "utf-8")))
