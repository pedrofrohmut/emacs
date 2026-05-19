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

(use-package emmet-mode
  :ensure t)

(keymap-unset emmet-mode-keymap "C-j")

(keymap-global-set "C-; j" 'emmet-expand-line)

(add-hook 'sgml-mode-hook 'emmet-mode)

(add-to-list 'emmet-jsx-major-modes 'web-mode)
(add-to-list 'emmet-jsx-major-modes 'typescript-ts-mode)
(add-to-list 'emmet-jsx-major-modes 'tsx-ts-mode)

;; JavaScript/Typescript/React ##################################################

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
  :ensure t)
