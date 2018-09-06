;; my-methods.el
(setq my-command-buffer-hooks (make-hash-table))

(defun my-command-on-save-buffer (c)
  "Run a command <c> every time the buffer is saved "
  (interactive "sShell command: ")
  (puthash (buffer-file-name) c my-command-buffer-hooks))

(defun my-command-buffer-kill-hook ()
  "Remove a key from <command-buffer-hooks> if it exists"
  (remhash (buffer-file-name) my-command-buffer-hooks))

(defun my-command-buffer-run-hook ()
  "Run a comand if it exists in the hook"
  (let ((hook (gethash (buffer-file-name) my-command-buffer-hooks)))
    (when hook
      (shell-command hook))))
  
;; add hooks
(add-hook 'kill-buffer-hook 'my-command-buffer-kill-hook)
(add-hook 'after-save-hook 'my-command-buffer-run-hook)

;; eshell
;; Stolen from here: http://www.howardism.org/Technical/Emacs/eshell-fun.html
(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(defun eshell/x ()
  (insert "exit")
  (eshell-send-input)
  (delete-window))
