(modular-config-load-modules '(tracking))
(set-frame-parameter nil 'title "Tracking")
(defun after-tracking-task ()
  ""
  (interactive)
  (if (y-or-n-p "Are you done with you Tasks?")
      (save-buffers-kill-terminal)))
(advice-add 'my-morning-tasks :after 'after-tracking-task)
(advice-add 'my-night-tasks :after 'after-tracking-task)
