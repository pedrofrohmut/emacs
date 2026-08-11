;; My macros ####################################################################

(defmacro my/cmd (&rest body)
  "Wrap with interactive lambda"
  `(lambda ()
     (interactive)
     ,@body))

;; My Functions #################################################################

(defun my/switch-to-recent-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

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

(defun my/open-line-up ()
  "Open a new line on the line up in indentation"
  (interactive)
  (move-beginning-of-line 1)
  (newline-and-indent)
  (previous-line)
  (indent-for-tab-command))

(defun my/open-line-down ()
  "Open a new line on the line up in indentation"
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(defun my/keymap-global-set (keys command)
  "You set a key list to a command"
  (dolist (key keys)
    (keymap-global-set key command)))

(defun my/kill-region-or-backward-word ()
  "backward-kill-word if no active region and kill-region otherwise"
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))

;; Keybinds #####################################################################

;; Scrolling
(keymap-global-set "M-{" #'my/scroll-half-page-up)
(keymap-global-set "M-}" #'my/scroll-half-page-down)
(keymap-global-set "M-[" #'my/scroll-quarter-page-up)
(keymap-global-set "M-]" #'my/scroll-quarter-page-down)

;; Buffers
(my/keymap-global-set '("M-g b" "M-g M-b") #'my/switch-to-recent-buffer)
(keymap-global-set "C-x C-b" 'ibuffer)

;; Windows
(keymap-global-set "C-x w r" 'window-swap-states)

;; Utils
(keymap-global-set "M-s M-s" 'replace-string)
(keymap-global-set "M-s M-q" 'query-replace)
(keymap-global-set "C-M-y" 'duplicate-line)
(keymap-global-set "C-q" 'project-find-file)
(keymap-global-set "C-`" 'quoted-insert)
(keymap-global-set "C-x f" 'find-file-at-point)
(keymap-global-set "C-<right>" 'recenter-top-bottom) ;; C-M-l
(keymap-global-set "C-<down>" 'join-line) ;; C-M-j

;; Change words case
(keymap-global-set "M-u" 'upcase-dwim)     ;; Don't know why this is not default
(keymap-global-set "M-c" 'capitalize-dwim) ;; Don't know why this is not default
(keymap-global-set "M-l" 'downcase-dwim)   ;; Don't know why this is not default

;; Change focus between windows
(keymap-global-set "M-o" 'other-window)
(keymap-global-set "M-O" (my/cmd (other-window -1)))

;; Ctrl_w do 2 things
(keymap-global-set "C-w" #'my/kill-region-or-backward-word)

;; Enlarge and shrink windows
(keymap-global-set "M-<up>"    (my/cmd (shrink-window 5)))
(keymap-global-set "M-<left>"  (my/cmd (shrink-window-horizontally 5)))
(keymap-global-set "M-<right>" (my/cmd (enlarge-window-horizontally 5)))
(keymap-global-set "M-<down>"  (my/cmd (enlarge-window 5)))

;; Easy open line up and down
(keymap-global-set "C-M-o" #'my/open-line-up)
(keymap-global-set "C-o" #'my/open-line-down)

;; Easier delete
(keymap-global-set "C-h" 'backward-delete-char-untabify)
(keymap-set isearch-mode-map "C-h" 'isearch-delete-char)
(keymap-global-set "C-<left>" 'backward-kill-word) ;; C-M-j (fix for keyd)
(keymap-global-set "C-l" 'delete-forward-char)
(keymap-global-set "C-<up>" 'kill-sexp) ;; C-M-k (fix for keyd)

;; Unset keybinds ################################################################

;; Avoid minimising and closing by accident
(keymap-global-unset "C-z")
(keymap-global-unset "C-x C-c")
