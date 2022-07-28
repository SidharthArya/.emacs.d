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
