;; Consult ######################################################################

(use-package consult
  :ensure t
  :bind
  (("M-s y"   . consult-yank-from-kill-ring)
   ("M-s g"   . consult-ripgrep)
   ("M-s l"   . consult-line)
   ("C-x C-l" . consult-line)
   ("C-c b"   . consult-project-buffer)))
