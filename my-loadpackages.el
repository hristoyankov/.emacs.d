;; my-loadpackages.el
(load "~/.emacs.d/my-packages.el")

(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)

(require 'zenburn-theme)
(load-theme 'zenburn t)
