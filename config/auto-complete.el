;; Dabbrev ######################################################################

;; Use Dabbrev with Corfu!
(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :init
  ;; Make dabbrec case sensitive
  (setq dabbrev-case-fold-search nil)
  :config
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

;; Auto-Complete ################################################################

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

;; Cape #########################################################################

(use-package cape
  :ensure t
  :bind ("C-;" . cape-prefix-map)
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

;; Copilot ######################################################################

(use-package copilot
  :ensure t
  :bind (:map copilot-completion-map
              ("C-j" . copilot-accept-completion)
              ("C-l" . copilot-accept-completion-by-line)
              ("C-w" . copilot-accept-completion-by-word)
              ("C-k" . copilot-clear-overlay)
              ("C-n" . copilot-next-completion)
              ("C-p" . copilot-previous-completion)))

(keymap-global-set "C-; i" 'copilot-complete)
(keymap-global-set "C-; o" 'copilot-clear-overlay)
(keymap-global-set "C-; u" 'copilot-accept-completion)
