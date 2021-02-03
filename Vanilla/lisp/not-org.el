(global-set-key (kbd "C-c c") #'(lambda () (interactive) (start-process-shell-command "*Capture*" nil "emacsclient --eval '(org-capture)'")))
(global-set-key (kbd "C-c a") #'(lambda () (interactive) (start-process-shell-command "*Agenda*" nil "emacsclient --eval '(org-agenda)'")))
