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
  (evil-set-
    ("C-c t" . treemacs))
