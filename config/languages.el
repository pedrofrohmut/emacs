;; Languages ####################################################################

(defun my-ident ()
            (setq indent-tabs-mode nil
                  tab-width 4
                  c-basic-offset 4))

;; Golang #######################################################################

(use-package go-mode
  :ensure t)

(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode t
                  tab-width 4
                  whitespace-style '(face spaces trailing))))

;; C/C++ ########################################################################

(setq c-basic-offset 4)
(setq c-hanging-braces-alist '(substatement-open . (after)))

;; Markdown #####################################################################

(use-package markdown-mode
  :ensure t)

;; JSON #########################################################################

(use-package json-mode
  :ensure t)

;; Yaml #########################################################################

(use-package yaml-mode
  :ensure t)

;; Web ##########################################################################

(use-package web-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))

(setq web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 4
      web-mode-code-indent-offset 2)

(use-package emmet-mode
  :ensure t)

(keymap-global-set "C-; j" 'emmet-expand-line)

(add-hook 'sgml-mode-hook 'emmet-mode)
