;; General #######################################################################

(use-package general
  :config
  (general-evil-setup t))

(general-nmap
  :prefix "SPC"
  "SPC" '(counsel-M-x :which-key "M-x")
  ;; Buffers
  "b"   '(:igonre t :which-key "Buffers")
  "b b" '(ibuffer :which-key "IBuffer")
  "b n" '(next-buffer :which-key "Next Buffer")
  "b p" '(previous-buffer :which-key "Previous Buffer")
  "b k" '(kill-buffer :which-key "Kill Buffer")
  "b d" '(kill-current-buffer :which-key "Kill Current Buffer")
  "b e" '(eval-buffer :which-key "Eval Buffer")
  ;; Files
  "f"   '(:ignore t :which-key "Files")
  "f f" '(counsel-find-file :which-key "Find File")
  "f d" '(counsel-dired :which-key "DirEd")
  "f s" '(save-buffer :which-key "Save Buffer")
  ;; Projectile
  ;; "p"   '(projectile-command-map :which-key "Projectile Commands")
  "p d" '(package-delete :which-key "Package Delete")
  ;; Utils
  "s"   '(:ignore t :which-key "Utils")
  "s s" '(replace-regexp :which-key "Replace Reg Exp")
  "s 1" '(delete-trailing-whitespace :which-key "Del Trailing")
  ;; Tabs
  "t"   '(:ignore t :which-key "Tabs")
  "t l" '(tab-move :which-key "Go Next")
  "t h" '((lambda () (interactive) (tab-move -1)) :which-key "Go Previous")
  "t c" '(tab-new :which-key "New Tab")
  "t q" '(tab-close :which-key "Close Current")
  "t o" '(tab-close-other :which-key "Close Others")
  "t u" '(tab-undo :which-key "Undo Close Tab")
  "t r" '(tab-rename :which-key "Rename")
  ;; Window
  "w"   '(:ignore t :which-key "Window")
  "w c" '(evil-window-delete :which-key "Close Window")
  "w q" '(evil-quit :which-key "Close Window")
  "w s" '(evil-window-split :which-key "Split")
  "w v" '(evil-window-vsplit :which-key "Vertical Split")
  "w h" '(evil-window-left :which-key "Go Left")
  "w j" '(evil-window-down :which-key "Go Down")
  "w k" '(evil-window-up :which-key "Go Up")
  "w l" '(evil-window-right :which-key "Go Right")
  "w r" '(evil-window-rotate-downwards :which-key "Rotate")
  "w o" '(delete-other-windows :which-key "Close Others"))
