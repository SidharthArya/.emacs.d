(use-package magit
  :straight t
  :bind
  (:map space-prefix
  ("g g" . magit)
  ("g i" . magit-init)
  ("g s" . magit-status)
  ("g S" . magit-stage)
  ("g d" . magit-diff)
  ("g r" . magit-run)
  ("g p" . magit-push)
  ("g P" . magit-pull)
  ("g c" . magit-commit)
  ("g C" . magit-clone))
  :commands magit)

(use-package git-timemachine
  :straight t
  :bind
  (:map space-prefix
        ("g t" . git-timemachine)
        )
  )
