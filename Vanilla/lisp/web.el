(p! browse-rules
  :straight (browse-rules :fetcher github :repo "https://github.com/SidharthArya/browse-rules.el")
  :custom
  (browse-url-browser-function 'browse-rules-url)
  (browse-rules '(
                  (".*" t "google-chrome-stable" "%s")
                  ;;         (".*\.csv$" t "localc" "%s")
                  ;;                      (".*\.DAT.*" t "localc" "%s")
                  (".*thehindu.*" t "google-chrome-stable" "https://outline.com/%s")
                  (".*medium.*" t "google-chrome-stable" "%s")
                  (".*mp3.*" t "emacsclient" "%s")
                  (".pdf" nil browse-url-default-browser "%s")

                  )))
