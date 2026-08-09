;; C/C++ ########################################################################

(setq c-basic-offset 4)
(setq c-hanging-braces-alist '(substatement-open . (after)))
(setq c-offsets-alist '((substatement-open . 0)
                        (block-open        . 0)
                        (brace-list-open   . 0)
                        (brace-list-close  . 0)))

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

;; Emmet ########################################################################

(use-package emmet-mode
  :ensure t
  :defer t
  :bind
  (("C-; k" . emmet-expand-line)) ;; Maybe unbind C-j is needed
  :hook
  (sgml-mode . emmet-mode)
  :config
  (add-to-list 'emmet-jsx-major-modes 'web-mode)
  (add-to-list 'emmet-jsx-major-modes 'typescript-ts-mode)
  (add-to-list 'emmet-jsx-major-modes 'tsx-ts-mode))

;; JavaScript/Typescript/React ##################################################

(setq js-indent-level 2)

;; Map file extensions to tree-sitter modes
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(use-package prettier-js
  :ensure t
  :defer t
  :commands prettier-js)

;; OCaml ########################################################################

(use-package tuareg
  :ensure t
  :defer t)

(add-to-list 'auto-mode-alist '("\\.ml\\'" . tuareg-mode))
