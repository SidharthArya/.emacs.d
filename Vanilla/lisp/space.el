(bind-keys
 :prefix-map space-prefix
 :prefix "M-SPC")
(when (modular-config-modules-loaded-p 'org)
  (bind-keys
   :prefix-map org-prefix
   :prefix "M-SPC o"
   ("a" . org-agenda)
   ("c" . org-capture)))

(when (modular-config-modules-loaded-p 'files)
  (bind-keys
   :prefix-map file-prefix
   :prefix "M-SPC f"
   ("f" . find-file)
   ("r" . counsel-recentf))
  )
(when (modular-config-modules-loaded-p 'projects)
  (define-key global-map (kbd "M-SPC p") 'projectile-command-map)
  (bind-keys :map projectile-command-map
             ("p" . counsel-projectile-switch-project) 
             ("f" . counsel-projectile-find-file) 
             ("d" . counsel-projectile-find-dir)))

(when (modular-config-modules-loaded-p 'ivy)
  (bind-keys
   :prefix-map buffer-prefix
   :prefix "M-SPC b"
   ("k" . kill-current-buffer)
   ("b" . counsel-switch-buffer)
   ("n" . counsel-switch-buffer)
   ("B" . ibuffer))
  )
(when (modular-config-modules-loaded-p 'vi)
  (evil-define-key 'normal 'global (kbd "SPC") 'space-prefix)
  (evil-define-key 'normal 'dashboard-mode-map (kbd "SPC") 'space-prefix))
