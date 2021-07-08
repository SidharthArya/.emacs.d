(use-package magit
  :config
  (setenv "GIT_ASKPASS" "/home/arya/Documents/Org/Scripts/gitaskpass.sh")
  (setq transient-default-level 5)
  :bind
  ("C-x g" . magit)
  (:map space-prefix
  ("g g" . magit))
  :commands magit)

(use-package git-timemachine
  :bind
  (:map space-prefix
        ("g t" . git-timemachine)
        )
  )

(use-package diff-hl
  :config
  (global-diff-hl-mode))
