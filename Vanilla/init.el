(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)
(setq load-path (delete "/usr/share/emacs/27.1/lisp/org" load-path))
;(format "%s" (mapcar #'(lambda(a) (string-match "/usr/share/emacs/24.3a) load-path)
(use-package modular-config
  :straight t
  :custom
  (modular-config-list '(
                         (none ())
                         (minimal (core appearance))
                         (mail (core vi mail appearance helm space emoji not-org mail gnus begin-mail))
                         (news (begin-news core vi helm space web appearance helm core-post not-org))
                         ;; core web org emoji 
                         (tracking (core vi space appearance org begin-tracking not-org))
                         (programming (core appearance ivy org programming vc))
                         (org (core vi space begin-org appearance completion files web finance helm vc programming custom server auto language-server shell help projects subtitles dashboard core-post org afterload wakatime music modeline))
                         (chat (core appearance space vi irc slack begin-chat))
                         (orgtest (org))
			 (wm (wm))
                         (doom (org doom))
                         (utilities (core))
                         (main (core appearance programming emoji ivy web org finance news mail documents server space workspace dashboard core-post))))
  (modular-config-default 'org)
  (modular-config-path "~/.emacs.d/lisp")
  :config
  (modular-config-command-line-args-process))
