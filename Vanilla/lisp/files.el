(p! dired
  :custom
  (dired-listing-switches "-alh -v --group-directories-first")
  (dired-actual-switches "-alh -v --group-directories-first")
  :bind
  (:map space-prefix
        ("d d" . dired)
        ("d c" . dired-do-copy)
        ("d s" . dired-do-symlink)
        )
  )

(p! treemacs :straight t
  :config
  :bind
  ("C-c t t" . treemacs)
  ("C-c T r p" . treemacs-remove-project-from-workspace)
  ("C-c T s" . treemacs-switch-workspace)
  ("C-c T n" . treemacs-create-workspace)
  ("C-c T a" . treemacs-add-project)
  )
