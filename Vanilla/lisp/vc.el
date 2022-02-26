(p! magit
  :straight t
  :config
  (setenv "GIT_ASKPASS" "/home/arya/Documents/Org/Scripts/gitaskpass.sh")
  (defun org-roam--auto-commit()
    ""
    (interactive)
    (magit-call-git "add" (buffer-file-name))
    (magit-call-git "commit" "-m" (car (cdr (car (org-collect-keywords '("TITLE"))))))
    (magit-run-git-async "push"))
  (add-to-list 'safe-local-variable-values '(after-save-hook . org-roam--auto-commit))
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
  (when (file-exists-p "~/Documents/Work/Config/work.el")
      (load "~/Documents/Work/Config/work.el")))
