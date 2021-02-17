(use-package helm
  :straight t
  :straight helm-descbinds
  :custom
  (helm-ff-file-name-history-use-recentf t)
  (recentf-max-menu-items 100)
  (recentf-max-saved-items 100)
  :bind
  ("M-x" . helm-M-x)
  ("C-x b" . helm-mini)
  ("C-x r b" . helm-filtered-bookmarks)
  ("C-x C-f" . helm-find-files)
  :config
  (require 'helm-config)
  (helm-mode 1)
  (require 'helm-descbinds)
  (helm-descbinds-mode)
  )

(use-package helm-system-packages
  :straight helm-system-packages)
;; (use-package helm-org-rifle
;;   :straight helm-org-rifle)
(use-package helm-swoop
  :straight t
  :bind
  ("C-S-s" . helm-swoop))
