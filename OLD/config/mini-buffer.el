;; Vertico ######################################################################

;; Enable vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Colors
(set-face-attribute 'vertico-current nil :foreground "#fff" :background "#552")

;; Marginalia #######################################################################################

(use-package marginalia
  :ensure t)

(with-eval-after-load 'vertico
  (marginalia-mode))

(setq marginalia-align 'left)

;; Orderless ########################################################################################

(use-package orderless
  :ensure t)

(with-eval-after-load 'vertico
  (require 'orderless)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles basic partial-completion)))))
