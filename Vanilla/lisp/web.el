(use-package browse-rules
  :straight  (browse-rules :type git :host github :repo "SidharthArya/browse-rules.el" :files (:defaults))
  :custom
  (browse-url-browser-function 'browse-rules-url)
  (browse-rules '(
                  (".*" t "qutebrowser" "%s")
                  ;;         (".*\.csv$" t "localc" "%s")
                  ;;                      (".*\.DAT.*" t "localc" "%s")
                  (".*thehindu.*" t "qutebrowser" "https://outline.com/%s")
                  (".*medium.*" t "qutebrowser" "%s")
                  )))
