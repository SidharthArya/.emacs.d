(p! undo-tree
  :straight t)
(p! evil
  :straight t
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

(p! evil-org
  :straight t
  :after org)

(p! evil-collection
  :straight t
  :after evil
  :config
  (evil-collection-init))
