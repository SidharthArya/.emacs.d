(use-package lsp-mode
  :ensure emacs-lsp/lsp-mode
  :ensure dash
  :ensure f
  :ensure ht
  :ensure abo-abo/hydra
  :ensure jrblevin/markdown-mode
  :ensure Malabarba/spinner.el
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c i")
  (evil-define-key 'normla 'prog-mode-map (kbd "\\tl") 'lsp)
  :config
  (evil-define-key 'normal 'lsp-mode-map (kbd "\\l") lsp-command-map)
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
                                        ;         (prog-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :ensure emacs-lsp/lsp-ui :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy :ensure emacs-lsp/lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs
  :ensure emacs-lsp/lsp-treemacs
  :ensure Alexander-Miller/treemacs
  :ensure abo-abo/ace-window
  :ensure Alexander-Miller/cfrs
  :ensure Alexander-Miller/pfuture
  :load-path "~/.emacs.d/packages/Alexander-Miller/treemacs/src/elisp"
  :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode
  :ensure emacs-lsp/dap-mode
  :ensure tumashu/posframe
  :ensure alezost/bui.el
  )
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :ensure justbur/emacs-which-key
  :config
  (which-key-mode))
