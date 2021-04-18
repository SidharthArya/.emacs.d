(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(helm-minibuffer-history-key "M-p")
 '(ledger-reports
   '(("forecastr" "%(binary) -f %(ledger-file) --forecast=\"d<[next year]\" reg")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)")))
 '(org-agenda-files '("~/Documents/Org/Agenda/projects.org") nil nil "Customized with use-package org")
 '(org-export-backends '(ascii beamer html icalendar latex odt))
 '(safe-local-variable-values
   '((org-roam-db-location . "./DB/org-roam.db")
     (org-roam-index-file . "./DB/index.org")
     (org-roam-directory . ".")
     (org-roam-index-file . "~/Documents/Org/Roamers/Personal/DB/index.org")
     (org-roam-db-location . "~/Documents/Org/Roamers/Personal/DB/org-roam.db")
     (org-roam-tag-sources quote
                           (prop all-directories))
     (org-roam-directory . "~/Documents/Org/Roamers/Personal")
     (org-roam-graph-viewer . "/usr/bin/xdg-open")
     (org-roam-index-file "~/Documents/Org/Roamers/Personal/DB/index.org")
     (org-roam-db-location "~/Documents/Org/Roamers/Personal/DB/org-roam.db")
     (org-roam-tag-sources
      '(prop all-directories))
     (org-roam-directory "~/Documents/Org/Roamers/Personal")
     (org-roam-graph-viewer "/usr/bin/xdg-open")))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight normal :height 115 :width normal)))))
