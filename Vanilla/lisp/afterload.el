(defun my-find-config()
  (interactive)
  (helm :sources (helm-build-sync-source "Config: "
                   :fuzzy-match t
                   :candidates (split-string (string-trim (shell-command-to-string "ls ~/.emacs.d/lisp")))
                   :action
                   '(("Find File" . (lambda(candidate) (mapcar #'(lambda (a) (find-file (concat "~/.emacs.d/lisp/" a))) (helm-marked-candidates)))))))
  )

(defun my-find-system-config()
  (interactive)
  (helm-find-1 "~/.files")
  )


(defun my-org-roam-multi-tag-delete(tags files)
  "Hello.  TAGS.   FILES."
  (cl-loop for file in files
           do 
           (with-current-buffer (find-file-noselect file)
             (org-roam--set-global-prop
              "roam_tags"
              (combine-and-quote-strings (delete tags (org-roam--extract-tags-prop file)))))
           (org-roam-db--insert-tags 'update)))

