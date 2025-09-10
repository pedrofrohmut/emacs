;; Languages ####################################################################

(defun my-ident ()
            (setq indent-tabs-mode nil
                  tab-width 4
                  c-basic-offset 4))

;; Golang #######################################################################

(use-package go-mode
  :ensure t)

(add-hook 'go-mode-hook #'my-ident)
(add-hook 'go-ts-mode-hook #'my-ident)

;; C/C++ ########################################################################

(setq c-basic-offset 4)
(setq c-hanging-braces-alist '(substatement-open . (after)))
