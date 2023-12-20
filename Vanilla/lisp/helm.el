(use-package recentf
  :custom
  (recentf-exclude  (
                     "\#.*\#"
                     ".*~"
                     "/home/arya/.emacs.d/bookmarks"
                     "/home/arya/.emacs.d/url/cookies"
                     "/home/arya/.emacs.d/lisp/*"
                     "/usr/.*"
                     "/home/arya/Documents/Org/Roam/.*"
                     "/home/arya/Documents/Zettel/people/.*"
                     "~/Documents/Org/Roam/.*"
                     )))
(p! helm
  :custom
  (helm-ff-file-name-history-use-recentf t)
  (recentf-max-menu-items 100)
  (recentf-max-saved-items 100)
  :bind
  ("C-c i" . helm-imenu)
  ("C-x C-f" . helm-find-files)
  ("M-x" . helm-M-x)
  ("C-x b" . helm-mini)
  ("C-h v" . helpful-variable)
  ("C-h f" . helpful-function)
  ("C-h k" . helpful-key)
  ("C-c b b" . helm-mini)
  ("C-c f j" . jump-to-register)
  ("C-c b d" . kill-current-buffer)
  ;;C-c  ("b B" . helm-filtered-bookmarks)
  ("C-c f b" . helm-bookmarks)
  ("C-c f f" . helm-find-files)
  ("C-c f d" . dired)
  ("C-c f c" . my-find-config)
  ("C-c f C" . my-find-system-config)
  ("C-c f r" . helm-recentf)
  ("C-c x" . helm-M-x)
  
  ("C-c b k" . kill-current-buffer)
  ("C-c b d" . kill-current-buffer)
  ("C-c b b" . helm-mini)
  ("C-c b s" . save-buffer)
  ("C-c b x" . (lambda () (interactive) (switch-to-buffer (startup--get-buffer-create-scratch))))
  ("C-c b [" . previous-buffer)
  ("C-c b ]" . next-buffer)
  ("C-c b z" . bury-buffer)
  ;;C-c  P
  ("C-c P p" . helm-list-emacs-process)
  ("C-c P d" . helm-top)
  ("C-c P k" . helm-top)
  (:map helm-map
        ("TAB" . helm-execute-persistent-action)
        ("<backtab>" . helm-select-action)
        ("<C-tab>" . helm-select-action)
        ("C-o" . helm-select-action)
        )
  :config
  (require 'helm-find)
  ;;(require 'helm-config)
  (helm-mode +1)
  )

(use-package helm-descbinds
  :straight t
  :config
  (helm-descbinds-mode))

(use-package helm-system-packages)
;; (use-package helm-org-rifle
;;   :straight helm-org-rifle)
(use-package helm-swoop
  :straight t
  :bind
  ("C-c /" . helm-swoop)
  ("C-c \?" . helm-multi-swoop))

(defun my-find-system-config()
  (interactive)
  (helm :sources (helm-build-sync-source  "System Config: " :candidates (split-string (string-trim (shell-command-to-string "fd --base-directory=/home/arya/.files")) "\n")
            :action
            '(
              ("Find File" . (lambda(c) (find-file (concat "~/.files/" c))))))))

  (defun my-find-config ()
    ""
    (interactive)
    (helm :sources (helm-build-sync-source "Config File: " :candidates (cons "init.el" (mapcar (lambda (a) (concat "lisp/" a)) (directory-files "~/.emacs.d/lisp")))
          :action
          '(("Find File" . (lambda (c) (find-file (concat "~/.emacs.d/" c)))))
          )))
(use-package helm-rg
  :straight t)


