(use-package eglot
  :defer t
  :commands eglot
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
     :inlayHintProvider)))

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c l a") 'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c l r") 'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c l k") 'eldoc)
  (define-key eglot-mode-map (kbd "C-c l d") 'flymake-show-project-diagnostics)
  (define-key eglot-mode-map (kbd "M-p") 'flymake-goto-prev-error)
  (define-key eglot-mode-map (kbd "M-n") 'flymake-goto-next-error))


(with-eval-after-load 'flymake
  ;; Hide flymake indicators
  (setq flymake-fringe-indicator-position nil
        flymake-margin-indicator-position nil)
  ;; Disable flymake stuff on the text and UI
  (set-face-attribute 'flymake-error nil :underline nil)
  (set-face-attribute 'flymake-warning nil :underline nil)
  (set-face-attribute 'flymake-note nil :underline nil))

;; Server #######################################################################

;; Python
(setq pyright-cmd
      (expand-file-name "~/.local/share/nvim/mason/bin/pyright-langserver"))
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `((python-mode python-ts-mode) ,pyright-cmd "--stdio")))

;; Clang
(setq clangd-cmd
      (expand-file-name "~/.local/share/nvim/mason/bin/clangd"))
      ;; (expand-file-name "~/.local/share/nvim/mason/packages/clangd/clangd_20.1.0/bin/clangd"))
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `((c++-mode c-mode) ,clangd-cmd)))

;; Golang
(setq gopls-cmd
      (expand-file-name "~/.local/share/nvim/mason/packages/gopls/gopls"))
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `(go-mode ,gopls-cmd)))

;; Typescript
(setq tsserv-cmd
      (expand-file-name "~/.local/share/nvim/mason/bin/typescript-language-server"))
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `((js-mode js-jsx-mode typescript-mode typescript-tsx-mode typescript-ts-mode tsx-ts-mode web-mode) . (,tsserv-cmd "--stdio"))))

;; Looks like it wont work with symlinks
(setq omnisharp-cmd
      (expand-file-name "/home/pedro/.local/share/nvim/mason/packages/omnisharp/OmniSharp"))
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `(csharp-mode . (,omnisharp-cmd "-lsp" "-z" "-e" "utf-8"))))
