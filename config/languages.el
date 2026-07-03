;; Lisp #########################################################################

(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

(use-package slime
  :ensure nil
  :defer t
  :commands slime)

;; Golang #######################################################################

(use-package go-mode
  :ensure t
  :defer t)

;; (add-hook 'go-mode-hook
;;           (lambda ()
;;             (setq indent-tabs-mode t
;;                   tab-width 4
;;                   whitespace-style '(face spaces trailing))))

;; C/C++ ########################################################################

(setq c-basic-offset 4)
(setq c-hanging-braces-alist '(substatement-open . (after)))
(setq c-offsets-alist '((substatement-open . 0)
                        (block-open        . 0)
                        (brace-list-open   . 0)
                        (brace-list-close  . 0)))

;; CSharp #######################################################################

;; (use-package tree-sitter :ensure t)
;; (use-package tree-sitter-langs :ensure t)
;; (use-package tree-sitter-indent :ensure t)

(use-package csharp-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-ts-mode)))

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

;; Emmet ########################################################################

(use-package emmet-mode
  :ensure t
  :defer t
  :bind
  (("C-; j" . emmet-expand-line)) ;; Maybe unbind C-j is needed
  :hook
  (sgml-mode . emmet-mode)
  :config
  (add-to-list 'emmet-jsx-major-modes 'web-mode)
  (add-to-list 'emmet-jsx-major-modes 'typescript-ts-mode)
  (add-to-list 'emmet-jsx-major-modes 'tsx-ts-mode))

;; JavaScript/Typescript/React ##################################################

;; check if needed: jtsx (extends jsx tsx support)

(setq js-indent-level 2)

(setq treesit-language-source-alist
      '((tsx . ("https://github.com/tree-sitter/tree-sitter-typescript"
                "v0.23.2"
                "tsx/src"))
        (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript"
                       "v0.23.2"
                       "typescript/src"))))

;; Map file extensions to tree-sitter modes
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(use-package prettier-js
  :ensure t
  :defer t
  :commands prettier-js)
