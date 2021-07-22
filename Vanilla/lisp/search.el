(use-package ctrlf
  :straight t
  :config
  (ctrlf-mode +1))

(use-package consult
  :straight t
  :bind
  ("C-S-s" . consult-line))
