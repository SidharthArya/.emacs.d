(use-package display-line-numbers
  :straight t
  :init
  (defun my/display-line-numbers () 
    (setq display-line-numbers-width-start t
          display-line-numbers-grow-only t
          display-line-numbers 'relative))
                                        ;(column-number-mode +1)
  (defun display-line-numbers-equalize ()
    "Equalize The width"
    (setq display-line-numbers-width (length (number-to-string (line-number-at-pos (point-max))))))
  :hook
  (prog-mode . display-line-numbers-equalize)
  (prog-mode . my/display-line-numbers)
  (org-mode . display-line-numbers-equalize)
  (org-mode . my/display-line-numbers))


;; (load-theme 'tango-system t)
;; (straight-use-package 'spacemacs-theme)
;; (load-theme 'spacemacs-dark t)

;; (use-package nimbus-theme
;;   :straight t
;;   :config
;;   (load-theme 'nimbus t))

;; (use-package gruvbox-theme
;;   :straight t
;;   :config
;;   (load-theme 'gruvbox t))
;; (use-package spacemacs-theme
;;   :straight t
;;   :init
;;   (load-theme 'spacemacs-dark t))
;; (use-package zenburn-theme
;;   :custom
;;   (zenburn-use-variable-pitch t)
;;   (zenburn-scale-org-headlines t)
;;   (zenburn-scale-outline-headlines t)
;;   :init
;;   (load-theme 'zenburn t))
;; (p! solarized-theme
;;   :straight t
;;   :config
;;   (load-theme 'solarized-zenburn t))

;; (p! hl-line
;;   :config
;;   (global-hl-line-mode +1))
(load-theme 'doom-one t)
