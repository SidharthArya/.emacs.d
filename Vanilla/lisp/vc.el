(use-package magit
  :straight t
  :config
  (setenv "GIT_ASKPASS" "/home/arya/Documents/Org/Scripts/gitaskpass.sh")
  (setq transient-default-level 5)
  :bind
  (:map space-prefix
  ("g g" . magit))
  :commands magit)

(use-package git-timemachine
  :straight t
  :bind
  (:map space-prefix
        ("g t" . git-timemachine)
        )
  )

(use-package diff-hl
  :straight t
  :config
  (global-diff-hl-mode))
