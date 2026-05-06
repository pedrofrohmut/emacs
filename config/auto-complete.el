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

;; (use-package copilot
;;   :ensure nil
;;   :bind (:map copilot-completion-map
;;               ("C-j" . copilot-accept-completion)
;;               ("C-l" . copilot-accept-completion-by-line)
;;               ("C-w" . copilot-accept-completion-by-word)
;;               ("C-k" . copilot-clear-overlay)
;;               ("C-n" . copilot-next-completion)
;;               ("C-p" . copilot-previous-completion)))

;; (keymap-global-set "C-; i" 'copilot-complete)
;; (keymap-global-set "C-; o" 'copilot-clear-overlay)
;; (keymap-global-set "C-; u" 'copilot-accept-completion)

;; Codeium ######################################################################

;; TODO: Check if the current ai code completion is good or is needed to add codeium

;; Minuet #######################################################################

(use-package minuet
  :ensure t
  :bind
  (("C-; i" . #'minuet-complete-with-minibuffer)
   ("C-; u" . #'minuet-accept-suggestion-line))
  :config
    (setq minuet-provider 'openai-fim-compatible)
    (setq minuet-n-completions 1) ; recommended for Local LLM for resource saving
    ;; I recommend beginning with a small context window size and incrementally
    ;; expanding it, depending on your local computing power. A context window
    ;; of 512, serves as an good starting point to estimate your computing
    ;; power. Once you have a reliable estimate of your local computing power,
    ;; you should adjust the context window to a larger value.
    (setq minuet-context-window 512)
    (plist-put minuet-openai-fim-compatible-options :end-point "http://localhost:11434/v1/completions")
    ;; an arbitrary non-null environment variable as placeholder.
    ;; For Windows users, TERM may not be present in environment variables.
    ;; Consider using APPDATA instead.
    (plist-put minuet-openai-fim-compatible-options :name "Ollama")
    (plist-put minuet-openai-fim-compatible-options :api-key "TERM")
    ;; (plist-put minuet-openai-fim-compatible-options :model "qwen2.5-coder:3b")
    (plist-put minuet-openai-fim-compatible-options :model "qwen2.5-coder:7b")
    ;; (plist-put minuet-openai-fim-compatible-options :model "qwen2.5-coder:14b-base")

    (minuet-set-optional-options minuet-openai-fim-compatible-options :max_tokens 56))
