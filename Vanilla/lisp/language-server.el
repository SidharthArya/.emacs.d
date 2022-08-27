(p! lsp-mode
  :straight lsp-mode
  :bind
  ("C-c t l" . lsp)
  ("C-c l r" . lsp-find-references)
  ("C-c l d" . lsp-find-definition)
  :hook (
         (javascript-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
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
(p! lsp-dart :straight t
  :custom
  (lsp-dart-flutter-sdk-dir "~/.local/opt/flutter"))

(p! lsp-origami
  :straight t
  :bind
  :config
  (add-hook 'lsp-after-open-hook #'lsp-origami-try-enable)
  (global-set-key (kbd "C-c <") 'origami-open-node)
  (global-set-key (kbd "C-c >") 'origami-close-node)
  :hook
  (prog-mode . origami-mode))

  
;; (p! lsp-ng
;;   :straight (lsp-ng :fetcher github :repo "https://github.com/SidharthArya/lsp-ng")
;;   :custom
;;   (lsp-ng-find-path "~/.nvm/versions/node/v14.18.1")
;;   :config
;;   (lsp-ng-init))
