(p! yasnippet
  :straight t
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all)
                                        ;(require 'yasnippet-snippets)
  :commands yas-minor-mode)
(p! company
  :straight t
  :hook (prog-mode . company-mode)
  :init
  (require 'company-tng)
  :bind
  (:map prog-mode-map
        ("TAB" . company-indent-or-complete-common))
  :commands company-mode)
(p! company-box
  :straight t
  :after company
  :hook (company-mode . company-box-mode))
