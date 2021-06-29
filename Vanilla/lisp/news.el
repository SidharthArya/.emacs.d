(modular-config-load-modules '(mount))
(use-package elfeed
  :if my-documents-mounted
  :straight t
  :straight elfeed-org
  :custom
  (elfeed-db-directory "~/.news/Feeds")
  (elfeed-sort-order
   'descending)
  (browse-url-generic-program "firefox")
  (rmh-elfeed-org-files (list "~/Documents/Org/Feeds/feeds.org"))
  :init
  (require 'elfeed-org)
  (elfeed-org)
  (define-prefix-command 'capture-map)
  ;; (bind-keys
  ;;  :prefix "c"
  ;;  :prefix-map capture-map
  ;;  ("i t" . (lambda () (interactive) (my-elfeed-send-org-protocol-command "it")))
  ;;  ("i w" . (lambda () (interactive) (my-elfeed-send-org-protocol-command "iw")))
  ;;  ("i d" . (lambda () (interactive) (my-elfeed-send-org-protocol-command "id")))
  ;;  ("i s" . (lambda () (interactive) (my-elfeed-send-org-protocol-command "is")))
  ;;  ("u t" . (lambda () (interactive) (my-elfeed-send-org-protocol-command "ut")))
  ;;  ("u w" . (lambda () (interactive) (my-elfeed-send-org-protocol-command "uw")))
  ;;  ("u s" . (lambda () (interactive) (my-elfeed-send-org-protocol-command "us")))
  ;;  ("u d" . (lambda () (interactive) (my-elfeed-send-org-protocol-command "ud"))))
  ;; (evil-define-key '(normal visual) elfeed-search-mode-map "c" capture-map)

                             
  (defun my-elfeed-send-org-protocol-command (a)
    (interactive)
    (let ((entries (elfeed-search-selected)))
      (cl-loop for entry in entries
               do
               (progn
                 (elfeed-untag entry 'unread)
                 (shell-command "WINDOW=$(xdo id -a Org) && bspc node $WINDOW -g hidden=off\; xdo activate $WINDOW" nil nil)
                 (start-process-shell-command "*org-protocol*" nil (concat "xdg-open \"org-protocol:/capture?template=P" a "&title=" (elfeed-entry-title entry) "&url=" (elfeed-entry-link entry) "\"")))
      
      (mapc #'elfeed-search-update-entry entries)
      (unless (or elfeed-search-remain-on-entry (use-region-p))
        (forward-line)))))
  (if (modular-config-modules-loaded-p '(vi))
  (evil-define-key* 'normal elfeed-search-mode-map
    "p" 'elfeed-org-protocol-emms
    "P" 'elfeed-org-protocol-emms-play))
    

  :bind
  (:map elfeed-search-mode-map
        ("C" . elfeed-search-clear-filter)
        )
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
            (elfeed-make-tagger  :entry-title '("Bitcoin" "bitcoin" "BTC" "ethereum" "Ethereum" "ETH" "DOGE" "doge" "Doge" "Litecoin" "litecoin" "LTC")
                                 :add '(crypto important)
                                 :remove 'unread))

  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger  :entry-title '"Dr. Pimple Popper"
                                 :add 'junk
                                 :remove 'unread)))
(run-at-time "04:00am" 600 'elfeed-db-save)
(defun elfeed-org-protocol-emms (enclosures play)
  ""
  (interactive (list (helm :sources (helm-build-sync-source "Entries" :candidates (mapcar (lambda (a) (cons (elfeed-entry-title a) (list (elfeed-entry-title a) (elfeed-entry-enclosures a)))) (elfeed-search-selected)))) nil))
      (browse-url (url-encode-url (concat "org-protocol:/emms?url=" (url-encode-url (car (car (car (cdr enclosures))))) "&title=" (car enclosures) "&body=" (format "%s" play)))))


(defun elfeed-org-protocol-emms-play (enclosures play)
  ""
  (interactive (list (helm :sources (helm-build-sync-source "Entries" :candidates (mapcar (lambda (a) (cons (elfeed-entry-title a) (list (elfeed-entry-title a) (elfeed-entry-enclosures a)))) (elfeed-search-selected)))) t))
      (browse-url (url-encode-url (concat "org-protocol:/emms?url=" (url-encode-url (car (car (car (cdr enclosures))))) "&title=" (car enclosures) "&body=" (format "%s" play)))))
