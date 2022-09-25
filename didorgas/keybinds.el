;; Keybinds #####################################################################

; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-c d")    'cd)
(global-set-key (kbd "C-c C-d")  'cd)

(global-unset-key (kbd "C-h"))  ; Can still use help with F1
(global-unset-key (kbd "C-l"))  ; Can use evil zz
(global-unset-key (kbd "C-j"))  ; Not useful before
(global-unset-key (kbd "C-k"))  ; Not useful either
