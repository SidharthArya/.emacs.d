(set-frame-parameter nil 'title "News")
(add-to-list 'kill-emacs-hook 'elfeed-db-unload)
(modular-config-load-modules '(news))
(setq initial-buffer-choice 'elfeed-startup-function)
