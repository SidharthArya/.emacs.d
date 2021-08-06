(p! vertico
  :straight t
  :bind
  ("C-c f c" . my-open-config)
  ("C-c f r" . my-open-recentf)
  :config
  (vertico-mode +1))

(defun my-open-recentf ()
    ""
    (interactive)
    (find-file (completing-read "Recent File: " recentf-list)))

  (defun my-open-config ()
    ""
    (interactive)
    (find-file  (concat "~/.emacs.d/" (completing-read "Recent File: " (cons "init.el" (mapcar (lambda (a) (concat "lisp/" a)) (directory-files "~/.emacs.d/lisp")))))))
