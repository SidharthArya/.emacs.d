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
(use-package helm
  :straight t
  :straight helm-descbinds
  :custom
  (helm-ff-file-name-history-use-recentf t)
  (recentf-max-menu-items 100)
  (recentf-max-saved-items 100)
  :bind
  ("C-x C-f" . helm-find-files)
  ("M-x" . helm-M-x)
  ("C-x b" . helm-mini)
  ("C-h v" . helpful-variable)
  ("C-h f" . helpful-function)
  ("C-h k" . helpful-key)
  (:map helm-map
        ("TAB" . helm-execute-persistent-action)
        ("<backtab>" . helm-select-action)
        ("<C-tab>" . helm-select-action)
        ("C-o" . helm-select-action)
        )
  (:map space-prefix
        ("b b" . helm-mini)
        ("f j" . jump-to-register)
        ("b d" . kill-current-buffer)
        ;; ("b B" . helm-filtered-bookmarks)
        ("f b" . helm-bookmarks)
        ("f f" . helm-find-files)
        ("f d" . dired)
        ("f c" . my-find-config)
        ("f C" . my-find-system-config)
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

(defun my-find-config()
  (interactive)
  (helm  :sources (helm-build-sync-source "Config: "
                    :candidates (split-string (string-trim (shell-command-to-string "ls ~/.emacs.d/lisp")))
            :action
            '(
              ("Find File" . (lambda(c) (find-file (concat "~/.emacs.d/lisp/" c))) )))))

(defun my-find-system-config()
  (interactive)
  (helm :sources (helm-build-sync-source  "System Config: " :candidates (split-string (string-trim (shell-command-to-string "fd --base-directory=/home/arya/.files")))
            :action
            '(
              ("Find File" . (lambda(c) (find-file (concat "~/.files/" c))))))))
