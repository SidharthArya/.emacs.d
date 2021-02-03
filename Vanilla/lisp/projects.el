(use-package projectile
  :ensure bbatsov/projectile
  :ensure pkg-info
  :config
  (projectile-mode +1))

(when (modular-config-modules-loaded-p 'ivy)
  (use-package counsel-projectile
    :ensure ericdanan/counsel-projectile))
