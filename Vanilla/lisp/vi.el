(p! undo-tree
  :straight t
  :config
  (global-undo-tree-mode +1)
  )
(p! evil
  :straight t
  :after undo-tree
  :custom
  (evil-want-keybinding nil)
  (evil-want-minibuffer t)
  (evil-emacs-state-modes nil)
  :config
  (setq evil-undo-system 'undo-tree)
  (require 'goto-chg)
  ;; (require 'evil-collection)
  ;; (evil-collection-init)
  (evil-mode +1)
    (evil-define-key 'normal 'global (kbd "~") #'(lambda() (interactive) (switch-to-buffer nil)))
  (evil-set-leader 'normal (kbd "\\")))

;; (p! evil-org
;;   :straight t
;;   :after org
;;   :config
;;   (evil-org-mode +1))

(p! evil-collection
  :straight t
  :after evil
  :config
  (evil-collection-init))

(p! evil-org
  :straight t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

