(setq my-temp-gc-cons-threshold gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)
(setq load-prefer-newer noninteractive)
;; Because file names shouldn't be handled at startup.
(setq my-temp-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(setq message-log-max 20)

;; UTF-8 support
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq selection-coding-system 'utf-8)

;; Disable warnings from legacy advice system. They aren't useful, and what can
;; we do about them, besides changing packages upstream?
(setq ad-redefinition-action 'accept)

;; A second, case-insensitive pass over `auto-mode-alist' is time wasted, and
;; indicates misconfiguration (or that the user needs to stop relying on case
;; insensitivity).
(setq auto-mode-case-fold nil)

(setq inhibit-startup-screen nil
      inhibit-startup-message nil
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil)

(advice-add #'display-startup-echo-area-message :override #'ignore)

(setq idle-update-delay 1.5)

;; (setq auth-sources '("~/.config/authinfo.gpg"))

(setq abbrev-file-name "~/.emacs.d/lisp/abbrev.el")
(setq bookmark-default-file "~/.emacs.d/bookmarks")
(setq custom-file "~/.emacs.d/lisp/custom.el"
      desktop-dirname              "~/.emacs.d/desktop"
      desktop-base-file-name       "autosave"
      desktop-base-lock-name       "autosave-lock"
      tramp-auto-save-directory    "~/.emacs.d/tramp-auto-save/"
      backup-directory-alist '(("" . "~/.emacs.d/backup"))
      tramp-backup-directory-alist backup-directory-alist
      tramp-persistency-file-name "~/.emacs.d/tramp")
(setq delete-old-versions t
      version-control t)
(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)
(set-register ?f '(file . "~/.emacs.d/init.org"))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(defvar my-documents-mounted nil)
                                        ;(global-so-long-mode +1)
;; (set-frame-parameter nil 'alpha '(100 . 100))
;; (set-frame-size nil 130 40)
(set-frame-position nil 130 40)
(setq custom-theme-directory "~/.emacs.d/themes")
                                        ;(load-theme 'tango-dark t)
;; (add-hook 'kill-emacs-hook 'save-some-buffers)
(global-set-key (kbd "<XF86Favorites>") 'bookmark-jump)
