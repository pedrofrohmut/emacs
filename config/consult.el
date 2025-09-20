;; Consult ##########################################################################################

(use-package consult
  :ensure t)

(require 'project)

;; Set root dir for project.el
(setq project-vc-extra-root-markers '(".project.el" ".projectile" ))

;; TODO: This function is maybe not needed anymore
(defun my/consult-fd-only-files ()
  "Uses `consult-fd` with custom args set to type 'file only' on
   current project-root or in the default-directory if root not found"
  (interactive)
  (let* ((current-root (project-root (project-current)))
         (default-directory (if current-root current-root default-directory))
         (consult-fd-args '((if (executable-find "fdfind" 'remote) "fdfind" "fd")
                            "--full-path --color=never --type file")))
    (call-interactively #'consult-fd)))

;;(keymap-global-set "C-q" #'my/consult-fd-only-files)

;; Paste from register (from mini buffer)
(keymap-global-set "M-s y" 'consult-yank-from-kill-ring)

(keymap-global-set "M-s g" 'consult-ripgrep)

(keymap-global-set "M-s l" 'consult-line)
(keymap-global-set "C-x C-l" 'consult-line)

;(keymap-global-set "M-q" 'consult-project-buffer)
;(keymap-global-set "M-s m" 'consult-minor-mode-menu)
