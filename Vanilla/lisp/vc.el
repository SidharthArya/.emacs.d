(use-package magit
  :straight t
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
