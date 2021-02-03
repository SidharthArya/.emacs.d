(use-package dashboard
  :ensure t
  :custom
  (dashboard-center-content t)
  (dashboard-startup-banner 'logo)
  (dashboard-page-separator "\n\n")
  (dashboard-org-agenda-categories '("Tasks" "Appointments" "Books" "Movies" "Bills"))
  (dashboard-items '(
                     (agenda . -1)
                     (recents  . 5)
                     (bookmarks . 5)
                     (registers . 5)))
  :config (dashboard-setup-startup-hook))
