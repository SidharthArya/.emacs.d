(setq my-documents-mounted (or (equal 1 (string-to-number (shell-command-to-string "mount | grep Documents | wc -l"))) (< 2 (string-to-number (shell-command-to-string "ls ~/Documents | wc -l")))))
(defun my-documents-mount()
  (if  (not my-documents-mounted)
      (if (y-or-n-p "Do you want to mount Documents?" )
          (progn
            (shell-command "SUDO_ASKPASS=/home/arya/.local/scripts/askpass.sh sudo -A sh /home/arya/.local/scripts/mount_documents.sh" nil)
            (setq my-documents-mounted (equal 1 (string-to-number (shell-command-to-string "mount | grep Secret | wc -l"))))))))
(my-documents-mount)
