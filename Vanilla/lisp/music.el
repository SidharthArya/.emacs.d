(p! emms
  :straight t
  :straight emms-player-mpv
  :after org
  :custom
  ;; (emms-directory "~/Music/emms")
  (emms-source-file-default-directory "~/Music")
  (emms-source-playlist-default-format 'pls)
  (emms-player-list '(emms-player-mpv))
  (emms-playlist-buffer-name "*Music*")
  (emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
  (emms-repeat-playlist t)
  :init
  
  (defun org-protocol-emms(fname)
    ""
  (let* ((splitparts (org-protocol-parse-parameters fname nil '(:url :title :body)))
         (uri (org-protocol-sanitize-uri (plist-get splitparts :url)))
         (title (plist-get splitparts :title))
         (body (plist-get splitparts :body))
         )
    (when (equal body "save")
    (let ((track (emms-track 'url uri)))
	  (emms-track-set track 'info-title title) 
          (with-current-buffer (my-emms-open-playlist "Queue")
	    (emms-playlist-insert-track track)
(my-emms-save-playlist)
            ))
    )
    (unless (equal body "save")
    (let ((track (emms-track 'url uri)))
	  (emms-track-set track 'info-title title) 
	  (with-current-emms-playlist
	    (emms-playlist-insert-track track)))
    
    (when (equal body "t")
      (with-current-emms-playlist
      (save-excursion
        (emms-playlist-last)
        (emms-playlist-mode-play-current-track)
        ))))))
  (add-to-list 'org-protocol-protocol-alist '("emms" :protocol "emms" :function org-protocol-emms))
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

(defun my-emms-open-playlist(playlist-path)
  ""
  (interactive (list (completing-read "Playlist File: " (cdr (cdr (directory-files my-emms-playlist-dir))))))
  (let* ((name (car (split-string playlist-path "\\.")))
         (path (concat my-emms-playlist-dir "/" name))
         (buffer (or (ignore-errors (get-buffer name)) (emms-playlist-new name)))
         )
    (with-current-buffer buffer
      (setq-local my-emms-playlist-loaded t)
      (condition-case nil
          (emms-insert-playlist (concat my-emms-playlist-dir "/" playlist-path))
        (error nil)))
    
    (switch-to-buffer buffer)
  ))
  
(defun my-emms-save-playlist()
  ""
  (interactive)
  (let* ((name (buffer-name)))
      (emms-playlist-save 'pls (concat my-emms-playlist-dir "/" name))
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
  (evil-define-key* 'normal emms-playlist-mode-map
    "s" 'emms-shuffle)
  :bind
  (:map space-prefix
        ("m m" . emms)
        ("m o" . my-emms-open-playlist)
        ("m s" . my-emms-save-playlist)
        ("m d" . emms-youtube-dl-music-download)
        ("m M" . emms-metaplaylist-mode-go)
        ("m p" . emms-pause)
        ("m SPC" . emms-pause)
        ("m a" . emms-browse-by-album)
        ("m g" . emms-browse-by-genre)
        ("m /" . emms-browser-search-by-title)

        )
  :commands (emms-track)
  )


