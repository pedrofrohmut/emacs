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

(defun my/scroll-quarter-page-down ()
  "Scroll quarter a page down."
  (interactive)
  (scroll-up-command (/ (window-body-height) 4)))

(defun my/scroll-quarter-page-up ()
  "Scroll quarter a page up."
  (interactive)
  (scroll-down-command (/ (window-body-height) 4)))

;; Scrolling
(keymap-global-set "M-[" #'my/scroll-half-page-up)
(keymap-global-set "M-]" #'my/scroll-half-page-down)
(keymap-global-set "M-{" #'my/scroll-quarter-page-up)
(keymap-global-set "M-}" #'my/scroll-quarter-page-down)

;; Utils
(keymap-global-set "M-s M-s" 'replace-string)
(keymap-global-set "C-M-y" 'duplicate-line)
(keymap-global-set "M-o" 'other-window)
(keymap-global-set "C-q" 'project-find-file)
(keymap-global-set "C-x f" 'find-file-at-point)

;; Easier delete
(keymap-global-set "C-h" 'delete-backward-char)
(keymap-global-set "C-<left>" 'backward-kill-word)
(keymap-global-set "C-l" 'delete-forward-char)
(keymap-global-set "C-<up>" 'kill-sexp) ;; C-M-k

(keymap-global-set "C-<right>" 'recenter-top-bottom) ;; C-M-l
(keymap-global-set "C-<down>" 'join-line) ;; C-M-j

;; Unset keybinds ################################################################

;; Avoid minimising and closing by accident
(keymap-global-unset "C-z")
(keymap-global-unset "C-x C-c")
