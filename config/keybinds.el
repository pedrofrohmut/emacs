;; Keybinds #####################################################################


(defun my/switch-to-recent-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; Buffers
(keymap-global-set "M-g b" #'my/switch-to-recent-buffer)


(defun my/scroll-half-page-down ()
  "Scroll half a page down."
  (interactive)
  (scroll-up-command (/ (window-body-height) 2)))

(defun my/scroll-half-page-up ()
  "Scroll half a page up."
  (interactive)
  (scroll-down-command (/ (window-body-height) 2)))

;; Scrolling
(keymap-global-set "M-]" #'my/scroll-half-page-down)
(keymap-global-set "M-[" #'my/scroll-half-page-up)


;; Dired
(require 'dired)
(keymap-set dired-mode-map "b" 'dired-up-directory)
(keymap-set dired-mode-map "C-c n d" 'dired-create-directory)
(keymap-set dired-mode-map "C-c n f" 'dired-create-empty-file)


;; Utils
(keymap-global-set "M-s M-s" 'replace-string)
(keymap-global-set "C-M-y" 'duplicate-line)
(keymap-global-set "C-<down>" 'join-line)
(keymap-global-set "M-o" 'other-window)
