(defun my-org-roam-multi-tag-delete(tags files)
  "Hello.  TAGS.   FILES."
  (cl-loop for file in files
           do 
           (with-current-buffer (find-file-noselect file)
             (org-roam--set-global-prop
              "roam_tags"
              (combine-and-quote-strings (delete tags (org-roam--extract-tags-prop file)))))
           (org-roam-db--insert-tags 'update)))

