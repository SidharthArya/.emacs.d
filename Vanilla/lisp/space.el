(bind-keys
 :prefix-map space-prefix
 :prefix "M-SPC")

;; (when (modular-config-modules-loaded-p 'org)
;;   (bind-keys
  
(defun my-find-config()
  (interactive)
  (helm :sources (helm-build-sync-source "Config: "
                   :fuzzy-match t
                   :candidates (split-string (string-trim (shell-command-to-string "ls ~/.emacs.d/lisp")))
                   :action
                   '(("Find File" . (lambda(candidate) (mapcar #'(lambda (a) (find-file (concat "~/.emacs.d/lisp/" a))) (helm-marked-candidates)))))))
  )

(defun my-helm-org-roam-find-file()
  (interactive)
  (helm :sources (helm-build-sync-source "Roam: "
                   :fuzzy-match t
                   :candidates (org-roam--get-title-path-completions)
                   :action
                   '(("Find File" .
                      (lambda(candidate)
                        (mapcar
                         #'(lambda(a)
                             (message "%s"
                                      (find-file
                                       (plist-get a :path)))) (helm-marked-candidates))))
                     ("Tag Add" .
                      
                      (lambda(candidate)
                        (let* ((files  (helm-marked-candidates))
                               (tags-to-add  (helm :sources (helm-build-sync-source "Tags" :candidates (org-roam-db--get-tags)))))
                          
                          (my-org-roam-multi-tag-add tags-to-add (mapcar #'(lambda (a) (plist-get a :path)) files)))))))))
  


(defun my-org-roam-multi-tag-add(tags files)
  (cl-loop for file in files
           do 
           (with-current-buffer (find-file-noselect file)
             (org-roam--set-global-prop
              "roam_tags"
              (combine-and-quote-strings (seq-uniq (cons tags (org-roam--extract-tags-prop file)))))))
                      (org-roam-db--insert-tags 'update))
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

(evil-define-key
  'normal org-agenda-mode-map
  "t" 'org-agenda-todo
  "TAB" 'org-agenda-goto
  "r" 'org-agenda-redo-all
  (kbd "RET") 'org-agenda-switch-to
  "e" 'org-agenda-set-effort
  "B" 'org-agenda-bulk-action
  "M" 'org-agenda-bulk-mark
  "u" 'org-agenda-bulk-unmark
  "U" 'org-agenda-bulk-unmark-all
  "*" 'org-agenda-bulk-mark-all
  "d" 'org-agenda-deadline
  "c" 'org-agenda-capture
  "k" 'org-habit-toggle-habits
  "s" 'org-agenda-schedule
  "/" 'org-agenda-filter
  ) 
