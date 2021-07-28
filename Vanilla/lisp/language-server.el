(p! lsp-mode
  :straight lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c i")
  (evil-define-key 'normal 'prog-mode-map (kbd "\\tl") 'lsp)
  :bind
  ("C-c t l" . lsp)
  :config
  (evil-define-key 'normal 'lsp-mode-map (kbd "\\l") lsp-command-map)
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
                                        ;         (prog-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(p! lsp-ui :straight t :commands lsp-ui-mode)
;; if you are ivy user
;;(p! lsp-ivy :straight t :commands lsp-ivy-workspace-symbol)
(p! lsp-treemacs :straight t
  :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(p! dap-mode :straight t)
;; (p! dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(p! which-key :straight t :config (which-key-mode))
(p! lsp-pyright
  :straight t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))
