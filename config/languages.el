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
