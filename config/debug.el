;; Dape ########################################################################

(use-package dape
  :ensure t
  :defer t
  :commands dape  ;; Lazy load dape only when dape is called
  :config
  (setq dape-adapters
        '(gdb . ((command . "gdb")
                 (args . ("--interpreter=mi"))))))
