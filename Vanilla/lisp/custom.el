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
 '(org-duration-units
   `(("min" . 1)
     ("h" . 60)
     ("d" \,
      (* 60 8))
     ("w" \,
      (* 60 8 5))
     ("m" \,
      (* 60 8 5 4))
     ("y" \,
      (* 60 8 5 4 12))) nil nil "Customized with use-package org")
 '(org-export-backends '(ascii beamer html icalendar latex odt))
 '(safe-local-variable-values
   '((org-roam-index-file . "~/Documents/Org/Roamers/Personal/DB/index.org")
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
 '(tool-bar-mode nil)
 '(transient-mark-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight normal :height 95 :width normal)))))
