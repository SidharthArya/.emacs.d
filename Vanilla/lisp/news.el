(modular-config-load-modules '(mount))
(use-package elfeed
  :if my-documents-mounted
  :ensure t
  :ensure remyhonig/elfeed-org
  :custom
  (elfeed-db-directory "~/Private/News/Feeds")
  (elfeed-sort-order
   'descending)
  (browse-url-generic-program "firefox")
  (rmh-elfeed-org-files (list "~/Documents/Org/Feeds/feeds.org"))
  :init
  (require 'elfeed-org)
  (elfeed-org)

  :config
  (setq-default elfeed-search-filter  (if
                                          (<= (string-to-number (format-time-string "%u")) 5)
                                          "@2-days-ago -unimportant +unread +important"
                                        "@1-week-ago +unread +important"))
                                        ; (start-process "*Youtube*" nil "/home/arya/.local/scripts/elfeed-youtube" "get")
                                        ; (start-process "*Mpv*" nil "/home/arya/.local/scripts/elfeed-youtube" "vlc")
  (add-to-list 'kill-emacs-hook 'elfeed-db-unload)

  (defun my-elfeed-feed-sort (a b)
    (let* ((a-tags (format "%s" (elfeed-entry-feed a)))
           (b-tags (format "%s" (elfeed-entry-feed b))))
      (if (string= a-tags b-tags)
          (< (elfeed-entry-date b) (elfeed-entry-date a)))
      (string< a-tags b-tags)))
  (setf elfeed-search-sort-function #'my-elfeed-feed-sort)


            ;;; HOOKS
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger  :entry-title '"ASL Video Series"
                                 :add 'junk
                                 :remove 'unread))


  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger  :entry-title '"Dr. Pimple Popper"
                                 :add 'junk
                                 :remove 'unread)))
(run-at-time "04:00am" 600 'elfeed-db-save)
