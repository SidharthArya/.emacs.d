(use-package display-line-numbers
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


;; (load-theme 'leuven t)
;; (straight-use-package 'spacemacs-theme)
;; (load-theme 'spacemacs-dark t)

(use-package nimbus-theme
  :straight t
  :config
  (load-theme 'nimbus t))

;; (use-package gruvbox-theme
;;   :straight t
;;   :config
;;   (load-theme 'gruvbox t))