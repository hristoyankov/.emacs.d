;; ~/.emacs.d/init.el
(add-hook
 'after-init-hook
 '(lambda ()
    (load "~/.emacs.d/my-noexternals.el")
    ))

