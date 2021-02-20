(use-package magit
  :straight t
  :bind
  (:map space-prefix
  ("g g" . magit)
  ("g i" . magit-init)
  ("g s" . magit-stage)
  ("g z" . magit-stash)
  ("g d" . magit-diff)
  ("g f" . magit-fetch)
  ("g b" . magit-blame)
  ("g B" . magit-bisect)
  ("g R" . magit-remote)
  ("g r" . magit-run)
  ("g p" . magit-push)
  ("g P" . magit-pull)
  ("g C-p" . magit-patch)
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
