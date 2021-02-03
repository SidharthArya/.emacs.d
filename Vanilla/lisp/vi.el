(use-package evil
  :ensure t
  :ensure emacs-evil/evil-collection
  :ensure noctuid/annalist.el
  :ensure emacs-evil/goto-chg
  :defer nil
  :custom
  (evil-want-keybinding nil)
  :config
  (require 'goto-chg)
  (require 'evil-collection)
  (evil-collection-init)
  (evil-mode +1)
  (evil-set-leader 'normal (kbd "\\")))
