(use-package avy
  :defer t
  :ensure t)

(keymap-global-set "C-'" 'avy-goto-word-1)
(keymap-global-set "M-g l" 'avy-goto-line)
(keymap-global-set "M-s p" 'avy-prev)
(keymap-global-set "M-s n" 'avy-next)
