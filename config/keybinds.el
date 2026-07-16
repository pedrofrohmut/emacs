;; My macros ####################################################################

(defmacro n-times (n &rest body)
  "Execute the body n times
Example: (n-times 5 (insert-char 42))"
  `(dotimes (_, n)
     ,@body))

(defmacro n-times-interactive (n &rest body)
  "Execute the body n times but wrapped with a interactive lambda to be used for keybinds"
  `(lambda ()
     (interactive)
     (dotimes (_, n)
       ,@body)))

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
  (previous-line)
  (move-end-of-line 1)
  (newline-and-indent))

(defun my/open-line-down ()
  "Open a new line on the line up in indentation"
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(defun my/open-line-down2 ()
  "Open a new line on the line up in indentation"
  (interactive)
  (newline-and-indent)
  (previous-line)
  (move-end-of-line 1)
  (newline-and-indent))

;; Keybinds #####################################################################

;; Scrolling
(keymap-global-set "M-{" #'my/scroll-half-page-up)
(keymap-global-set "M-}" #'my/scroll-half-page-down)
(keymap-global-set "M-[" #'my/scroll-quarter-page-up)
(keymap-global-set "M-]" #'my/scroll-quarter-page-down)

;; Buffers
(keymap-global-set "M-g b" #'my/switch-to-recent-buffer)
(keymap-global-set "M-g M-b" #'my/switch-to-recent-buffer)
;; (keymap-global-set "C-x C-b" 'switch-to-buffer-other-window)
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
(keymap-global-set "C-." 'repeat)
;;(keymap-global-set "C-c C-c" 'project-recompile)
(keymap-global-set "C-x p r" 'project-recompile)

(keymap-global-set "M-u" 'upcase-dwim)     ;; Don't know why this is not default
(keymap-global-set "M-c" 'capitalize-dwim) ;; Don't know why this is not default
(keymap-global-set "M-l" 'downcase-dwim)   ;; Don't know why this is not default

;; Change focus between windows
(keymap-global-set "M-o" 'other-window)
(keymap-global-set "M-O" (my/cmd (other-window -1))

;; Enlarge and shrink windows
(keymap-global-set "M-<up>"    (my/cmd (shrink-window 5)))
(keymap-global-set "M-<left>"  (my/cmd (shrink-window-horizontally 5)))
(keymap-global-set "M-<right>" (my/cmd (enlarge-window-horizontally 5)))
(keymap-global-set "M-<down>"  (my/cmd (enlarge-window 5)))

(keymap-global-set "C-M-o" #'my/open-line-up)
(keymap-global-set "C-o" #'my/open-line-down)
;; Not really using that much. Testing with C-j when i need enter with no indent
;; (keymap-global-set "C-j" #'my/open-line-down2)

;; Easier delete
(keymap-global-set "C-h" 'backward-delete-char-untabify)
(keymap-set isearch-mode-map "C-h" 'isearch-delete-char)
(keymap-global-set "C-<left>" 'backward-kill-word)
(keymap-global-set "C-l" 'delete-forward-char)
(keymap-global-set "C-<up>" 'kill-sexp) ;; C-M-k

(keymap-global-set "C-<right>" 'recenter-top-bottom) ;; C-M-l
(keymap-global-set "C-<down>" 'join-line) ;; C-M-j

;; Unset keybinds ################################################################

;; Avoid minimising and closing by accident
(keymap-global-unset "C-z")
(keymap-global-unset "C-x C-c")
