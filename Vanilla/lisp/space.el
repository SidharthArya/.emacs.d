(bind-keys
 :prefix-map space-prefix
 :prefix "M-SPC")

;; (when (modular-config-modules-loaded-p 'org)
;;   (bind-keys
  
(defun my-find-config ()
  (interactive)
  (let*
      ((files (split-string (string-trim (shell-command-to-string "ls ~/.emacs.d/lisp"))))
       (temp (push "../init.el" files))
       (files (completing-read-multiple "Emacs Config File: " files)))
    (mapc #'(lambda(a) (find-file (concat "~/.emacs.d/lisp/" a))) files)))



;; (bind-keys
;;  :prefix-map d-prefix
;;  :prefix "M-SPC d"
;;  ("t" . helm-world-time)
;;  ("s" . helm-system-packages))


(when (modular-config-modules-loaded-p 'vi)
  (evil-define-key 'normal 'global (kbd "SPC") 'space-prefix)
  (evil-define-key 'normal 'dashboard-mode-map (kbd "SPC") 'space-prefix)
  (evil-define-key '(normal visual motion insert) 'global (kbd "C-c") 'space-prefix)
  )


;; (when (modular-config-modules-loaded-p 'vc)
;;   (bind-keys
;;    :prefix-map g-map
;;    :prefix "M-SPC g"
;;    ("c" . magit-commit)
;;    ("C" . magit-clone)))


;; (when (modular-config-loaded-module-p 'vi)
;;   (bind-keys
;;    :prefix-map h-map
;;    :prefix "M-SPC h"
;;    ("M" . helm-man-woman)
;;    ("f" . helpful-function)
;;    ("v" . helpful-variable)
;;    ("b" . describe-bindings)
;;    ("." . helpful-at-point)))



;; (bind-keys
;;  :prefix-map t-map
;;  :prefix "M-SPC t"
;;  ("m" . menu-bar-mode)
;;  ("t" . tool-bar-mode)
;;  ("s" . scroll-bar-mode)
;;  ("i" . ide-mode)
;;  ("l" . lsp))

;; (bind-keys
;;  :prefix-map c-map
;;  :prefix "M-SPC c"
;;  ("e" . eshell))

;; (evil-define-key
;;   'normal org-agenda-mode-map
;;   "t" 'org-agenda-todo
;;   "TAB" 'org-agenda-goto
;;   "RET" 'org-agenda-switch-to
;;   "e" 'org-agenda-set-effort
;;   "B" 'org-agenda-bulk-action
;;   "M" 'org-agenda-bulk-mark
;;   "u" 'org-agenda-bulk-unmark
;;   "U" 'org-agenda-bulk-unmark-all
;;   "*" 'org-agenda-bulk-mark-all
;;   "d" 'org-agenda-deadline
;;   "s" 'org-agenda-schedule
;;   "/" 'org-agenda-filter
;;   )
