(bind-keys
 :prefix-map space-prefix
 :prefix "M-SPC")

;; (when (modular-config-modules-loaded-p 'org)
;;   (bind-keys
  
(defun my-find-config ()
  (interactive)
  (let*
      ((files (split-string (string-trim (shell-command-to-string "ls ~/.emacs.d/lisp"))))
       (temp (push "../init.el" files))
       (files (completing-read-multiple "Emacs Config File: " files)))
    (mapc #'(lambda(a) (find-file (concat "~/.emacs.d/lisp/" a))) files)))



(bind-keys
 :map space-prefix
 ("S t" . helm-world-time)
 ("S s" . helm-system-packages))

(when (modular-config-modules-loaded-p 'vi)
  (evil-define-key 'normal 'global (kbd "SPC") 'space-prefix)
  (evil-define-key 'normal 'dashboard-mode-map (kbd "SPC") 'space-prefix)
  (evil-define-key '(normal visual motion insert) 'global (kbd "C-c") 'space-prefix)
  )

(bind-keys
 :map space-prefix
 ("t m" . menu-bar-mode)
 ("t t" . tool-bar-mode)
 ("t s" . scroll-bar-mode)
 )

;; (evil-define-key
;;   'normal org-agenda-mode-map
;;   "t" 'org-agenda-todo
;;   "TAB" 'org-agenda-goto
;;   "RET" 'org-agenda-switch-to
;;   "e" 'org-agenda-set-effort
;;   "B" 'org-agenda-bulk-action
;;   "M" 'org-agenda-bulk-mark
;;   "u" 'org-agenda-bulk-unmark
;;   "U" 'org-agenda-bulk-unmark-all
;;   "*" 'org-agenda-bulk-mark-all
;;   "d" 'org-agenda-deadline
;;   "s" 'org-agenda-schedule
;;   "/" 'org-agenda-filter
;;   )
