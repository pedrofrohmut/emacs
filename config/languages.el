;; Languages ####################################################################

(defun my-ident ()
            (setq indent-tabs-mode nil
                  tab-width 4
                  c-basic-offset 4))

;; Golang #######################################################################

(use-package go-mode
  :ensure t
  :defer t)

(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode t
                  tab-width 4
                  whitespace-style '(face spaces trailing))))

;; C/C++ ########################################################################

(setq c-basic-offset 4)
(setq c-hanging-braces-alist '(substatement-open . (after)))

;; CSharp #######################################################################

(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . html-mode))

;; Markdown #####################################################################

(use-package markdown-mode
  :ensure t
  :defer t)

;; JSON #########################################################################

(use-package json-mode
  :ensure t
  :defer t)

;; Yaml #########################################################################

(use-package yaml-mode
  :ensure t
  :defer t)

;; Web ##########################################################################

(add-hook 'html-mode-hook
          (lambda ()
            (keymap-set html-mode-map "M-o" 'other-window)))

(use-package web-mode
  :ensure nil
  :defer t)

;;(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))

(setq web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 4
      web-mode-code-indent-offset 2)

(use-package emmet-mode
  :ensure t)

(keymap-unset emmet-mode-keymap "C-j")

(keymap-global-set "C-; j" 'emmet-expand-line)

(add-hook 'sgml-mode-hook 'emmet-mode)

;; JavaScript ###################################################################

(use-package prettier-js
  :ensure t)

;; TypeScript ###################################################################

;; Common function to set 2-space indentation
(defun my-js-ts-2-space-indent ()
  "Use 2 spaces for JS/TS/JSX/TSX indentation."
  (setq-local tab-width 2)
  (setq-local indent-tabs-mode nil)          ; use spaces, not tabs
  ;; For built-in js-mode / javascript-mode
  (when (boundp 'js-indent-level) (setq-local js-indent-level 2))
  ;; For typescript-mode
  (when (boundp 'typescript-indent-level) (setq-local typescript-indent-level 2))
  ;; For web-mode (often used for JSX/TSX)
  (when (boundp 'web-mode-markup-indent-offset) (setq-local web-mode-markup-indent-offset 2))
  (when (boundp 'web-mode-css-indent-offset)    (setq-local web-mode-css-indent-offset 2))
  (when (boundp 'web-mode-code-indent-offset)   (setq-local web-mode-code-indent-offset 2))
  ;; For tide/formatters that respect js/ts settings
  (when (boundp 'js2-basic-offset) (setq-local js2-basic-offset 2))
  )

;; Hook for JS, JSX, TS, TSX
(add-hook 'js-mode-hook #'my-js-ts-2-space-indent)
(add-hook 'js2-mode-hook #'my-js-ts-2-space-indent)
(add-hook 'js-jsx-mode-hook #'my-js-ts-2-space-indent)
(add-hook 'typescript-mode-hook #'my-js-ts-2-space-indent)
(add-hook 'rjsx-mode-hook #'my-js-ts-2-space-indent)
