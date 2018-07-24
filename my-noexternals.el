;; ~/.emacs.d/my-noexternals.el

;; Remove scrollbars, menu bars, and toolbars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Wind-move
(global-set-key (kbd "C-c C-j") 'windmove-left)
(global-set-key (kbd "C-c C-k") 'windmove-down)
(global-set-key (kbd "C-c C-l") 'windmove-up)
(global-set-key (kbd "C-c C-;") 'windmove-right)

;; Deal with meta and super.
;; See bbatsov post http://batsov.com/articles/2012/10/14/emacs-on-osx/
(defun swap-meta-and-super ()
  "Swap the mapping of meta and super. Very useful for people using their Mac
with a Windows external keyboard from time to time."
  (interactive)
  (if (eq mac-command-modifier 'super)
      (progn
        (setq mac-command-modifier 'meta)
        (setq mac-option-modifier 'super)
        (message "Command is now bound to META and Option is bound to SUPER."))
    (progn
      (setq mac-command-modifier 'super)
      (setq mac-option-modifier 'meta)
      (message "Command is now bound to SUPER and Option is bound to META."))))

;; When on Mac and in GUI mode swap them by default.
(when (and (display-graphic-p)
	   (string-equal system-type "darwin"))
  (progn
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'super)
    (message "Command is now bound to META and Option is bound to SUPER.")))
  
(global-set-key (kbd "C-c w") 'swap-meta-and-super)

;; Update path
(setq exec-path (append exec-path '("~/bin")))

;; Eshell shortcuts
(global-set-key (kbd "C-!") 'eshell-here)
(global-set-key (kbd "C-x M-s") 'eshell)

;; Enable integration with linux clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; Start emacs maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized)) 

;; Set default backup-directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )
