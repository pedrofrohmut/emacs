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

;; Set theme - Comment it in a fresh install or doom-themes not installed
(load-theme 'doom-tokyo-night t)

;; Set transparency
(set-frame-parameter (selected-frame) 'alpha '(90 90))

;; Set font family/size
(set-frame-font "FiraCode Nerd Font Mono 12" nil t)

;; Color Column/Ruler
(global-display-fill-column-indicator-mode t)
(setq-default display-fill-column-indicator-column 101)

;; Blinking ui as bell
(setq visible-bell nil)

;; Tab to 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

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

;; Keybinds #####################################################################

; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-c d")    'cd)
(global-set-key (kbd "C-c C-d")  'cd)

(global-unset-key (kbd "C-h"))  ; Can still use help with F1
(global-unset-key (kbd "C-l"))  ; Can use evil zz 
(global-unset-key (kbd "C-j"))  ; Not useful before
(global-unset-key (kbd "C-k"))  ; Not useful either

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

(use-package doom-modeline
    :ensure t
    :init
    (doom-modeline-mode t)
    :custom
    (doom-modeline-height 10))

(use-package doom-themes)

;; Evil #########################################################################

;; Evil Mode
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-u-delete t)
  (setq evil-want-C-i-jump t)
  (setq evil-want-keybinding nil) ; Evil collection asks for it
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-cross-lines t)
  (setq evil-move-beyond-eol t)
  :config
  ;; Ctrl-h as backspace
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  ;; Ctrl-l as delete
  (define-key evil-insert-state-map (kbd "C-l") 'evil-delete-char)
  ;; Change tab normal mode (next)
  (define-key evil-normal-state-map (kbd "C-l") 'tab-next)
  ;; Change tab normal mode (previous)
  (define-key evil-normal-state-map (kbd "C-h") 'tab-previous)
  ;; Easy insert linebreak in normal mode
  (define-key evil-normal-state-map (kbd "RET") (kbd "i RET <escape>"))
  ;; Removed to be used by EasyMotion + Sneak
  (define-key evil-normal-state-map (kbd "s") nil)
  ;; Removed to be used by EasyMotion + Sneak (reverse)
  (define-key evil-normal-state-map (kbd "S") nil)
  ;; Scroll down
  (define-key evil-normal-state-map (kbd "C-j")
    (lambda () (interactive) (evil-scroll-line-down 12)))
  ;; Scroll up
  (define-key evil-normal-state-map (kbd "C-k")
    (lambda () (interactive) (evil-scroll-line-up 12)))
  ;; Removed to be used by projectile
  (define-key evil-normal-state-map (kbd "C-p") nil)
  ;; Removed to be used by
  (define-key evil-normal-state-map (kbd "C-n") nil)

  ;; Resize Windows
  (define-key evil-normal-state-map (kbd "<up>") 'evil-window-increase-height)
  (define-key evil-normal-state-map (kbd "<down>") 'evil-window-decrease-height)
  (define-key evil-normal-state-map (kbd "<right>") 'evil-window-increase-width)
  (define-key evil-normal-state-map (kbd "<left>") 'evil-window-decrease-width)

  ;; LSP - TODO

  (evil-mode t))

;; Evil - Must Have #############################################################

;; Makes evil keys consistent in more places than just evil mode default
(use-package evil-collection
  :after
  evil
  :config
  (evil-collection-init))

;; Evil Commentary 'gc<motion>' 'gcc' ...
(use-package evil-commentary
    :after
    evil
    :config
    (evil-commentary-mode t))

;; Evil Surround (emulate tim pope)
(use-package evil-surround
  :after
  evil
  :config
  (global-evil-surround-mode t))

;; Evil-numbers
(use-package evil-numbers
  :after
  evil
  :config
  ;; Evil Increase hovered number
  (define-key evil-normal-state-map (kbd "C--") 'evil-numbers/dec-at-pt)
  ;; Evil Decrease hovered number
  (define-key evil-normal-state-map (kbd "C-=") 'evil-numbers/inc-at-pt))

;; Keymap #######################################################################

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

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
  ;; Files
  "f"   '(:ignore t :which-key "Files")
  "f f" '(counsel-find-file :which-key "Find File")
  "f d" '(counsel-dired :which-key "DirEd")
  "f s" '(save-buffer :which-key "Save Buffer")
  ;; Projectile
  "p"   '(projectile-command-map :which-key "Projectile Commands")
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
  "w q" '(evil-window-delete :which-key "Close Window")
  "w s" '(evil-window-split :which-key "Split")
  "w v" '(evil-window-vsplit :which-key "Vertical Split")
  "w h" '(evil-window-left :which-key "Go Left")
  "w j" '(evil-window-down :which-key "Go Down")
  "w k" '(evil-window-up :which-key "Go Up")
  "w l" '(evil-window-right :which-key "Go Right")
  "w r" '(evil-window-rotate-downwards :which-key "Rotate")
  "w o" '(delete-other-windows :which-key "Close Others"))
 
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
  (unbind-key "C-j" emmet-mode-keymap)
  (unbind-key "<C-return>" emmet-mode-keymap)
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
  :init
  (ivy-rich-mode t))

;; Install the required fonts with: M-x all-the-icons-install-fonts
(use-package all-the-icons
  :if (display-graphic-p))

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

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command]  . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key]      . helpful-key))

;; Syntax HightLight ############################################################

(use-package tree-sitter)
(use-package tree-sitter-langs)
(use-package tree-sitter-indent)

(use-package csharp-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-tree-sitter-mode))
  :mode "\\.cs\\'"
  :hook
  (csharp-mode . lsp-deferred))

(use-package elixir-mode
  :config
  (setq lsp-clients-elixir-server-executable "~/software/elixir-ls/language_server.sh")
  :hook
  (elixir-mode . lsp-deferred))

;; LSP ##########################################################################

(use-package lsp-mode
  ;; :config
  ;; (setq lsp-clients-elixir-server-executable "~/software/elixir-ls/language_server.sh")
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
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
  :after
  lsp-mode
  :hook
  (prog-mode . company-mode)
  :bind
  (:map company-active-map ("<tab" . company-complete-selection))
  (:map lsp-mode-map ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimun-prefix-length 1)
  (company-idle-delay 0))

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
 '(package-selected-packages
   '(company awesome-tab awesome-tabs centaur-tabs counsel-projectile projectile helpful general which-key all-the-icons eletric-pair-mode csharp-mode tree-sitter-indent tree-sitter-langs tree-sitter lsp-ivy lsp-ui lsp-mode ivy-rich counsel ivy elixir-mode visual-fill-column emmet-mode evil-numbers evil-surround evil-commentary evil-collection evil use-package doom-themes doom-modeline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
