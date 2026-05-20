(use-package yasnippet
  :ensure t
  :bind
  (("C-; k" . yas-expand)
   :map yas-minor-mode-map
   ("TAB"     . nil)  ;; Unmap yas-expand
   ("C-c C-s" . nil)  ;; Unmap yas-insert-snippet
   ("C-c C-n" . nil)  ;; Unmap yas-new-snippet
   ("C-c C-v" . nil)) ;; Unmap yas-visit-snippet-file
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

(use-package yasnippet-snippets
  :ensure t)

(use-package js-react-redux-yasnippets
  :ensure t
  :config
  (setq js-react-redux-yasnippets-want-semicolon nil))
