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
    (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
