;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c i")
;;   (evil-define-key 'normal 'prog-mode-map (kbd "\\tl") 'lsp)
;;   :bind
;;   (:map space-prefix
;;         ("t l" . lsp))
;;   :config
;;   (evil-define-key 'normal 'lsp-mode-map (kbd "\\l") lsp-command-map)
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;                                         ;         (prog-mode . lsp)
;;          ;; if you want which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp)

;; ;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; ;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs
;;   :commands lsp-treemacs-errors-list)

;; ;; optionally if you want to use debugger
;; (use-package dap-mode)
;; ;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; ;; optional if you want which-key integration
(use-package which-key :config (which-key-mode))

