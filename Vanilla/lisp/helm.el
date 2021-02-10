(use-package helm
  :ensure jwiegley/emacs-async
  :ensure auto-complete/popup-el
  :ensure emacs-helm/helm
  :ensure emacs-helm/helm-descbinds
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
  :ensure emacs-helm/helm-system-packages)
(use-package helm-org-rifle
  :ensure alphapapa/org-rifle
  :ensure dash
  :ensure f
  :ensure s
  )
