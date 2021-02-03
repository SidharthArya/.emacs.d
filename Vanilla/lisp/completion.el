(use-package yasnippet
  :ensure t
                                        ;:ensure yasnippet-snippets
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all)
                                        ;(require 'yasnippet-snippets)
  :commands yas-minor-mode)
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :init
  (require 'company-tng)
  :bind
  (:map prog-mode-map
        ("TAB" . company-indent-or-complete-common))
  :commands company-mode)
