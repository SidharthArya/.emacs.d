(use-package swiper
  :straight t
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-height 15)
  (ivy-fixed-height-minibuffer t)
  (ivy-count-format "(%d/%d) ")
  :init
  (require 'ivy)
  (require 'counsel)
  :config
  (defalias 'completing-read 'ivy-completing-read)
  (ido-mode -1)
  (counsel-mode 1)
  (when (modular-config-modules-loaded-p 'vi)
    (evil-define-command Grep (arg)
      (interactive "<a>")
      (counsel-rg arg))
    (evil-ex-define-cmd "G[rep]" 'Grep)
    (evil-ex-define-cmd "PlugInstall" 'emacsit::get)
    (evil-ex-define-cmd "PlugUpdate" 'emacsit::update-all))
  :bind
  ("C-x b" . ivy-switch-buffer)
  ("C-c SPC" . ivy-resume)
  ("C-c i /" . swiper-isearch)
  ("C-c i ?" . swiper-isearch-backward)
  ("C-c b b" . ivy-switch-buffer)
  ("C-c b k" . kill-current-buffer)
  ("C-c b d" . kill-current-buffer)
  ("C-c b s" . save-buffer)
  ("C-c M-x" . counsel-M-x)
  ("C-c f f" . counsel-find-file)
  ("C-c f r" . counsel-recentf)
  ("C-c f C" . my-find-system-config)
  ("C-c f c" . my-find-config)
  ("C-c v" . ivy-push-view)
  ("C-c V" . ivy-pop-view)
  :commands counsel-find-file ivy-switch-buffer)

(use-package counsel
  :straight t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> l" . counsel-find-library)
  ("<f2> i" . counsel-info-lookup-symbol)
  ("<f2> u" . counsel-unicode-char)
  ("<f2> j" . counsel-set-variable)
  ("C-c g f" . counsel-git)
  ("C-c g j" . counsel-git-grep)
  ("C-c g l" . counsel-git-log)
  ("C-c g r" . counsel-rg)
  ("C-c S s" . counsel-linux-app)
  ("C-c f F" . counsel-fzf)
  ("C-c e r" . counsel-evil-registers)
  ("C-c e R" . counsel-registers)
  ("C-c e m" . counsel-mark-ring)
  ("C-c S w" . counsel-wmctrl)
  ("C-c r b" . counsel-bookmark)
  ("C-c f o" . counsel-org-file)
  ("C-c f d" . counsel-dired)
  ("C-c r k" . counsel-yank-pop)
  ("C-c h f" . counsel-describe-function)
  ("C-c h v" . counsel-describe-variable)
  ("C-c h l" . counsel-find-library)
  ("C-c h i" . counsel-info-lookup-symbol)
  ("C-c  u" . counsel-unicode-char)
  ("C-c <f2> j" . counsel-set-variable)
        )
(use-package ivy-hydra
  :straight t)

(use-package counsel-projectile
  :straight t
  :config
  (counsel-projectile-mode +1)
  :bind
  ("C-c p p" . counsel-projectile-switch-project)
  ("C-c p f" . counsel-projectile-find-file)
  ("C-c p c" . counsel-projectile-org-capture)
  ("C-c p a" . counsel-projectile-org-agenda)
  )

(defun my-find-config ()
  ""
  (interactive)
  (find-file  (concat "~/.emacs.d/" (completing-read "Recent File: " (cons "init.el" (mapcar (lambda (a) (concat "lisp/" a)) (directory-files "~/.emacs.d/lisp")))))))

(defun my-find-system-config()
  (interactive)
  (ivy-read "System Config: " (split-string (string-trim (shell-command-to-string "fd --base-directory=/home/arya/.files")))
            :action
            '(1
              ("Find File" (lambda(c) (find-file (concat "~/.files/" c)))))))
