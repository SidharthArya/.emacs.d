(use-package browse-rules
  :ensure SidharthArya/browse-rules.el
  :custom
  (browse-url-browser-function 'browse-rules-url)
  (browse-rules '(
                  (".*" t "qutebrowser" "%s")
                  ;;         (".*\.csv$" t "localc" "%s")
                  ;;                      (".*\.DAT.*" t "localc" "%s")
                  (".*thehindu.*" t "qutebrowser" "https://outline.com/%s")
                  (".*medium.*" t "qutebrowser" "%s")
                  )))
