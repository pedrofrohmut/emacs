(defun my/get-dbg-file-path ()
  "Get the file path for the debug file in the current project"
  (let ((curr-proj-root (nth 2 (project-current)))
        (file-name "debug.el"))
    (let ((dbg-file-path (file-name-concat curr-proj-root file-name)))
      dbg-file-path)))

(defun my/get-dbg-program ()
  "Get the program path from the debug file"
  (load-file (my/get-dbg-file-path))
    program)

(defun my/get-dbg-cwd ()
  "Get the cwd path from the debug file"
  (load-file (my/get-dbg-file-path))
  cwd)

;; Dape ########################################################################

(use-package dape
  :ensure t
  :defer t
  :bind
  (("<f5>" . dape)
   ("<f7>" . dape-breakpoint-toggle)
   ("<f8>" . dape-continue)
   ("<f10>" . dape-next)
   ("<f11>" . dape-step-in)
   ("<f12>" . dape-step-out))
  :config
  (setq dape-adapters
        '(gdb . ((command . "gdb")
                 (args . ("--interpreter=mi")))))
  (add-to-list 'dape-configs
               `(my/netcoredbg
                 modes (csharp-mode csharp-ts-mode)
                 ensure dape-ensure-command command "netcoredbg"
                 command-args ["--interpreter=vscode"]
                 :program (my/get-dbg-program)
                 :cwd (my/get-dbg-cwd)
                 :request "launch"
                 :stopAtEntry nil
                 :kill t ;; Kill the netcoredbg process when ending the session
                 )))
