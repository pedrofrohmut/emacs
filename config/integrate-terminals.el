;; VTerm ########################################################################

(use-package vterm
  :ensure t
  :defer t
  :init
  (setq vterm-shell "/usr/bin/env bash")
  (setq vterm-kill-buffer-on-exit t)
  :commands vterm
  :bind
  (("C-x x s" . vterm-other-window)))
