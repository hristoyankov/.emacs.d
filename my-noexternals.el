;; ~/.emacs.d/my-noexternals.el

;; Remove scrollbars, menu bars, and toolbars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Wind-move
(global-set-key (kbd "C-c C-b") 'windmove-left)
(global-set-key (kbd "C-c C-n") 'windmove-down)
(global-set-key (kbd "C-c C-p") 'windmove-up)
(global-set-key (kbd "C-c C-f") 'windmove-right)

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


