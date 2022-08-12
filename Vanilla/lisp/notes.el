(p! org-roam
  :straight t
  :init
  (require 'emacsql)
                                        ;(setq emacsql-sqlite-executable "~/.local/bin/emacsql-sqlite")
                                        ;(setq emacsql-sqlite3-executable "~/.local/bin/emacsql-sqlite")
  (setq org-roam-v2-ack t)
  :config
  (require 'org-roam-protocol)
  (setq org-roam-root-directory "~/Documents/Zettel/prismforce/")
  (defun org-roam-databases ()
    (cons (expand-file-name org-roam-root-directory)
	  (split-string (shell-command-to-string (concat "fd -t d . '" (expand-file-name org-roam-root-directory) "'")))))
  (defun org-roam-select-database ()
    ""
    (interactive)
    (let* ((slipbox (completing-read "Slipbox: " (org-roam-databases))))
      (setq org-roam-directory slipbox)
      (setq org-roam-db-location (concat slipbox "/DB"))))
  (org-roam-db-autosync-mode +1)
  :custom
  (org-roam-db-update-method 'immediate)
  (org-roam-graph-viewer "/usr/bin/xdg-open")
  (org-roam-tag-sources '(prop all-directories vanilla))
  (org-roam-directory "~/Documents/Zettel/prismforce")
  (org-roam-db-location "~/Documents/Zettel/prismforce/DB")
  (org-roam-dailies-directory "../dailies")
  (org-roam-dailies-capture-templates
   '(
     ("d" "daily" entry #'org-roam-capture--get-point
      "* %?\n"
      :file-name "daily/%<%Y-%m-%d>"
      :head "#+title: %<%Y-%m-%d>\n"
      )
     ("s" "stocks" entry #'org-roam-capture--get-point
      "* %?\n"
      :file-name "daily/%<%Y-%m-%d>"
      :head "#+title: %<%Y-%m-%d>\n"
      )
     ("D" "Diary" entry #'org-roam-capture--get-point
      "* %?\n"
      :file-name "diary/%<%Y-%m-%d>"
      :head "#+title: %<%Y-%m-%d>\n"
      )

     ))
  (org-roam-completion-system 'helm)
  :bind
  ("C-c r p" . org-roam-select-database)
  ("C-c r c" . org-roam-capture)
  ("C-c r d" . org-roam-dailies-find-date)
  ("C-c r C" . org-roam-dailies-capture-today)
  ("C-c r b" . org-roam-switch-to-buffer)
  ("C-c r l" . org-roam-buffer)
  ("C-c r f" . org-roam-node-find)
  ("C-c r t" . org-roam-tag-add)
  ("C-c r T" . org-roam-tag-delete)
  ("C-c r a" . org-roam-alias-add)
  ("C-c r r" . org-roam-random-note)
  ("C-c r A" . org-roam-alias-delete)
  ("C-c r g" . org-roam-graph)
  ("C-c r i" . org-roam-node-insert))

(p! org-roam-ui
  :straight
  (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :after org-roam
  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

