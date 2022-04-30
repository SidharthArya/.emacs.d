(modular-config-load-modules '(mount))

(p! org
  :straight t
  :straight org-ql
  ;; :if my-documents-mounted
  :hook (org-mode . visual-line-mode)
  (org-mode . auto-save-mode)
  :custom
  (org-capture-templates
   '(
     ("i" "Important")
     ("it" "Today" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
      "* TODO %? \t:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 30\n:END:\n  %i\n  %a")
     ("iT" "Today" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
      "* TODO %? \t:work:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 90\n:END:\n  %i\n  %a")
     ("iw" "Weekend" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
      "* TODO %? \t:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"SUN\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 20\n:END:\n  %i\n  %a")
     ("iW" "Weekend" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
      "* TODO %? \t:work:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"SUN\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 90\n:END:\n  %i\n  %a")
     ("is" "Schedule" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
      "* TODO %? \t:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 20\n:END:\n  %i\n  %a")
     ("iS" "Schedule" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
      "* TODO %? \t:work:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 90\n:END:\n  %i\n  %a")
     ("id" "Deadline" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
      "* TODO %? \t:important:\n\tDEADLINE:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a")
     ("iD" "Deadline" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
      "* TODO %? \t:work:important:\n\tDEADLINE:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 90\n:END:\n  %i\n  %a")
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
     ("w" "Work" agenda ""
      ((org-agenda-filter-preset '("+work"))))
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
  ("C-c o c" . org-capture)
  ("C-c o m" . org-id-get-create)
  ("C-c o e" . org-export-dispatch)
  ("C-c o a" . org-agenda)
  ("C-c o d" . (lambda() (interactive) (find-file "~/Documents/Org/diary")))
  ("C-c o A" . (lambda() (interactive) (find-file "~/Documents/Org/Agenda/approach.org")))
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  ("C-c o l" . org-store-link)
  ("C-c o L" . org-id-store-link)
  ("C-c o b" . org-switchb)
  ("C-c o I" . org-insert-link)
  ("C-c o i" . org-insert-last-stored-link)
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
    (require 'org-capture)

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
    (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)))

(p! org-roam
  :straight t
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
  (org-roam-db-autosync-mode +1)
  :custom
  (org-roam-db-update-method 'immediate)
  (org-roam-graph-viewer "/usr/bin/xdg-open")
  (org-roam-tag-sources '(prop all-directories vanilla))
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
  ("C-c r p" . org-roam-select-database)
  ("C-c r c" . org-roam-capture)
  ("C-c r d" . org-roam-dailies-find-date)
  ("C-c r C" . org-roam-dailies-capture-today)
  ("C-c r b" . org-roam-switch-to-buffer)
  ("C-c r l" . org-roam-buffer)
  ("C-c r f" . org-roam-node-find)
  ("C-c r t" . org-roam-tag-add)
  ("C-c r T" . org-roam-tag-delete)
  ("C-c r a" . org-roam-alias-add)
  ("C-c r r" . org-roam-random-note)
  ("C-c r A" . org-roam-alias-delete)
  ("C-c r g" . org-roam-graph)
  ("C-c r i" . org-roam-node-insert))

(p! org-roam-ui
  :straight
  (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :after org-roam
  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(p! org-ref
  :straight t
  :after (org)
  :custom
  (reftex-default-bibliography '("~/Documents/Org/references.bib"))
  (org-ref-default-bibliography '("~/Documents/Org/references.bib"))
  (bibtex-completion-bibliography '("~/Documents/Org/references.bib"))
  (org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
  )

(p! citeproc-org
  :straight t
  :after (ox-hugo org-ref)
  :config
  (citeproc-org-setup)
  )

(p! ox-hugo
  :straight t
  :config
  (defun my-org-hugo-export-to-md()
    ""
    (when (string-match-p (expand-file-name org-roam-directory) (buffer-file-name))
      (org-hugo-export-wim-to-md)))
  (add-to-list 'after-save-hook 'my-org-hugo-export-to-md)
  (defun my-org-hugo-export-before-processing-hook(_backend)
    ""
    (interactive)
    (when (string-match-p (expand-file-name org-roam-directory) (buffer-file-name))
        (replace-string "{" "" nil (point-min) (point-max))
        (beginning-of-buffer)
        (while  (re-search-forward "\}\@.*\}" nil t)
          (replace-match ""))))
  (add-to-list 'org-export-before-processing-hook 'my-org-hugo-export-before-processing-hook)
  (setq org-hugo-anchor-functions '(org-hugo-get-custom-id
                                    org-hugo-get-id
                                    org-hugo-get-heading-slug
                                    org-hugo-get-md5)))
(p! org-fc
  :straight (org-fc
             :type git :repo "https://git.sr.ht/~l3kn/org-fc"
             :files (:defaults "awk" "demo.org"))
  :custom
  (org-fc-directories '("~/Documents/Org/Roam"))
  :config
  (require 'org-fc-hydra)
  (evil-define-minor-mode-key '(normal insert emacs) 'org-fc-review-flip-mode
    (kbd "RET") 'org-fc-review-flip
    (kbd "n") 'org-fc-review-flip
    (kbd "s") 'org-fc-review-suspend-card
    (kbd "q") 'org-fc-review-quit)

  (evil-define-minor-mode-key '(normal insert emacs) 'org-fc-review-rate-mode
    (kbd "a") 'org-fc-review-rate-again
    (kbd "h") 'org-fc-review-rate-hard
    (kbd "g") 'org-fc-review-rate-good
    (kbd "e") 'org-fc-review-rate-easy
    (kbd "s") 'org-fc-review-suspend-card
    (kbd "q") 'org-fc-review-quit)
  )
(p! hydra
  :straight t)
