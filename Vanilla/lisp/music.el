(use-package emms
  :straight t
  :custom
  ;; (emms-directory "~/Music/emms")
  (emms-source-file-default-directory "~/Music")
  (emms-player-list '(emms-player-mpv))
  (emms-playlist-buffer-name "*Music*")
  (emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
  (emms-repeat-playlist t)
  :config
  (setq-default emms-playlist-mode-hook '(emms-mark-mode))
  (require 'emms-setup)
  (emms-all)
  (require 'emms-player-mpv)
  (emms-history-load)
  (evil-define-key 'normal 'emms-playlist-mode-map (kbd "*")  'emms-mark-forward)
  (evil-define-key 'normal 'emms-playlist-mode-map (kbd "M-*")  'emms-mark-unmark-forward)
  :bind
  (:map space-prefix
        ("m m" . emms)
        ("m M" . emms-metaplaylist-mode-go)
        ("m p" . emms-pause)
        ("m SPC" . emms-pause)
        ("m a" . emms-browse-by-album)
        ("m g" . emms-browse-by-genre)
        ("m /" . emms-browser-search-by-title)

        )
  )
