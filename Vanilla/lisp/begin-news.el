(set-frame-parameter nil 'title "News")
(add-to-list 'kill-emacs-hook 'elfeed-db-unload)
(set-process-sentinel (start-process-shell-command "*ELFEED*" "*ELFEED LOG*" "emacs --script ~/.emacs.d/scripts/elfeed") 'my-elfeed-sentinel)


(defun my-elfeed-sentinel (name status)
  "NAME STATUS."
  (message "%s %s" name status)
  (modular-config-load-modules '(news))
  (elfeed)
  (switch-to-buffer "*elfeed-search*")
  (modular-config-load-modules '(core-post))
  )
