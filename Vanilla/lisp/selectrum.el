(p! selectrum
  :ensure t
  :bind
  ("C-c f r" . selectrum-open-file-recent)
  :config
  (defun selectrum-open-file-recent ()
    ""
    (interactive)
    (find-file (completing-read "Recent File: " recentf-list)))
  (selectrum-mode +1))
(p! selectrum-prescient
  :ensure t
  :config
  (selectrum-prescient-mode +1)
(prescient-persist-mode +1))
