(load "~/.emacs.d/lisp/straight")
(straight-use-package 'use-package)
(defalias 'p! 'use-package)
 (p! modular-config
  :straight t
  :custom
  (modular-config-list '(
                         (none ())
                         (minimal (core appearance))
                         (mail (core appearance selectrum emoji not-org mail gnus begin-mail core-post))
                         (news ((base) not-org help begin-news (base-post)))
                         ;; core web org emoji
                         (base (core appearance selectrum vi help space))
                         (base-post (core-post))
                         (tracking (core vi space appearance org begin-tracking not-org))
                         (programming (core appearance ivy org programming vc))
                         (org (begin-org (base) dashboard org vc completion language-server wakatime projects server programming (base-post)))
                         (tmp ((base vi) (base-post)))
                               ;;web  server  subtitles core-post  ))
                         (chat (core appearance space vi irc slack begin-chat))
                         (orgtest (org))
			 (wm (wm))
                         (doom (org doom))
                         (utilities (core))
                         (main (core appearance programming emoji ivy web org finance news mail documents server space workspace dashboard core-post))))
  (modular-config-default 'org)
  (modular-config-path "~/.emacs.d/lisp")
  (modular-config-use-separate-bookmarks t)
  :config

  (modular-config-command-line-args-process))
(put 'narrow-to-region 'disabled nil)
