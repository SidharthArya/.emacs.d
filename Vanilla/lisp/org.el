(modular-config-load-modules '(mount))

(p! org
  :straight t
  :straight org-ql
  ;; :if my-documents-mounted
  :hook (org-mode . visual-line-mode)
  (org-mode . auto-save-mode)
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
  :custom
  (org-id-link-to-org-use-id 'use-existing)
  (org-directory "~/Documents/Org")
  (org-agenda-files '("~/Documents/Org/Agenda/notes.org" "~/Documents/Org/Agenda/books.org" "~/Documents/Org/Agenda/entertainment.org" "~/Documents/Org/Agenda/social.org" "~/Documents/Org/Agenda/habits.org"  "~/Documents/Org/Agenda/work"))
  (org-agenda-custom-commands
   '(("e" "Exercises" agenda  ""
      ((org-agenda-files (list "~/Documents/Org/Agenda/exercises.org"))
       (org-super-agenda-groups
        '((:auto-category t)))
       (org-agenda-sorting-strategy '(priority-up effort-up))))
     ("w" "Work" agenda  ""
      ((org-agenda-files (list "~/Documents/Org/Agenda/work.org"))
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
     ("s" "Social" entry (file+headline "~/Documents/Org/Agenda/social.org" "Tasks")
      "* TODO %? \t:social:\n\tSCHEDULED:%(org-insert-time-stamp (org-read-date nil t \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 30\n:END:\n  %i\n  %a")
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
      "* TODO %:annotation \t:unimportant:\n\tDEADLINE:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a"))))

;; ~/.doom.d/config.el
(p! org-transclusion
  :straight (:fetcher github :repo "https://github.com/nobiot/org-transclusion")
  :after org
  :init
  (map!
   :map global-map "<f12>" #'org-transclusion-add
   :leader
   :prefix "n"
   :desc "Org Transclusion Mode" "t" #'org-transclusion-mode))


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
  ;; (add-to-list 'after-save-hook 'my-org-hugo-export-to-md)
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

(p! org-super-agenda
  :straight t
  :config
  (setq org-super-agenda-groups
       '(;; Each group has an implicit boolean OR operator between its selectors.
         (:name "Today"  ; Optionally specify section name
                :time-grid t  ; Items that appear on the time grid
                :todo "TODAY")  ; Items that have this TODO keyword
         (:name "Important"
                ;; Single arguments given alone
                :tag "bills"
                :priority "A")
         (:name "Social"
                ;; Single arguments given alone
                :tag "social")
         ;; Set order of multiple groups at once
         (:order-multi (2 (:name "Shopping in town"
                                 ;; Boolean AND group matches items that match all subgroups
                                 :and (:tag "shopping" :tag "@town"))
                          (:name "Food-related"
                                 ;; Multiple args given in list with implicit OR
                                 :tag ("food" "dinner"))
                          (:name "Personal"
                                 :habit t
                                 :tag "personal")
                          (:name "Space-related (non-moon-or-planet-related)"
                                 ;; Regexps match case-insensitively on the entire entry
                                 :and (:regexp ("space" "NASA")
                                               ;; Boolean NOT also has implicit OR between selectors
                                               :not (:regexp "moon" :tag "planet")))))
         ;; Groups supply their own section names when none are given
         (:todo "WAITING" :order 8)  ; Set order of this section
         (:todo ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING")
                ;; Show this group at the end of the agenda (since it has the
                ;; highest number). If you specified this group last, items
                ;; with these todo keywords that e.g. have priority A would be
                ;; displayed in that group instead, because items are grouped
                ;; out in the order the groups are listed.
                :order 9)
         (:priority<= "B"
                      ;; Show this section after "Today" and "Important", because
                      ;; their order is unspecified, defaulting to 0. Sections
                      ;; are displayed lowest-number-first.
                      :order 1)
         ;; After the last group, the agenda will display items that didn't
         ;; match any of these groups, with the default order position of 99
         ))
  )

(p! org-download
  :straight t)
