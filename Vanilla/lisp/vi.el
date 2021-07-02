(use-package evil
  :defer nil
  :custom
  (evil-want-keybinding nil)
  (evil-want-minibuffer t)
  (evil-emacs-state-modes nil)
  :config
  (setq evil-undo-system 'undo-tree)
  (require 'goto-chg)
  ;; (require 'evil-collection)
  (require 'undo-tree)
  (global-undo-tree-mode +1)
  ;; (evil-collection-init)
  (evil-mode +1)
    (evil-define-key 'normal 'global (kbd "~") #'(lambda() (interactive) (switch-to-buffer nil)))
  (evil-set-leader 'normal (kbd "\\")))

(use-package evil-org
  :after org)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
