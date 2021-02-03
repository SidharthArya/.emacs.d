(modular-config-load-modules '(mount))
(use-package org
  :if my-documents-mounted
  :ensure alphapapa/ts.el
  :ensure t
  :ensure sabof/org-bullets
  :ensure ht
  :ensure s
  :ensure emacsorphanage/ov
  :ensure f
  :ensure transient
  :ensure emacsmirror/peg
  :ensure alphapapa/org-ql
  :ensure alphapapa/org-super-agenda
  :ensure Kungsgeten/org-brain
  :ensure org-drill
  :ensure kaushalmodi/ox-hugo
  :ensure jwiegley/emacs-async
  :ensure abo-abo/org-download
  :hook (org-mode . visual-line-mode)
  (org-mode . auto-save-mode)
  :init

  (setq org-capture-templates
        '(("i" "Important" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %?\t:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"\"))\n  %i\n  %a")
          ("I" "Important Week End" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %?\t:important:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"SUN\"))\n  %i\n  %a")
          ("u" "Unimportant" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Tasks")
           "* TODO %?\t:unimportant:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"SUN\"))\n  %i\n  %a")
          ("r" "Reminder" entry (file+headline "~/Documents/Org/Agenda/notes.org" "tasks")
           "* %?\t:remember:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"\"))\n  %i\n  %a")
          ("j" "Journal" entry (file+datetree "~/org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")
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
          ("p" "Protocol Text" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Protocol")
           "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
          ("l" "Protocol Link" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Inbox")
           "* %? [[%:link][%:description]] \nCaptured On: %U")))

  :custom
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
  (org-agenda-files '("~/Documents/Org/Agenda/notes.org" "~/Documents/Org/Agenda/habits.org" "~/Documents/Org/Agenda/timetable.org"))
  (org-super-agenda-groups
   '((:name "Diary"
            :category "Diary"
            :order 1)
     (:name "Remember"
            :priority "C"
            :tag "remember"
            :order 3)
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
            :order 5)
     (:name "Habit"
            :habit t
            :order 8)
     (:name "Personal"
            :tag ("movies" "tvshows" "tvseries" "books")
            :order 10)
     (:name "Overdue"
            :deadline past
            :scheduled past
            :order 6)))
  (org-agenda-custom-commands
   '(("e" "Exercises" agenda  ""
      ((org-agenda-files (list "~/Documents/Org/Agenda/exercises.org"))
       (org-super-agenda-groups
        '((:auto-category t)))
       (org-agenda-sorting-strategy '(priority-up effort-down))))))
  (org-brain-path "~/Documents/Org/Brain")
  (org-id-track-globally t)
  (org-id-locations-file "~/Documents/Org/.org-id-locations")
  :bind
  ("C-c c" . org-capture)
  ("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c b" . org-switchb)
  ("C-c B" . org-brain-visualize)
  :init
  (setq org-version "9999")
  (defun org-release () "9999")
  (require 'org)
  (require 'org-super-agenda)
  (require 'org-ql)
  (require 'org-ql-search)
  (require 'org-tempo)
  (org-super-agenda-mode)
  :config

  (setq-default org-startup-with-inline-images t)
  (require 'org-archive)
  (require 'org-clock)
  (require 'ox-hugo)
  (require 'org-hugo-auto-export-mode)
  (defun org-hugo-new-subtree-post-capture-template ()
    "Returns `org-capture' template string for new Hugo post.
                  See `org-capture-templates' for more information."
    (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
           (fname (org-hugo-slug title)))
      (mapconcat #'identity
                 `(,(concat "* TODO " title)
                   ":PROPERTIES:"
                   ,(concat ":EXPORT_FILE_NAME: " fname)
                   ":END:"
                   "%?\n")          ;Place the cursor here finally
                 "\n")))

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
  (require 'org-brain)
  (require 'org-drill)
  (require 'org-timer)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
  (require 'org-download)
  (add-hook 'dired-mode-hook 'org-download-enable)
  )
(use-package org-roam
  :ensure org-roam/org-roam
  :ensure skeeto/emacsql
  :ensure cireu/emacsql-sqlite3
  :hook
  (after-init . org-roam-mode)
  :init
  (require 'emacsql)
                                        ;(setq emacsql-sqlite-executable "~/.local/bin/emacsql-sqlite")
                                        ;(setq emacsql-sqlite3-executable "~/.local/bin/emacsql-sqlite")
  :custom
  (org-roam-directory "~/Documents/Org/Roam")
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))
(use-package org-roam-server
  :ensure skeeto/emacs-web-server
  :ensure org-roam/org-roam-server
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
