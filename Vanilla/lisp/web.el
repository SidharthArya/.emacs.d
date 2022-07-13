(p! browse-rules
  :straight (browse-rules :fetcher github :repo "https://github.com/SidharthArya/browse-rules.el")
  :custom
  (browse-url-browser-function 'browse-rules-url)
  (browse-rules (list
                  (".*" t (if (equal (system-name) "linux.local") "google-chrome-stable" "qutebrowser") "%s")
                  ;;         (".*\.csv$" t "localc" "%s")
                  ;;                      (".*\.DAT.*" t "localc" "%s")
                  (".*thehindu.*" t "qutebrowser" "https://outline.com/%s")
                  (".*medium.*" t "qutebrowser" "%s")
                  (".*mp3.*" t "emacsclient" "%s")
                  (".pdf" nil browse-url-default-browser "%s")

                  )))
