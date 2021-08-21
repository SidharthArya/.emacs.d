(bind-keys
 :prefix-map space-prefix
 :prefix "M-SPC")

 ;; (when (modular-config-modules-loaded-p 'org)
;;   (bind-keys
  
  



(bind-keys
 :map space-prefix
 ("S t" . helm-world-time)
 ("S s" . helm-system-packages))

(when (modular-config-modules-loaded-p 'vi)
  (evil-define-key 'normal 'global (kbd "SPC") 'space-prefix)
  (evil-define-key 'normal 'dashboard-mode-map (kbd "SPC") 'space-prefix)
  (evil-define-key '(normal visual motion insert) 'global (kbd "C-c") 'space-prefix)
  (evil-define-key
  'normal org-agenda-mode-map
  "t" 'org-agenda-todo
  "p" 'org-agenda-set-property
  "TAB" 'org-agenda-goto
  "r" 'org-agenda-redo-all
  (kbd "RET") 'org-agenda-switch-to
  "e" 'org-agenda-set-effort
  "B" 'org-agenda-bulk-action
  "M" 'org-agenda-bulk-mark
  "u" 'org-agenda-bulk-unmark
  "U" 'org-agenda-bulk-unmark-all
  "*" 'org-agenda-bulk-mark-all
  "d" 'org-agenda-deadline
  "c" 'org-agenda-capture
  "k" 'org-habit-toggle-habits
  "s" 'org-agenda-schedule
  "/" 'org-agenda-filter
  )

  )

(bind-keys
 :map space-prefix
 ("t h" . hs-minor-mode)
 ("t m" . menu-bar-mode)
 ("t t" . tool-bar-mode)
 ("t s" . scroll-bar-mode)
 ("SPC" . helm-find-files)
 ("," . helm-mini)
 (":" . helm-M-x))

(global-set-key (kbd "C-c") space-prefix)
