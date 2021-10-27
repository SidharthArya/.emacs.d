(setq warning-minimum-level :emergency)
(setq my-temp-gc-cons-threshold gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)
(setq load-prefer-newer noninteractive)
;; Because file names shouldn't be handled at startup.
(setq my-temp-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; (setq load-path (mapcar (lambda (a) (if (not (string-match-p "org" a)) a)) load-path))
(setq message-log-max 2000)
;; (auto-fill-mode -1)
;; UTF-8 support
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq selection-coding-system 'utf-8)
(set-language-environment "UTF-8")
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
;; (use-package auth-source-pass :init (auth-source-pass-enable))

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
(p! saveplace
  :straight t
  :init
  (setq-default save-place t)
  :custom
  (save-place-file "~/.emacs.d/saveplace")
  :config
  (save-place-mode +1))

;; (use-package electric
;;   :config
;;   (electric-pair-mode +1)
;;   )
(p! smartparens
  :straight t)
(p! hs-mode)
(setq load-path (mapcar (lambda (a) (if (not (string-match-p "org" a)) a)) (delete nil load-path)))
;; (p! direnv
;;   :straight t
;;   :config
;;   (direnv-mode +1))

(p! which-key :straight t :config (which-key-mode))

(p! recentf
  :straight t
  :custom
  (recentf-max-saved-items 100)
  (recentf-max-menu-items 100)
  )
(transient-mark-mode -1)

(p! exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(global-auto-revert-mode t)
