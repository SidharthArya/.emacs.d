(use-package recentf
  :custom
  (recentf-exclude '(
                     ".*.orhc-bibtex-cache"
                     "\#.*\#"
                     ".*~"
                     "/home/arya/.emacs.d/bookmarks"
                     "/home/arya/.emacs.d/url/cookies"
                     "/home/arya/.emacs.d/lisp/*"
                     "/usr/.*"
                     "/home/arya/Documents/Org/Roam/.*"
                     "~/Documents/Org/Roam/.*"
                     )))
        ("f C" . my-find-system-config)
        ("f c" . my-find-config)
        ("f r" . helm-recentf)
        ("x" . helm-M-x)
        ;; b
        
        ("b k" . kill-current-buffer)
        ("b d" . kill-current-buffer)
        ("b b" . helm-mini)
        ("b s" . save-buffer)
        ("b x" . (lambda () (interactive) (switch-to-buffer (startup--get-buffer-create-scratch))))
        ("b [" . previous-buffer)
        ("b ]" . next-buffer)
        ("b z" . bury-buffer)
        ;; P
        ("P p" . helm-list-emacs-process)
        ("P d" . helm-top)
        ("P k" . helm-top)
        )
        
  :config
  (require 'helm-find)
  (require 'helm-config)
  (helm-mode 1)
  (require 'helm-descbinds)
  (helm-descbinds-mode)
  )

(use-package helm-system-packages
  :straight helm-system-packages)
;; (use-package helm-org-rifle
;;   :straight helm-org-rifle)
(use-package helm-swoop
  :straight t
  :bind
  (:map space-prefix
        ("/" . helm-swoop)
        ("\?" . helm-multi-swoop)
        ))

(use-package helm-projectile
  :after projectile
  :straight t
  :straight helm-rg
  :bind
  (:map space-prefix
        ("p p" . helm-projectile)
        ("p q" . projectile-kill-buffers)
        ("p R" . helm-projectile-recentf)
        ("p g" . projectile-vc)
        ("p d" . projectile-run-gdb)
        ("p r" . projectile-run-project)
        ("p e" . projectile-run-command-in-root)
        ("p E" . projectile-run-eshell)
        ("p !" . projectile-run-shell-command-in-root)
        ("p &" . projectile-run-async-shell-command-in-root)
        ("p b" . helm-projectile-switch-to-buffer)
        ("p P" . helm-projectile-switch-project)
        ("p s" . projectile-run-shell)
        ("p t" . projectile-run-vterm)
        ("p \?" . helm-projectile-rg)
        ("p /" . helm-multi-swoop-projectile)
        ("p f" . helm-projectile-find-file)
        ("p F" . helm-projectile-find-file-in-known-projects)
        ("p c" . projectile-compile-project)
        ("p C" . projectile-configure-project)
        ("p C-s" . projectile-save-project-buffers))
  :config
  (helm-projectile-on))

