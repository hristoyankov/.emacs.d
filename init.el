;; ~/.emacs.d/init.el

;; (package-initialize)
(load "~/.emacs.d/my-loadpackages.el")

(add-hook
 'after-init-hook
 '(lambda ()
    (load "~/.emacs.d/my-noexternals.el")
    ))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
