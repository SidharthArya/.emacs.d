(use-package projectile
  :straight t
  :custom
  (projectile-completion-system 'helm)
  :config
  (projectile-mode +1))




(use-package org-projectile
  :straight t
  :after org
  :bind (:map space-prefix
              ("p O" . org-projectile-project-todo-completing-read)
              ("p o" . org-projectile-capture-for-current-project)
              ("p a" . my-org-projectile-agenda)
              ("p A" . my-org-projectile-agenda-files))
              
    :config
    (setq org-projectile-projects-file "~/Documents/Org/Agenda/projects.org")
    (org-projectile-per-project)

  (defun my-org-projectile-agenda()
    (interactive)
    (let*
        ((org-agenda-files (list org-projectile-projects-file (concat (projectile-project-root) org-projectile-per-project-filepath))))
      (org-agenda)))
    (defun my-org-projectile-check-file(a)
      ""
       (let* ((file (concat a org-projectile-per-project-filepath)))
                                                                                    (if (file-exists-p file)
                                                                                        file)
                                                                                    ))
  (defun my-org-projectile-agenda-files()
    (interactive)
    (let*
        ((org-agenda-files (append (list org-projectile-projects-file) (delete nil (mapcar 'my-org-projectile-check-file projectile-known-projects)))))
                                                                                       
                                 (org-agenda)))

         
    (push (org-projectile-project-todo-entry) org-capture-templates))
