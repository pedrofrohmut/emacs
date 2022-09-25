;; UI ##########################################################################

;; Clean up UI
(tool-bar-mode 0)    ; Hide toolbar
(menu-bar-mode 0)    ; Hide menubar
(scroll-bar-mode 0)  ; Hide scrollbar
(tooltip-mode 0)     ; Disable tooltips
(set-fringe-mode 7)  ; Give some padding

;; Remove startup screen
(setq inhibit-startup-message t)

;; Theme & Customization ########################################################

;; Set transparency
(set-frame-parameter (selected-frame) 'alpha '(90 90))

;; Set font family/size
(set-frame-font "FiraCode Nerd Font Mono 12" nil t)

;; Color Column/Ruler
(global-display-fill-column-indicator-mode t)
(setq-default display-fill-column-indicator-column '(81 101))

;; Blinking ui as bell
(setq visible-bell nil)

;; Tab to 4 spaces
(setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)
;; (setq indent-line-function 'insert-tab)

;; Relative line numbers
(global-display-line-numbers-mode t)
(setq-default display-line-numbers-type 'relative)
(set-face-foreground 'line-number "#505050")

;; Diable line numbers to certain modes
(dolist (mode '(term-mode-hook
                eshell-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Hightlight Matching parens on hover
(show-paren-mode t)
(electric-pair-mode t)

;; Disable backup files
(setq make-backup-files nil)

;; Show cursor position in the status bar
(setq column-number-mode t)

;; Tabs
(setq tab-bar-new-tab-choice "*scratch*")
(setq tab-bar-new-tab-to 'rightmost)
(setq tab-bar-close-button-show nil)
(setq tab-bar-new-button-show nil)

(load "~/.config/emacs/didorgas/keybinds.el")

;; MELPA ########################################################################

;; Adding packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(package-initialize)

;; USE-PACKAGE ##################################################################

;; Install Use-Package
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

;; This is only needed once, near the top of the file
(eval-when-compile
  (add-to-list 'load-path "~/.config/emacs/elpa")
  (setq use-package-always-ensure t)
  (require 'use-package))

;; Doom Styling #################################################################

(use-package doom-themes
    :config
    (load-theme 'doom-tokyo-night t))

(use-package doom-modeline
  :hook
  (after-init . doom-modeline-mode)
  :init
  (setq doom-modeline-height 15))

;; Install the required fonts with: M-x all-the-icons-install-fonts
(use-package all-the-icons
  :if (display-graphic-p))

;; Evil #########################################################################

(load "~/.config/emacs/didorgas/plugins/evil.el")

;; General ######################################################################

(load "~/.config/emacs/didorgas/plugins/general.el")

;; Which Key ####################################################################


(which-key-setup-side-window-right)

(use-package which-key
  :init
  (setq which-key-idle-delay 1)
  :config
  (which-key-mode t))

;; Ace Jump #####################################################################

(use-package ace-jump-mode)
(define-key evil-normal-state-map (kbd "s") 'ace-jump-word-mode)
(define-key evil-normal-state-map (kbd "S") 'ace-jump-mode-pop-mark)

;; Emmet ########################################################################

(use-package emmet-mode
  :defer t
  :after
  (web-mode css-mode scss-mode)
  :init
  (setq emmet-move-cursor-between-quotes t)
  (setq emmet-self-closing-tag-style " /")
  :config
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 4)))
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode)
  (unbind-key "C-j" emmet-mode-keymap) (unbind-key "<C-return>" emmet-mode-keymap)
  (unbind-key "C-M-<left>" emmet-mode-keymap)
  (unbind-key "C-M-<right>" emmet-mode-keymap)
  :bind
  ("C-k" . emmet-expand-line))

;; Fill Column ##################################################################

(use-package visual-fill-column
  :config
  (setq-default visual-fill-column-width 101)
  (setq-default visual-fill-column-center-text t)
  :config
  (global-visual-fill-column-mode t))

;; Ivy, Counsel and Swiper ######################################################

(use-package ivy
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode t))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (counsel-mode t))

(use-package swiper)

(use-package ivy-rich
  :config
  (ivy-rich-mode t))

;; Projectile ###################################################################

(use-package projectile
  :diminish
  projectile-mode
  :init
  (setq projectile-project-search-path '("~/programming/" "~/dotfiles/"))
  (setq projectile-switch-project-action #'projectile-dired)
  :config
  (projectile-mode 1)
  :custom
  (projectile-completion-system 'ivy)
  :bind (:map projectile-mode-map
              ("C-q" . projectile-find-file)
              ("C-c p" . projectile-command-map)))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode))

;; Helpful ######################################################################

;; (use-package helpful
;;   :custom
;;   (counsel-describe-function-function #'helpful-callable)
;;   (counsel-describe-variable-function #'helpful-variable)
;;   :bind
;;   ([remap describe-function] . counsel-describe-function)
;;   ([remap describe-command]  . helpful-command)
;;   ([remap describe-variable] . counsel-describe-variable)
;;   ([remap describe-key]      . helpful-key))

;; Syntax HightLight ############################################################

(use-package tree-sitter)
(use-package tree-sitter-langs)
(use-package tree-sitter-indent)

(use-package csharp-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-tree-sitter-mode))
  :mode "\\.cs\\'")

(use-package elixir-mode
  :mode "\\.ex\\'")
  ;; :config
  ;; (setq lsp-clients-elixir-server-executable "~/software/elixir-ls/language_server.sh"))

;; LSP ##########################################################################

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  (csharp-mode . lsp-deferred)
  (elixir-mode . lsp-deferred)
  :commands
  (lsp lsp-deferred))

(use-package lsp-ui
  :after
  lsp-mode
  :hook
  (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom)
  (lsp-ui-doc-delay 1.5)
  :commands
  lsp-ui-mode)

(use-package lsp-ivy
  :after
  lsp-mode
  :commands
  lsp-ivy-workspace-symbol)

(use-package company
  :bind (("C-n" . company-complete)
         ("C-<space>" . company-complete)
         :map company-active-map
         ("C-n" . company-select-next-or-abort)
         ("C-p" . company-select-previous-or-abort))
  :config
  (global-company-mode t)
  :custom
  (company-idle-delay 0.2)
  (company-minimun-prefix-length 1))

;; (use-package company
;;   :after
;;   lsp-mode
;;   :hook
;;   (lsp-mode . company-mode)
;;   :custom
;;   (company-minimun-prefix-length 2)
;;   (company-idle-delay 0))

  ;; :bind ((:map company-active-map
  ;;              ("<tab>" . company-complete-selection))
  ;;        (:map lsp-mode-map
  ;;              ("<tab>" . company-indent-or-complete-common)))
  ;; :init
  ;; (setq company-minimun-prefix-length 2)
  ;; (setq company-idle-delay 0)
  ;; :config
  ;; (setq company-minimun-prefix-length 2)
  ;; (setq company-idle-delay 0))

;; (define-key evil-insert-state-map (kbd "C-p") 'company-select-previous)
;; (define-key evil-insert-state-map (kbd "C-n") 'company-select-next)

;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; optionally if you want to use debugger
;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
;; optional if you want which-key integration
;(use-package which-key
;    :config
;    (which-key-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" default))
 '(package-selected-packages
   '(company counsel-projectile projectile general which-key all-the-icons eletric-pair-mode csharp-mode tree-sitter-indent tree-sitter-langs tree-sitter lsp-ivy lsp-ui lsp-mode ivy-rich counsel ivy elixir-mode visual-fill-column emmet-mode evil-numbers evil-surround evil-commentary evil-collection evil use-package doom-themes doom-modeline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
