(p! magit
  :straight t
  :config
  (setenv "GIT_ASKPASS" "/home/arya/Documents/Org/Scripts/gitaskpass.sh")
  (setq transient-default-level 5)
  :bind
  ("C-x g" . magit)
  ("C-c g g" . magit)
  :commands magit)

(p! git-timemachine
  :straight t
  :bind
        ("C-c g t" . git-timemachine)
  )

(p! diff-hl
  :straight t
  :config
  (global-diff-hl-mode))

(p! forge
  :straight t
  :after magit
  :config
  (load "~/Documents/Org/
  )
