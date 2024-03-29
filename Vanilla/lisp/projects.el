(p! projectile
  :straight t
  :bind
  ("C-c p f" . projectile-find-file)
  ("C-c p d" . projectile-find-dir)
  ("C-c p b" . projectile-switch-to-buffer)
  :config
  ;; (setq projectile-keymap-prefix (kbd "C-c p"))
  ;; (define-key projectile-mode-map (kbd "C-c p") projectile-command-map)
  (projectile-mode +1))




(p! org-projectile
  :straight t
  :after org
  :bind
  ("C-c p O" . org-projectile-project-todo-completing-read)
  ("C-c p o" . org-projectile-capture-for-current-project)
  ("C-c p a" . my-org-projectile-agenda)
  ("C-c p A" . my-org-projectile-agenda-files)
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
