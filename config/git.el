;; Diff Highlight ###############################################################

(use-package diff-hl

  :ensure t

  :defer t

  :config
  (set-face-background 'diff-hl-insert "#262")
  (set-face-background 'diff-hl-delete "#622")
  (set-face-background 'diff-hl-change "#266")

  :bind
  (("M-g [" . diff-hl-previous-hunk)
   ("M-g ]" . diff-hl-next-hunk)
   ("M-g S" . diff-hl-stage-dwim)
   ("M-g h" . diff-hl-show-hunk))

  )

;; To enable diff-hl by default add: `:config (global-diff-hl-mode)`

;; C-x v *  diff-hl-show-hunk
;; C-x v S  diff-hl-stage-dwim
;; C-x v [  diff-hl-previous-hunk
;; C-x v ]  diff-hl-next-hunk
;; C-x v n  diff-hl-revert-hunk
;; C-x v {  diff-hl-show-hunk-previous
;; C-x v }  diff-hl-show-hunk-next

;; ;; Fixing Git fringe colors
;; (require 'diff-hl)
;; (set-face-background 'diff-hl-insert "#262")
;; (set-face-background 'diff-hl-delete "#622")
;; (set-face-background 'diff-hl-change "#266")

  ;; :init
  ;; (set-face-background 'diff-hl-insert "#262")
  ;; (set-face-background 'diff-hl-delete "#622")
  ;; (set-face-background 'diff-hl-change "#266")
