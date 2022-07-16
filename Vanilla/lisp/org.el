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
  (org-agenda-files '("~/Documents/Org/Agenda/notes.org" "~/Documents/Org/Agenda/books.org" "~/Documents/Org/Agenda/entertainment.org"))
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
      "* TODO %:annotation \t:unimportant:\n\tDEADLINE:%(org-insert-time-stamp (org-read-date :from-string \"\"))\n:PROPERTIES:\n:Effort: 1h\n:SCORE_ON_DONE: 10\n:END:\n  %i\n  %a"))))

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
(p! hydra
  :straight t)
