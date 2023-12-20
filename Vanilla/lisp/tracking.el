(modular-config-load-modules '(mount))
(load "~/Documents/Org/Personal/tracking.el")
(defvar my-tracking-drill-prefix "~/Documents/Org/Brain")
                                        ;(setq org-drill-maximum-items-per-session nil)
(setq org-drill-leech-method 'warn)
(setq org-drill-add-random-noise-to-intervals-p t)
                                        ;(setq org-drill-maximum-duration nil)
;; (load "~/Documents/Org/Drill/drill.el")
(defun my-tracking-drill-stuff ()

  ""
  (interactive)
  (save-excursion
    (let  ((org-drill-scope (mapcar (lambda (a) (format "%s/%s" my-tracking-drill-prefix a)) my-tracking-drill-files)))
      (dolist (x (buffer-list)) (with-current-buffer x (condition-case nil (recover-this-file) (error nil))))(org-drill)(dolist (x (buffer-list)) (with-current-buffer x (condition-case nil (recover-this-file) (error nil)))))))

(defun my-tracking-do-the-writeup (&optional writeup-file)
  ""
  (interactive)
  (let ((my-tracking-writeup-file (or writeup-file my-tracking-writeup-file)))
  (with-current-buffer (find-file-noselect my-tracking-writeup-file)
    (end-of-buffer)
    (if (not (equal (org-time-string-to-absolute (org-get-heading t t t t)) (time-to-days (org-read-date nil t ""))))
        (let ((temp ""))

          (setq temp (concat temp "\n"))
          (dolist
              (handle my-tracking-writeup-handles)
            (setq temp (concat temp (format "- [ ] %s :%s\n" handle (read-string (concat handle ": "))))))
          (setq temp (concat temp (insert "\n"))
                )
          (insert "* ")
          (org-insert-time-stamp (org-read-date nil t ""))
          (insert temp)))
    (save-buffer)
    (kill-current-buffer))))

(defun my-tracking-do-check-writeup ()
  ""
  (interactive)
  (switch-to-buffer (find-file-noselect my-tracking-writeup-file))
  (org-show-all)
  (end-of-buffer)
  (org-narrow-to-subtree))
(defun my-tracking-do-check-emotions ()
  ""
  (interactive)
  (switch-to-buffer (find-file-noselect "~/Documents/Org/Brain/Me/Exercises.org")
                    (end-of-buffer)))
(setq my-tracking-points-directory "~/Documents/Org/Tracking/")
(defun my-tracking-do-give-points ()
  ""
  (interactive)
  (if (equal (format-time-string "%a" (current-time)) "Sun")
      (dolist (key my-tracking-point-keys-weekly)
        (my-tracking-give-points key)))
  (if (equal (string-to-number (format-time-string "%d" (current-time))) 1)
      (dolist (key my-tracking-point-keys-monthly)
        (my-tracking-give-points key)))
  (dolist (key my-tracking-point-keys-daily)
    (my-tracking-give-points  key)))

(defun my-tracking-increment-point()
  ""
  (interactive)
  (let ((str (completing-read "Point File: " my-tracking-point-keys-daily)))
  (with-current-buffer (find-file-noselect (concat  my-tracking-points-directory str ".csv"))
    (if (equal (buffer-size) 0)
        (insert "Date,Value"))
    (goto-char (point-max))
    (if (not (equal (car (split-string (thing-at-point 'line) ","))  (format-time-string "%d-%m-%Y" (current-time))))
        (progn
          (insert "\n")
          (insert "")
          (insert (format-time-string "%d-%m-%Y" (current-time)))
          (insert "," (format "%s" "1"))
          (save-buffer)
          (kill-buffer))
      (progn
        (search-backward ",")
        (forward-char)
        (setq my-tracking-current-point (number-to-string (+ 1 (string-to-number (car (cdr (split-string (thing-at-point 'line) ",")))))))
        (kill-region (point) (point-max))
        (insert my-tracking-current-point)
        )))))
  
(defun my-tracking-give-points(key &optional track-dir)
  ""
  (let ((str nil)
        (input nil)
        (my-tracking-points-directory (or track-dir my-tracking-points-directory))
        )
    (if (listp key)
        (setq str (symbol-name (car key)))
      (setq str (symbol-name key)))
    
    (with-current-buffer (find-file-noselect (concat  my-tracking-points-directory str ".csv"))
      (if (equal (buffer-size) 0)
          (insert "Date,Value"))
      (goto-char (point-max))
      (if (not (equal (car (split-string (thing-at-point 'line) ","))  (format-time-string "%d-%m-%Y" (current-time))))
          (progn
            (when (listp key)
              (setq input (funcall (car (cdr key)))))
            (if (equal input nil)
                (setq input (read-string (concat (string-trim-right (capitalize (buffer-name)) ".csv") ": "))))
            (insert "\n")
            (insert "")
            (insert (format-time-string "%d-%m-%Y" (current-time)))
            (insert "," (format "%s" input))
            (save-buffer)
            (kill-buffer))))))
(defun my-tracking-do-plot-charts ()
  ""
  (start-process-shell-command "*Charts*" "*Charts*" "python ~/.local/scripts/charts.py"))

(defvar my-morning-tracking-functions '(my-tracking-do-the-writeup
                                        ;; my-tracking-drill-stuff
                                        ))
(setq my-night-tracking-functions '(
                                    my-tracking-do-give-points
                                    my-tracking-do-plot-charts
                                    ;; my-tracking-drill-stuff
                                    my-tracking-do-check-emotions
                                    ))

(defun do-tasks (arg)
  ""
  (interactive)
  (dolist (task arg)
    (funcall task)))
(defun my-morning-tasks ()
  ""
  (interactive)
  (do-tasks my-morning-tracking-functions))
(defun my-night-tasks ()
  ""
  (interactive)
  (do-tasks my-night-tracking-functions))
(if my-documents-mounted
    (progn
      (run-at-time "04:00am" nil #'my-morning-tasks)
      (run-at-time "07:00pm" nil #'my-night-tasks)))
