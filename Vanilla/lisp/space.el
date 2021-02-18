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
   ("f" . helm-find-files)
   ("E" . helm-find-files)
   ("b" . helm-bookmarks)
   ("r" . helm-recentf))
  (bind-keys
   :prefix-map p-prefix
   :prefix "M-SPC p"
   ("k" . helm-top)
   ("d" . helm-top)
   )
  (bind-keys
   :prefix-map search-prefix
   :prefix "M-SPC /"
   ("/" . helm-swoop)
   ("m" . helm-multi-swoop)
   )
  (bind-keys
   :prefix-map d-prefix
   :prefix "M-SPC d"
   ("t" . helm-world-time)
   ("s" . helm-system-packages)
   )
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
   ("[" . previous-buffer)
   ("]" . next-buffer)
   ("b" . counsel-switch-buffer)
   ("n" . counsel-switch-buffer)
   ("B" . ibuffer))
  )
(when (modular-config-modules-loaded-p 'vi)
  (evil-define-key 'normal 'global (kbd "SPC") 'space-prefix)
  (evil-define-key 'normal 'dashboard-mode-map (kbd "SPC") 'space-prefix))

(when (modular-config-modules-loaded-p 'helm)
  (bind-keys
   :prefix-map buffer-prefix
   :prefix "M-SPC b"
   ("k" . kill-current-buffer)
   ("d" . kill-current-buffer)
   ("b" . helm-mini)
   ("s" . save-buffer)
   ("x" . (lambda () (interactive) (switch-to-buffer (startup--get-buffer-create-scratch))))
   ("[" . previous-buffer)
   ("]" . next-buffer)
   ("z" . bury-buffer)
   )
  )


(when (modular-config-modules-loaded-p 'vc)
  (bind-keys
   :prefix-map g-map
   :prefix "M-SPC g"
   ("c" . magit-commit)
   ("C" . magit-clone)
   ))
