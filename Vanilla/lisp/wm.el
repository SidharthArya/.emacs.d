(use-package exwm
  :straight t
  :config
  (require 'exwm)
  (require 'exwm-randr)
  (require 'exwm-config)
  (exwm-randr-enable)
  (exwm-config-example)
  )
