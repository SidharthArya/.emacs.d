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
  ("C-s" . swiper)
  ("C-x b" . ivy-switch-buffer)
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-x C-d" . counsel-dired)
  ("M-y" . counsel-yank-pop)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> l" . counsel-find-library)
  ("<f2> i" . counsel-info-lookup-symbol)
  ("<f2> u" . counsel-unicode-char)
  ("<f2> j" . counsel-set-variable)
  ("C-c v" . ivy-push-view)
  ("C-c V" . ivy-pop-view)
  :commands counsel-find-file ivy-switch-buffer)
