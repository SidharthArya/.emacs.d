(use-package org
  ;; :if my-documents-mounted
  :straight (org :type git :fetcher github :repo "https://github.com/bzg/org-mode" :version-regexp ".*9\.3.*")
  :straight org-bullets
  :straight org-download
  :hook (org-mode . visual-line-mode)
  (org-mode . auto-save-mode)
  :init
  (defun my-org-get-score-current()

    (let* ((a (point))
           (a-pos (get-text-property a 'org-marker))
           (sa (float (string-to-number (or (org-entry-get a-pos "score_on_done") "2")))))
      (if (equal sa 68)
          2
        sa)))

  (setq org-after-todo-state-change-hook 'my-org-todo-state-change-main)
  (defun my-org-todo-state-change-main ()
    (cond
     ((equal org-state "DONE") (start-process-shell-command "DUMP POINTS" nil (concat "echo " (format "%s" (my-org-get-score-current)) ">> ~/.cache/org-points-$(date +'%Y%m%d').points")))
     ((equal org-state "CANCELLED") (start-process-shell-command "DUMP POINTS" nil (concat "echo " (format "%s" (- 0 (/ (my-org-get-score-current) 3))) ">> ~/.cache/org-points-$(date +'%Y%m%d').points")))
    ))

  (defun my-org-cmp-utility-property (a b)
    "Compare two `org-mode' agenda entries, `A' and `B', by some date property.

If a is before b, return -1. If a is after b, return 1. If they
are equal return t."
      (cond 
       ((< ua ub) -1)
       ((> ua ub) +1)
       ((< sa sb) -1)
       ((> sa sb) +1)
       ((< ea eb) +1)
       ((> ea eb) -1)
       (t nil)
      ))
  (defun my-org-cmp-utility-property-tool (&optional b)
    "Compare two `org-mode' agenda entries, `A' and `B', by some date property.
If a is before b, return -1. If a is after b, return 1. If they
are equal return t."
    (let* ((a (point))
           (a-pos (get-text-property a 'org-marker))
           (sa (float (string-to-number (or (org-entry-get a-pos "SCORE_ON_DONE") "2"))))
           (def (if org-agenda-sort-noeffort-is-high 60 60))
	   (ea (or (get-text-property
		    0 'effort-minutes (get-text-property a 'txt))
		   def))
           (ua (/ sa ea)))
      
      (if (equal b nil)
          (message "UA:%s, EA: %s, SA: %s" ua ea sa)
      (message "UA:%s, EA: %s, SA: %s, B: %s, CMP: %s" ua ea sa b (if (> ua b) "Above" "Below")))))
      
  (defun my-org-preprocess-priority(x)
    (cond ((equal x nil) 66)
          ((string-match "[ABC]" x) (string-to-char x))
          (t (string-to-number x))
          ))
  (defun my-org-capture-read (prompt default)
    (let* ((output (read-string (concat (symbol-name prompt) ": "))))
      (if (equal output "")
          (symbol-name default)
        output)))
  (setq org-capture-templates
        '(
          ("i" "Important")
          ("it" "Today" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %? \t:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 30\n:END:\n  %i\n  %a")
          ("iw" "Weekend" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %? \t:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"SUN\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 20\n:END:\n  %i\n  %a")
          ("is" "Schedule" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %? \t:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 20\n:END:\n  %i\n  %a")
          ("id" "Deadline" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %? \t:important:\n\tDEADLINE:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")
          ("u" "Unimportant")
          ("ut" "Today" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %(my-org-capture-read 'Entry 'Task) \t:unimportant:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")
          ("uw" "Weekend" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %(my-org-capture-read 'Entry 'Task) \t:unimportant:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"SUN\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")
          ("us" "Schedule" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %(my-org-capture-read 'Entry 'Task) \t:unimportant:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")
          ("ud" "Deadline" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %(my-org-capture-read 'Entry 'Task) \t:unimportant:\n\tDEADLINE:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")
          ("D" "Diary")
          ("Dd" "Daily Diary" entry (file+headline "~/Documents/Org/Brain/Personal/Diaries.org" "Diary")
           "* %(org-insert-time-stamp (org-read-date nil t \"\"))\n %?")
          ("Ds" "Sleep Journal" entry (file+headline "~/Documents/Org/Brain/Personal/Diaries.org" "Sleep")
           "* %(org-insert-time-stamp (org-read-date nil t \"\"))\n %?")
          ("Dw" "Work Diary" entry (file+headline "~/Documents/Org/Brain/Personal/Diaries.org" "Work")
           "* %(org-insert-time-stamp (org-read-date nil t \"\"))\n %?")
          ("Dr" "Regret" entry (file+headline "~/Documents/Org/Brain/Personal/Diaries.org" "Regrets")
           "* %?")
          ("E" "Emotions")
          ("Es" "Sensations" entry (file+headline "~/Documents/Org/Brain/Learning/Personality/EmotionalIntelligence.org" "Sensations")
           "* %? \t:drill:")
          ("P" "Protocol")
          ("Pi" "Important")
          ("Pit" "Today" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Websites")
           "* TODO %:annotation \t:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 30\n:END:\n  %i\n  %a")
          ("Piw" "Weekend" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Websites")
           "* TODO %:annotation \t:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"SUN\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 20\n:END:\n  %i\n  %a")
          ("Pis" "Schedule" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Websites")
           "* TODO %:annotation \t:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 20\n:END:\n  %i\n  %a")
          ("Pid" "Deadline" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Websites")
           "* TODO %:annotation \t:important:\n\tDEADLINE:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")
          ("Pu" "Unimportant")
          ("Put" "Today" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Websites")
           "* TODO %:annotation \t:unimportant:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")
          ("Puw" "Weekend" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Websites")
           "* TODO %:annotation \t:unimportant:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"SUN\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")
          ("Pus" "Schedule" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Websites")
           "* TODO %:annotation \t:unimportant:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")
          ("Pud" "Deadline" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Websites")
           "* TODO %:annotation \t:unimportant:\n\tDEADLINE:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")))
  :custom
  (org-agenda-custom-commands
   '(("e" "Exercises" agenda  ""
      ((org-agenda-files (list "~/Documents/Org/Agenda/exercises.org"))
       (org-super-agenda-groups
        '((:auto-category t)))
       (org-agenda-sorting-strategy '(priority-up effort-up))))
     ("A" "Agenda Important" agenda  ""
      ((org-agenda-files (list "~/Documents/Org/Agenda/notes.org"))
       (org-super-agenda-groups nil)
       (org-agenda-sorting-strategy '(priority-up effort-up))))
     ("B" "Book" todo  ""
      ((org-agenda-files (list "~/Documents/Org/Agenda/books.org"))
       (org-super-agenda-groups nil)
       (org-agenda-sorting-strategy '(ts-down priority-up effort-up))))
     ("u" "Utility Sorted Agenda" agenda ""
       ((org-agenda-cmp-user-defined 'my-org-cmp-utility-property))
      (org-agenda-sorting-strategy '(user-defined-up)))
     ("E" "Entertainment" todo  ""
      ((org-agenda-files (list "~/Documents/Org/Agenda/entertainment.org"))
       (org-super-agenda-groups nil)
       (org-agenda-sorting-strategy '(ts-up priority-up effort-up))))))
  (org-agenda-sorting-strategy
   '((agenda user-defined-down scheduled-down deadline-up priority-down effort-up)
     (todo priority-down)
     (tags priority-down)
     (search category-keep)))
  (org-duration-format '(("d" . nil) ("h" . t) ("min" . t)))
  (org-effort-durations
   `(("min" . 1)
     ("h" . 60)
     ;; eight-hour days
     ("d" . ,(* 60 8))
     ;; five-day work week
     ("w" . ,(* 60 8 5))
     ;; four weeks in a month
     ("m" . ,(* 60 8 5 4))
     ;; work a total of 12 months a year --
     ;; this is independent of holiday and sick time taken
     ("y" . ,(* 60 8 5 4 12))))
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-skip-scheduled-if-done t)
  (org-agenda-window-setup 'current-window)
  (org-babel-load-languages '((emacs-lisp . t)))
  (org-agenda-diary-file "~/Documents/Org/diary")
  (diary-file "~/Documents/Org/diary")
  (org-log-into-drawer t)
  (org-agenda-include-diary t)
  (alert-default-style 'libnotify)
  (org-alert-notification-title "Organizer")
  (org-directory "~/Documents/Org")
  (org-agenda-files '("~/Documents/Org/Agenda/notes.org" "~/Documents/Org/Agenda/habits.org" "~/Documents/Org/Agenda/books.org" "~/Documents/Org/Agenda/entertainment.org"))
  ;; (org-brain-path "~/Documents/Org/Brain")
  (org-id-track-globally t)
  (org-id-locations-file "~/Documents/Org/.org-id-locations")
  :bind
  (:map space-prefix
           ("o c" . org-capture)
           ("o a" . org-agenda)
           ("a" . org-agenda)
           ("c" . org-capture)
           ("o l" . org-store-link)
           ("o b" . org-switchb)
           ("o i" . org-insert-link)
           )
  :config
  (require 'org)
  (require 'org-tempo)
  (require 'org-protocol)

  (defun my-org-cmp-utility-property (a b)
    "Compare two `org-mode' agenda entries, `A' and `B', by some date property.

If a is before b, return -1. If a is after b, return 1. If they
are equal return t."

    (let* ((a-pos (get-text-property 0 'org-marker a))
           (b-pos (get-text-property 0 'org-marker b))
           (sa (float (string-to-number (or (org-entry-get a-pos "score_on_done") "2"))))
           (sb (float (string-to-number (or (org-entry-get b-pos "SCORE_ON_DONE") "2"))))
           (def (if org-agenda-sort-noeffort-is-high 60 60))
	   (ea (or (get-text-property
		    0 'effort-minutes (get-text-property 0 'txt a))
		   def))
	   (eb (or (get-text-property
		    0 'effort-minutes (get-text-property 0 'txt b))
		   def))
           (ua (/ sa ea))
           (ub (/ sb eb)))
      
      
      (cond 
       ((< ua ub) -1)
       ((> ua ub) +1)
       ((< ea eb) +1)
       ((> ea eb) -1)
       ((< sa sb) -1)
       ((> sa sb) +1)
       (t nil)
      )))
  ;; TEMP
  (setq org-priority-lowest org-lowest-priority)
  (setq org-priority-highest org-highest-priority)
  ;; END
  (setq-default org-startup-with-inline-images t)
  (require 'org-archive)
  (require 'org-clock)
  ;; (require 'ox-hugo)
  ;; (require 'org-hugo-auto-export-mode)
  ;; (defun org-hugo-new-subtree-post-capture-template ()
  ;;   "Returns `org-capture' template string for new Hugo post.
  ;;                 See `org-capture-templates' for more information."
  ;;   (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
  ;;          (fname (org-hugo-slug title)))
  ;;     (mapconcat #'identity
  ;;                `(,(concat "* TODO " title)
  ;;                  ":PROPERTIES:"
  ;;                  ,(concat ":EXPORT_FILE_NAME: " fname)
  ;;                  ":END:"
  ;;                  "%?\n")          ;Place the cursor here finally
  ;;                "\n")))

  (add-to-list 'org-capture-templates
               '("b"                ;`org-capture' binding + h
                 "Blog post"
                 entry
                 ;; It is assumed that below file is present in `org-directory'
                 ;; and that it has a "Blog Ideas" heading. It can even be a
                 ;; symlink pointing to the actual location of all-posts.org!
                 (file+olp "~/Documents/Org/Blog/posts.org" "Blog")
                 (function org-hugo-new-subtree-post-capture-template)))
  (setq-default org-confirm-babel-evaluate nil)
  (require 'org-habit)
  ;; (require 'org-brain)
  ;; (require 'org-drill)
  (require 'org-timer)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
  (require 'org-download)
  (add-hook 'dired-mode-hook 'org-download-enable))

(use-package org-super-agenda
  :straight org-super-agenda
  :straight org-ql
  :after org
  :custom
  (org-super-agenda-groups
   '((:name "Diary"
            :category "Diary"
            :order 1)
     (:name "Habit"
            :habit t
            :order 8)
     (:name "Remember"
            :priority "C"
            :tag "remember"
            :order 5)
     (:name "Unimportant"
            :priority "C"
            :tag "unimportant"
            :order 7)
     (:name "Deadlines"
            :deadline t
            :order 2)
     (:name "Started"
            :todo "STARTED"
            :order 4)
     (:name "Important"
            :priority "A"
            :tag ("important" "bills")
            :order 3)
     (:name "Personal"
            :tag ("movies" "tvshows" "tvseries" "books")
            :order 10)
     (:name "Overdue"
            :deadline past
            :scheduled past
            :order 6)))
  :config
  (require 'org-ql)
  (require 'org-ql-search)
  (org-super-agenda-mode +1)
  (setq org-super-agenda-header-map nil)
  )

(use-package org-roam
  :straight org-roam
  :hook
  (after-init . org-roam-mode)
  :init
  (require 'emacsql)
                                        ;(setq emacsql-sqlite-executable "~/.local/bin/emacsql-sqlite")
                                        ;(setq emacsql-sqlite3-executable "~/.local/bin/emacsql-sqlite")
  :config
  (require 'org-roam-protocol)
  :custom
  (org-roam-db-update-method 'immediate)
  (org-roam-directory "~/Documents/Org/Roam")
  (org-roam-tag-sources '(prop all-directories))
  (org-roam-db-location "~/Documents/Org/Roam/DB/org-roam.db")
  (org-roam-index-file "~/Documents/Org/Roam/DB/index.org")
  (org-roam-completion-system 'helm)
  :bind
   (:map space-prefix
   ("r l" . org-roam)
   ("r f" . org-roam-find-file)
   ("r b" . org-roam-switch-to-buffer)
   ("r t" . org-roam-tag-add)
   ("r T" . org-roam-tag-delete)
   ("r g" . org-roam-graph)
   ("r i" . org-roam-insert)
   ("r I" . org-roam-insert-immediate)))

(use-package org-roam-server
  :straight org-roam-server
  :after org
  :bind
   (:map space-prefix
   ("r s" . org-roam-server-mode))
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

(use-package org-ref
  :straight t
  :after (org helm)
  :custom
  (reftex-default-bibliography '("~/Documents/Org/references.bib"))
  (bibtex-completion-bibliography "~/Documents/Org/references.bib")
  (org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
  )
(use-package org-fc
  :straight (org-fc :type git :repo "https://git.sr.ht/~l3kn/org-fc" :files (:defaults "awk" "demo.org"))
  :after org
  :custom
  (org-fc-directories '("~/Documents/Org/Roam" "~/Documents/Org/Brain")))
;; (use-package elgantt
;;   :straight elgantt)
;; (use-package org-protocol-capture-html
;;   :straight org-protocol-capture-html)


