(set-frame-parameter nil 'title "Org")
(unless (string-match "org-google-tasks-get-tokens" (format "%s" timer-list))
  (run-at-time nil 3600  'org-google-tasks-get-tokens))
