(use-package dashboard
  :straight t
  :custom
  (dashboard-center-content t)
  (dashboard-startup-banner 'logo)
  (dashboard-page-separator "\n\n")
  (dashboard-org-agenda-categories '("Tasks" "Appointments" "Bills"))
  (dashboard-items '(
                     ;; (agenda . 5)
                     (recents  . 10)
                     (bookmarks . 5)
                     (registers . 5)))
  :config
  (dashboard-setup-startup-hook))
