(load "~/.emacs.d/lisp/straight")
(defalias 'p! 'use-package)
 (p! modular-config
  :straight t
  :custom
  (modular-config-list '(
                         (none ())
                         (minimal (core appearance))
                         (mail (core appearance space helm emoji not-org mail gnus begin-mail core-post))
                         (news (core vi space helm web appearance helm core-post not-org help begin-news))
                         ;; core web org emoji 
                         (tracking (core vi space appearance org begin-tracking not-org))
                         (programming (core appearance ivy org programming vc))
                         (org (begin-org core vi space selectrum appearance completion files web finance vc programming custom language-server auto shell help projects straight org wakatime music modeline workspace pdf dashboard afterload server core-post))
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-emacs-state-modes nil t)
 '(evil-want-keybinding nil t)
 '(evil-want-minibuffer nil t)
 '(package-archives
   '(("org" . "https://orgmode.org/elpa/")
     ("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")))
 '(package-selected-packages
   '(selectrum-prescient selectrum undo-tree evil-collection evil-org evil general ledger-mode use-package emojify yasnippet which-key smartparens modular-config leaf-keywords hydra haskell-mode feather el-get direnv dashboard company-box blackout)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
