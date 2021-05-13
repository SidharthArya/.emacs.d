(use-package gnus
  :straight t
  :custom
  (gnus-home-directory "~/.news/News/Gnus")
  (gnus-default-directory "~/.news/News/Gnus")
  (gnus-directory "~/.news/News/Gnus/News")
  (gnus-agent-directory "~/.news/News/Gnus/News/agent")
  (gnus-cache-directory "~/.news/News/Gnus/News/cache")
  (gnus-article-save-directory "~/.news/News/Gnus/News")
  (gnus-kill-files-directory "~/.news/News/Gnus/News")
  (message-directory "~/.news/News/Gnus/Mail")
  (nnfolder-directory "~/.news/News/Gnus/Mail/archive")
  (user-mail-address "sidhartharya10@gmail.com")
  (user-full-name "Sidharth Arya")
  (smtpmail-smtp-server "smtp.gmail.com")
  (smtpmail-smtp-service 587)
  (shr-use-colors nil)
  (shr-use-fonts nil)
  (gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
                                        ; Adaptive scoring
  (nnheader-file-name-translation-alist '((?[ . ?_) (?] . ?_)) )
  (gnus-select-method
   '(nnimap "Gmail"
            (nnimap-address "imap.gmail.com")
            (nnimap-server-port "imaps")
            (nnimap-stream ssl))
   (nnir-search-engine imap))
  (gnus-secondary-select-methods '((nntp "news.gwene.org")
                                   ))
  :init
  (require 'nnir)
  (add-hook 'gnus-after-getting-new-news-hook 'gnus-notifications)
  :config
  (gnus-demon-add-handler 'gnus-demon-scan-news 2 t)
  (gnus-demon-init))

(add-to-list 'kill-emacs-hook 'gnus-group-exit)
(use-package gnus-desktop-notify
  :straight t
  :config
  (gnus-desktop-notify-mode)
  (gnus-demon-add-scanmail))
