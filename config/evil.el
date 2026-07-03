;; Evil Mode ####################################################################

(use-package evil
  :ensure nil
  :defer t
  :commands evil-mode
  :bind
  (:map evil-normal-state-map
        ("H" . evil-first-non-blank)
        ("L" . evil-end-of-line))
  :config
  (define-key evil-normal-state-map (kbd "<return>") (kbd "i <return> <right> <escape>")))
