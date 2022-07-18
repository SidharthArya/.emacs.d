(p! browse-rules
  :straight (browse-rules :fetcher github :repo "https://github.com/SidharthArya/browse-rules.el")
  :custom
  (browse-url-browser-function 'browse-rules-url)
  (browse-rules '(
                  (".*" t "luakit" "%s")
                  ;;         (".*\.csv$" t "localc" "%s")
                  ;;                      (".*\.DAT.*" t "localc" "%s")
                  (".*thehindu.*" t "luakit" "https://outline.com/%s")
                  (".*medium.*" t "luakit" "%s")
                  (".*mp3.*" t "emacsclient" "%s")
                  (".pdf" nil browse-url-default-browser "%s")

                  )))
