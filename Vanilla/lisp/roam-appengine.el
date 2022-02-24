(modular-config-load-modules '(org custom))
(p! emacsql-sqlite3
  :straight t)
(require 'org-roam)
(org-roam-ui-open)
