(defun my/get-dbg-file-path ()
  "Get the file path for the debug file in the current project.
Returns a string with the path: <current_project_root>/debug.el
"
  (let ((curr-proj-root (nth 2 (project-current)))
        (file-name "debug.el"))
    (let ((dbg-file-path (file-name-concat curr-proj-root file-name)))
      dbg-file-path)))

(defun my/get-dbg-program ()
  "Loads the debug file and gets the value of defvar program in it.
Returns a strint with the value of program variable of that file.
The value of program variable should be the path to you executable.
Add this line to your <project_root>/debug.el: (defvar program \"my_program_path\")"
  (load-file (my/get-dbg-file-path))
    program)

(defun my/get-dbg-cwd ()
  "Loads the debug file and gets the value of defvar cwd in it.
Returns a string with the value of cwd variable of that file.
The value of cwd variable should be the path to the desired working directory for the debugger.
Add this line to your <project_root>/debug.el: (defvar cwd \"my_cwd_paht\")"
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
                 ))
  (add-to-list 'dape-configs
               `(my/gdb
                 ensure (lambda (config)
                          (dape-ensure-command config)
                          (let* ((default-directory
                                  (or (dape-config-get config 'command-cwd)
                                      default-directory))
                                 (command (dape-config-get config 'command))
                                 (output (shell-command-to-string (format "%s --version" command)))
                                 (version (save-match-data
                                            (when (string-match "GNU gdb \\(?:(.*) \\)?\\([0-9.]+\\)" output)
                                              (string-to-number (match-string 1 output))))))
                            (unless (>= version 14.1)
                              (user-error "Requires gdb version >= 14.1"))))
                 modes (c-mode c-ts-mode c++-mode c++-ts-mode hare-mode hare-ts-mode)
                 command-cwd dape-command-cwd
                 command "gdb"
                 command-args ("--interpreter=dap")
                 :request "launch"
                 :program (my/get-dbg-program)
                 :cwd (my/get-dbg-cwd)
                 :args []
                 :stopAtBeginningOfMainSubprogram nil)))
