(p! selectrum
  :ensure t
  :bind
  ("C-c f r" . selectrum-open-file-recent)
  ("C-c f f" . find-file)
  ("C-c f c" . selectrum-open-file-emacs-config)
  :config
  (defun selectrum-open-file-recent ()
    ""
    (interactive)
    (find-file (completing-read "Recent File: " recentf-list)))
  (defun selectrum-open-file-emacs-config ()
    ""
    (interactive)
    (find-file  (concat "~/.emacs.d/" (completing-read "Recent File: " (cons "init.el" (mapcar (lambda (a) (concat "lisp/" a)) (directory-files "~/.emacs.d/lisp")))))))
  (selectrum-mode +1))
(p! selectrum-prescient
  :ensure t
  :config
  (selectrum-prescient-mode +1)
(prescient-persist-mode +1))
