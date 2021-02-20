(bind-keys
 :prefix-map space-prefix
 :prefix "M-SPC")

(when (modular-config-modules-loaded-p 'org)
  (bind-keys
   :prefix-map org-prefix
   :prefix "M-SPC o"
   ("a" . org-agenda)
   ("c" . org-capture)
   ("r l" . org-roam)
   ("r f" . org-roam-find-file)
   ("r b" . org-roam-switch-to-buffer)
   ("r t" . org-roam-tag-add)
   ("r T" . org-roam-tag-delete)
   ("r g" . org-roam-graph)))


(when (modular-config-modules-loaded-p 'files)
  (bind-keys
   :prefix-map file-prefix
   :prefix "M-SPC f"
   ("f" . helm-find-files)
   ("d" . dired)
   ("E" . helm-find-files)
   ("b" . helm-bookmarks)
   ("c" . my-find-config)
   ("r" . helm-recentf)))


(defun my-find-config ()
  (interactive)
  (let*
      ((files (split-string (string-trim (shell-command-to-string "ls ~/.emacs.d/lisp"))))
       (temp (push "~/.emacs.d/init.el" files))
       (files (completing-read-multiple "Emacs Config File: " files)))
    (mapc 'find-file files)))

(bind-keys
 :prefix-map p-prefix
 :prefix "M-SPC p"
 ("p" . helm-projectile)
 ("q" . projectile-kill-buffers)
 ("R" . helm-projectile-recentf)
 ("g" . projectile-vc)
 ("d" . projectile-run-gdb)
 ("r" . projectile-run-project)
 ("e" . projectile-run-command-in-root)
 ("E" . projectile-run-eshell)
 ("!" . projectile-run-shell-command-in-root)
 ("&" . projectile-run-async-shell-command-in-root)
 ("b" . helm-projectile-switch-to-buffer)
 ("P" . helm-projectile-switch-project)
 ("s" . projectile-run-shell)
 ("t" . projectile-run-vterm)
 ("\?" . helm-projectile-rg)
 ("/" . helm-multi-swoop-projectile)
 ("f" . helm-projectile-find-file)
 ("F" . helm-projectile-find-file-in-known-projects)
 ("c" . projectile-compile-project)
 ("C" . projectile-configure-project)
 ("C-s" . projectile-save-project-buffers))

(bind-keys
 :prefix-map P-prefix
 :prefix "M-SPC P"
 ("p" . helm-list-emacs-process)
 ("d" . helm-top)
 ("k" . helm-top))

(bind-keys
 :prefix-map search-prefix
 :prefix "M-SPC /"
 ("/" . helm-swoop)
 ("m" . helm-multi-swoop))

(bind-keys
 :prefix-map d-prefix
 :prefix "M-SPC d"
 ("t" . helm-world-time)
 ("s" . helm-system-packages))

(when (modular-config-modules-loaded-p 'projects)
  (define-key global-map (kbd "M-SPC p") 'projectile-command-map)
  (bind-keys :map projectile-command-map
             ("p" . counsel-projectile-switch-project) 
             ("f" . counsel-projectile-find-file) 
             ("d" . counsel-projectile-find-dir)))

(when (modular-config-modules-loaded-p 'ivy)
  (bind-keys
   :prefix-map buffer-prefix
   :prefix "M-SPC b"
   ("k" . kill-current-buffer)
   ("[" . previous-buffer)
   ("]" . next-buffer)
   ("b" . counsel-switch-buffer)
   ("n" . counsel-switch-buffer)
   ("B" . ibuffer)))

(when (modular-config-modules-loaded-p 'vi)
  (evil-define-key 'normal 'global (kbd "SPC") 'space-prefix)
  (evil-define-key 'normal 'dashboard-mode-map (kbd "SPC") 'space-prefix))

(when (modular-config-modules-loaded-p 'helm)
  (bind-keys
   :prefix-map buffer-prefix
   :prefix "M-SPC b"
   ("k" . kill-current-buffer)
   ("d" . kill-current-buffer)
   ("b" . helm-mini)
   ("s" . save-buffer)
   ("x" . (lambda () (interactive) (switch-to-buffer (startup--get-buffer-create-scratch))))
   ("[" . previous-buffer)
   ("]" . next-buffer)
   ("z" . bury-buffer)))


(when (modular-config-modules-loaded-p 'vc)
  (bind-keys
   :prefix-map g-map
   :prefix "M-SPC g"
   ("c" . magit-commit)
   ("C" . magit-clone)))


(when (modular-config-loaded-module-p 'vi)
  (bind-keys
   :prefix-map h-map
   :prefix "M-SPC h"
   ("M" . helm-man-woman)
   ("f" . helpful-function)
   ("v" . helpful-variable)
   ("." . helpful-at-point)))



(bind-keys
 :prefix-map t-map
 :prefix "M-SPC t"
 ("m" . menu-bar-mode)
 ("t" . tool-bar-mode)
 ("s" . scroll-bar-mode)
 ("i" . ide-mode)
 ("l" . lsp))

(bind-keys
 :prefix-map c-map
 :prefix "M-SPC c"
 ("e" . eshell))
