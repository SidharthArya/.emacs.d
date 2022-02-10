(p! wakatime-mode
  :straight t
  :config
  (if (equal window-system 'ns)
      (setq wakatime-cli-path "wakatime-cli")
  (setq wakatime-cli-path "wakatime"))
  (global-wakatime-mode))

