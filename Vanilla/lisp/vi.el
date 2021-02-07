(use-package evil
  :ensure t
  :ensure emacs-evil/evil-collection
  :ensure noctuid/annalist.el
  :ensure emacs-evil/goto-chg
  :ensure emacs-straight/undo-tree
  :defer nil
  :custom
  (evil-want-keybinding nil)
  :config
  (setq evil-undo-system 'undo-tree)
  (require 'goto-chg)
  (require 'evil-collection)
  (require 'undo-tree)
  (global-undo-tree-mode +1)
  (evil-collection-init)
  (evil-mode +1)
  (evil-set-leader 'normal (kbd "\\")))
