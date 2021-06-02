(modular-config-load-modules '(mount))
(use-package org
  ;; :if my-documents-mounted
  :straight t
  :hook (org-mode . visual-line-mode)
  (org-mode . auto-save-mode)
  :custom
  (org-capture-templates
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
           "* TODO %? \t:unimportant:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 30\n:END:\n  %i\n  %a")
          ("uw" "Weekend" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %? \t:unimportant:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"SUN\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 20\n:END:\n  %i\n  %a")
          ("us" "Schedule" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %? \t:unimportant:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 20\n:END:\n  %i\n  %a")
          ("ud" "Deadline" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %? \t:unimportant:\n\tDEADLINE:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")
          ("D" "Diary")
          ("Dd" "Daily Diary" entry (file+headline "~/Documents/Org/Brain/Personal/Diaries.org" "Diary")
           "* %(org-insert-time-stamp (org-read-date nil t \"\"))\n %?")
          ("Dm" "Meditation Diary" entry (file+headline "~/Documents/Org/Brain/Personal/Meditation.org" "Diary")
           "* %(org-insert-time-stamp (org-read-date nil t \"\"))\n %?")
          ("Ds" "Sleep Journal" entry (file+headline "~/Documents/Org/Brain/Personal/Diaries.org" "Sleep")
           "* %(org-insert-time-stamp (org-read-date nil t \"\"))\n %?")
          ("Dw" "Work Diary" entry (file+headline "~/Documents/Org/Brain/Personal/Diaries.org" "Work")
           "* %(org-insert-time-stamp (org-read-date nil t \"\"))\n %?")
          ("Dr" "Research" entry (file+headline "~/Documents/Org/Brain/Personal/Research.org" "Research")
           "* %?")
          ("Dm" "Research" entry (file+headline "~/Documents/Org/Brain/Personal/Meditation.org" "Meditation")
           "* (org-insert-time-stamp (org-read-date nil t \"\"))\n %?")
          ("DR" "Regret" entry (file+headline "~/Documents/Org/Brain/Personal/Diaries.org" "Regrets")
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
  (org-id-link-to-org-use-id 'use-existing)
  (org-directory "~/Documents/Org")
  (org-agenda-files '("~/Documents/Org/Agenda/notes.org" "~/Documents/Org/Agenda/books.org" "~/Documents/Org/Agenda/entertainment.org"))
  (org-agenda-custom-commands
   '(("e" "Exercises" agenda  ""
      ((org-agenda-files (list "~/Documents/Org/Agenda/exercises.org"))
       (org-super-agenda-groups
        '((:auto-category t)))
       (org-agenda-sorting-strategy '(priority-up effort-up))))
     ("d" "Diary" agenda  ""
      ((org-agenda-files nil)))
      
     ("f" "Focus Today" agenda ""
      ((org-agenda-span 'day)
       (org-agenda-skip-function '(org-agenda-skip-if-not-today))
       ))
     ("A" "Agenda Important" agenda  ""
      ((org-agenda-files (list "~/Documents/Org/Agenda/notes.org"))
       (org-super-agenda-groups nil)
       (org-agenda-sorting-strategy '(priority-up effort-up))))
     ("pa" "Projects Agenda" agenda  ""
      ((org-agenda-files (list org-projectile-projects-file (concat (projectile-project-root) org-projectile-per-project-filepath)))
       (org-super-agenda-groups nil)
       (org-agenda-sorting-strategy '(priority-up effort-up))))
     ("pt" "Projects Todo" todo  ""
      ((org-agenda-files (list org-projectile-projects-file (concat (projectile-project-root) org-projectile-per-project-filepath)))
       (org-super-agenda-groups nil)
       (org-agenda-sorting-strategy '(priority-up effort-up))))
     ("B" "Book" todo  ""
      ((org-agenda-files (list "~/Documents/Org/Agenda/books.org"))
       (org-super-agenda-groups nil)
       (org-agenda-sorting-strategy '(ts-down priority-up effort-up))))
     ("h" "Habits" agenda ""
      ((org-agenda-files (list "~/Documents/Org/Agenda/habits.org"))
       (org-agenda-sorting-strategy '(time-up))))
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
  ;; (org-brain-path "~/Documents/Org/Brain")
  (org-id-track-globally t)
  (org-id-locations-file "~/Documents/Org/.org-id-locations")
  :bind
  (:map space-prefix
           ("o c" . org-capture)
           ("o a" . org-agenda)
           ("o d" . (lambda() (interactive) (find-file "~/Documents/Org/diary")))
           ("o A" . (lambda() (interactive) (find-file "~/Documents/Org/Agenda/approach.org")))
           ("a" . org-agenda)
           ("c" . org-capture)
           ("o l" . org-store-link)
           ("o L" . org-id-store-link)
           ("o b" . org-switchb)
           ("o I" . org-insert-link)
           ("o i" . org-insert-last-stored-link)
           )
  :init
  (require 'ido)
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
(defun org-agenda-skip-if-not-today ()
"If this function returns nil, the current match should not be skipped.
Otherwise, the function must return a position from where the search
should be continued."
  (ignore-errors
    (let ((subtree-end (save-excursion (org-end-of-subtree t)))
          (deadline-day
            (time-to-days
              (org-time-string-to-time
                (or (org-entry-get nil "DEADLINE") (org-entry-get nil "SCHEDULED")))))
          (now (time-to-days (current-time))))
       (and deadline-day
            (not (= deadline-day now))
            subtree-end))))

(defun org-agenda-skip-deadline-if-not-today ()
"If this function returns nil, the current match should not be skipped.
Otherwise, the function must return a position from where the search
should be continued."
  (ignore-errors
    (let ((subtree-end (save-excursion (org-end-of-subtree t)))
          (deadline-day
            (time-to-days
              (org-time-string-to-time
                (org-entry-get nil "DEADLINE"))))
          (now (time-to-days (current-time))))
       (and deadline-day
            (not (= deadline-day now))
            subtree-end))))

(defun org-agenda-skip-scheduled-if-not-today ()
"If this function returns nil, the current match should not be skipped.
Otherwise, the function must return a position from where the search
should be continued."
  (ignore-errors
    (let ((subtree-end (save-excursion (org-end-of-subtree t)))
          (deadline-day
            (time-to-days
              (org-time-string-to-time
                (org-entry-get nil "SCHEDULED"))))
          (now (time-to-days (current-time))))
       (and deadline-day
            (not (= deadline-day now))
            subtree-end))))

  (setq-default org-startup-with-inline-images t)
  (require 'org-archive)
  (setq-default org-confirm-babel-evaluate nil)
  (require 'org-habit)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
  )

(use-package org-roam
  :straight org-roam
  :after org
  :hook
  (after-init . org-roam-mode)
  :init
  (require 'emacsql)
                                        ;(setq emacsql-sqlite-executable "~/.local/bin/emacsql-sqlite")
                                        ;(setq emacsql-sqlite3-executable "~/.local/bin/emacsql-sqlite")
  :config
  (require 'org-roam-protocol)
  (setq org-roam-root-directory "~/Documents/Org/Roam")
  (defun org-roam-databases ()
    (cons (expand-file-name org-roam-root-directory)
    (split-string (shell-command-to-string (concat "fd -t d . '" (expand-file-name org-roam-root-directory) "'")))))
(defun org-roam-select-database ()
  ""
  (interactive)
  (let* ((slipbox (completing-read "Slipbox: " (org-roam-databases))))
    (setq org-roam-directory slipbox)
    (setq org-roam-db-location (concat slipbox "/DB"))))

  :custom
  (org-roam-db-update-method 'immediate)
  (org-roam-graph-viewer "/usr/bin/xdg-open")
  (org-roam-tag-sources '(prop all-directories))
  (org-roam-directory "~/Documents/Org/Roam")
  (org-roam-db-location "~/Documents/Org/Roam/DB")
  (org-roam-dailies-directory "dailies")
  (org-roam-dailies-capture-templates
   '(
     ("d" "daily" entry #'org-roam-capture--get-point
      "* %?\n"
      :file-name "daily/%<%Y-%m-%d>"
      :head "#+title: %<%Y-%m-%d>\n"
      )
     ("D" "Diary" entry #'org-roam-capture--get-point
      "* %?\n"
      :file-name "diary/%<%Y-%m-%d>"
      :head "#+title: %<%Y-%m-%d>\n"
      )

     ))
  (org-roam-completion-system 'helm)
  :bind
   (:map space-prefix
   ("r l" . org-roam)
   ("r p" . org-roam-select-database)
   ("r f" . helm-org-roam-find-file)
   ("r c" . org-roam-capture)
   ("r d" . org-roam-dailies-find-date)
   ("r C" . org-roam-dailies-capture-today)
   ("r b" . org-roam-switch-to-buffer)
   ("r t" . org-roam-tag-add)
   ("r T" . org-roam-tag-delete)
   ("r a" . org-roam-alias-add)
   ("r r" . org-roam-random-note)
   ("r A" . org-roam-alias-delete)
   ("r g" . org-roam-graph)
   ("r i" . org-roam-insert)
   ("r I" . org-roam-insert-immediate)))


(use-package org-roam-bibtex
  :straight t
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (require 'org-ref))

(use-package org-roam-server
  :straight org-roam-server
  :after org
  :bind
   (:map space-prefix
         ("r s" . org-roam-server-mode)
         ("r S" . org-roam-server-set-tags))
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-serve-files t
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files t
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows "middle"
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

(use-package org-ref
  :straight t
  :after (org helm)
  :custom
  (reftex-default-bibliography '("~/Documents/Org/references.bib"))
  (org-ref-default-bibliography '("~/Documents/Org/references.bib"))
  (bibtex-completion-bibliography '("~/Documents/Org/references.bib"))
  (org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
  )
(use-package org-fc
  :straight (org-fc :type git :repo "https://git.sr.ht/~l3kn/org-fc" :files (:defaults "awk" "demo.org"))
  :after org
  :config
  (require 'org-fc-hydra)
  :bind
  (:map space-prefix
           ("o f r" . org-fc-review)
           ("o f f" . org-fc-hydra/org-fc-update))
  :custom
  (org-fc-directories '("~/Documents/Org/Roam" "~/Documents/Org/Brain")))

(use-package org-edna
  :straight t
  :after org
  :config

(defun org-edna-finder/next-sibling-children ()
  (save-excursion
  (let* ((poiint (point)))
    (setq point (car (org-edna-finder/next-sibling-wrap 1)))
    (goto-char point)
    (org-edna-finder/children)
    )))
  (org-edna-mode +1)
  )
(use-package calfw
  :straight t)

(use-package calfw-org
  :straight t
  :after calfw
  :bind
  (:map space-prefix
        ("o C" . cfw:open-org-calendar)
        )
  )

(use-package org-bullets
  :straight t
  :after org
  :config
  (add-hook 'org-mode-hook #'org-bullets-mode))

(use-package org-download
  :straight t
  :after org
  :config
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

(if (modular-config-modules-loaded-p '(helm))
    (use-package helm-org-roam
      :straight (helm-org-roam :type git :fetcher github :repo "https://github.com/SidharthArya/helm-org-roam" :files (:defaults))
      :defer nil
      :bind
  (:map space-prefix
   ("r f" . helm-org-roam-find-file)
      )))

(use-package org-google-tasks
  :straight (org-google-tasks :type git :fetcher github :repo "https://github.com/SidharthArya/org-google-tasks" :files (:defaults) )
  :straight request
  :custom
  (org-google-tasks-credential-file "/home/arya/Documents/Org/Bots/Org/google-tasks")
  (org-google-tasks-use-inheritance t)
  :config
  (org-google-tasks-load-credentials)
  (org-google-tasks-get-tokens)
  (if (equal ':null (gethash "refresh_token" org-google-tasks-credential))
      (org-google-tasks-get-oauth-code)
    (org-google-tasks-get-tokens))
  (org-google-tasks-get-remote-list t t)
  )

(use-package ox-hugo
  :straight  (ox-hugo :type git :fetcher github :repo "kaushalmodi/ox-hugo" :files (:defaults))
  :custom
  (org-hugo-auto-set-lastmod t)
  :config
  (setq org-hugo-base-dir "~/.blog/")
  (setq org-hugo-front-matter-format 'yaml)
  (defun my-org-roam/publish (file)
  (with-current-buffer (find-file-noselect file)
    (let ((org-id-extra-files (delete 'nil (mapcar (lambda (a) (if (not (string-match-p "\/.*\/" (replace-regexp-in-string org-roam-directory "" a))) a)) (org-roam--list-files org-roam-directory)))))
    (setq-local org-hugo-base-dir "~/.blog/content")
    (setq-local org-hugo-section "braindump")
      (projectile-mode -1)
      (org-hugo-export-wim-to-md))))

  (with-eval-after-load 'org-capture
  (defun org-hugo-new-subtree-post-capture-template ()
    "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
    (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
           (fname (org-hugo-slug title)))
      (mapconcat #'identity
                 `(
                   ,(concat "* TODO " title)
                   ":PROPERTIES:"
                   ,(concat ":EXPORT_FILE_NAME: " fname)
                   ,(concat ":EXPORT_DATE: %t")
                   ":END:"
                   "%?\n")          ;Place the cursor here finally
                 "\n")))

  (add-to-list 'org-capture-templates
               '("b" "Blog"               ))
  (add-to-list 'org-capture-templates
               '("be"                
                 "Emacs"
                 entry
                 (file+olp "~/Documents/Org/Blog/blog.org" "Emacs")
                 (function org-hugo-new-subtree-post-capture-template)))
  (add-to-list 'org-capture-templates
               '("bl" 
                 "Linux"
                 entry
                 (file+olp "~/Documents/Org/Blog/blog.org" "Linux")
                 (function org-hugo-new-subtree-post-capture-template)))
  (add-to-list 'org-capture-templates
               '("ba" 
                 "Artificial Intelligence"
                 entry
                 (file+olp "~/Documents/Org/Blog/blog.org" "Artificial Intelligence")
                 (function org-hugo-new-subtree-post-capture-template)))
  (add-to-list 'org-capture-templates
               '("bb" 
                 "Blog"
                 entry
                 (file+olp "~/Documents/Org/Blog/blog.org" "Blog")
                 (function org-hugo-new-subtree-post-capture-template)))
  )
  )
(use-package citeproc-org
  :straight t
  :after (ox-hugo org-ref)
  :config
  (citeproc-org-setup)
(add-to-list 'org-ref-formatted-citation-formats
             '("md"
               ("article" . "${author}, *${title}*, ${journal}, *${volume}(${number})*, ${pages} (${year}). ${doi}")
               ("inproceedings" . "${author}, *${title}*, In ${editor}, ${booktitle} (pp. ${pages}) (${year}). ${address}: ${publisher}.")
               ("book" . "${author}, *${title}* (${year}), ${address}: ${publisher}.")
               ("phdthesis" . "${author}, *${title}* (Doctoral dissertation) (${year}). ${school}, ${address}.")
               ("inbook" . "${author}, *${title}*, In ${editor} (Eds.), ${booktitle} (pp. ${pages}) (${year}). ${address}: ${publisher}.")
               ("incollection" . "${author}, *${title}*, In ${editor} (Eds.), ${booktitle} (pp. ${pages}) (${year}). ${address}: ${publisher}.")
               ("proceedings" . "${editor} (Eds.), _${booktitle}_ (${year}). ${address}: ${publisher}.")
               ("unpublished" . "${author}, *${title}* (${year}). Unpublished manuscript.")
               ("misc" . "${author} (${year}). *${title}*. Retrieved from [${howpublished}](${howpublished}). ${note}.")
               (nil . "${author}, *${title}* (${year}).")))
  )
