;; ~/.emacs.d/init.el

;; (package-initialize)

(load "~/.emacs.d/my-loadpackages.el")

(add-hook
 'after-init-hook
 '(lambda ()
    (load "~/.emacs.d/my-noexternals.el")
    ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (yasnippet magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
