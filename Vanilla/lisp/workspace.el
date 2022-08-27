(p! perspective
  :straight t
  :config
  (persp-mode))

(p! persp-projectile
  :straight t
  :bind
  ("C-c p p" . projectile-persp-switch-project))
