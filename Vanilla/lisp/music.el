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
  (setq my-emms-playlist-dir "~/Music/Playlists")
  (setq my-emms-playlist-default "Liked")
  (setq my-emms-playlists (split-string (string-trim (shell-command-to-string "ls ~/Music/Playlists"))))
(require 'emms-info-tinytag)
(setq emms-info-functions '(emms-info-tinytag))
(defun emms-youtube-dl-music-download(url name &optional ARG)
  ""
  (interactive "sURL: \nsName: ")
  (let* ((name (or (and (not (equal name "")) name) (string-trim (shell-command-to-string (concat "/home/arya/.local/bin/youtube-dl -e '" url "'")))))
    (process
     (start-process-shell-command "*Youtube-dl*" "*Youtube-dl*" (concat "/home/arya/.local/bin/youtube-dl " "--audio-format mp3 "  "-o  '" emms-source-file-default-directory "/" name ".%(ext)s'" " -x '" url "'"))))
    (set-process-sentinel process #'(lambda (a b) (with-current-buffer (process-buffer a) (emms-add-file (concat emms-source-file-default-directory "/" music-file ".mp3")))))
    (with-current-buffer (process-buffer process)
      (setq-local music-file name))
  ))

  (defun my-emms-add-to-playlist(playlist-name)
    ""
    (interactive (list (completing-read "Playlist Name: " my-emms-playlists)))
    (let* ((file (find-file-noselect (concat my-emms-playlist-dir "/" playlist-name)))
          (marked (emms-mark-has-markedp))
          (tracks ))
      (emms-mark-do-with-marked-track
     (lambda nil
       (setq tracks
             (concat tracks
                     (buffer-substring (point)
                                       (progn (forward-line 1) (point)))))))
          
      (with-current-buffer file
        (emms-playlist-mode)
        (end-of-file)
        (if marked)
            
      (my-emms-add-track-to-playlist t)
      )))
  (defun my-emms-add-track-to-playlist(&optinal file arg tracks)
    ""
    )
  :bind
  (:map space-prefix
        ("m m" . emms)
        ("m d" . emms-youtube-dl-music-download)
        ("m M" . emms-metaplaylist-mode-go)
        ("m p" . emms-pause)
        ("m SPC" . emms-pause)
        ("m a" . emms-browse-by-album)
        ("m g" . emms-browse-by-genre)
        ("m /" . emms-browser-search-by-title)

        )
  )


