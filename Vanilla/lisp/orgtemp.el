(use-package org
      :ensure alphapapa/ts.el
      :ensure https://code.orgmode.org/bzg/org-mode.git
      :ensure sabof/org-bullets
      :ensure ht
      :ensure s
      :ensure emacsorphanage/ov
      :ensure f
      :ensure transient
      :ensure emacsmirror/peg
      :ensure alphapapa/org-ql
      :ensure alphapapa/org-sidebar
      :ensure alphapapa/org-super-agenda
      :ensure Kungsgeten/org-brain
      :ensure org-drill
      :ensure kaushalmodi/ox-hugo
      :hook (org-mode . visual-line-mode)
      (org-mode . auto-save-mode)

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
      (org-capture-templates
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
         ("P" "Protocol")
         ("Pc" "Protocol Text" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Protocol")
          "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
         ("Pl" "Protocol Link" entry (file+headline "~/Documents/Org/Agenda/notes.org" "Inbox")
          "* %? [[%:link][%:description]] \nCaptured On: %U")))
      :bind
      ("C-c c" . org-capture)
      ("C-c a" . org-agenda)
      ("C-c l" . org-store-link)
      ("C-c b" . org-switchb)
      ("C-c B" . org-brain-visualize)
      (:map org-mode-map
            ("C-c t" . org-sidebar-toggle))
)
