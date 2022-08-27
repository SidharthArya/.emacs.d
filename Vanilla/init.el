(load "~/.emacs.d/lisp/straight")
(straight-use-package 'use-package)
(defalias 'p! 'use-package)
 (p! modular-config
  :straight t
  :custom
  (modular-config-list '((none ())
                         (minimal (core appearance))
                         (mail ((base) emoji not-org mail notmuch begin-mail core-post))
                         (news ((base) not-org web help begin-news (base-post)))
                         (base (core appearance modeline helm vi help))
                         (base-post (core-post))
                         (tracking (core vi space appearance org begin-tracking not-org))
                         (programming (core appearance ivy org programming vc))
                         (org (begin-org (base) dashboard files org notes vc completion language-server projects programming tramp custom space workspace server (base-post)))
                         ;; wakatime
                         ;; (org (begin-org (base) dashboard org))
                         (tmp ((base vi) (base-post)))
                         (chat (core appearance space vi irc slack begin-chat))
                         (orgtest (org))
                         (noter ((base) begin-org org notes pdf server (base-post)))
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
