(use-package subed
  :straight (subed :type git :fetcher github :repo "https://github.com/rndusr/subed" :files (:defaults))
  :load-path "~/.emacs.d/packages/rndusr/subed/subed"
  :custom
  (subed-playback-speed-while-typing  0.7)
  (subed-playback-speed-while-not-typing  1.5)
  (subed-milliseconds-adjust 1000)
  (subed-subtitle-time-adjusted-hook nil)
  (subed-default-subtitle-length 1000000)
  (subed-subtitle-time-adjusted-hook nil)
  :config
  (add-hook 'subed-mode-hook 'subed-disable-sync-point-to-player)
  (add-hook 'subed-mode-hook 'save-place-local-mode)
  (add-hook 'subed-mode-hook 'turn-on-auto-fill)
  (add-hook 'subed-mode-hook (lambda () (setq-local fill-column 40)))
  :mode ("\\.vtt\\'" "\\.srt\\'"))
