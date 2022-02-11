(p! comp-ide
  :straight (comp-ide :type git :fetcher github :repo "https://github.com/SidharthArya/comp-ide.el" :files (:defaults))
  :custom
  (comp-ide-auto-execute-on-compile t)
  :config
  (require 'comp-ide-recipes)
  (evil-define-key 'normal 'prog-mode-map (kbd "\\i") comp-ide-command-map)
  (evil-define-key 'normal 'comp-ide-slave-mode-map (kbd "\\i") comp-ide-command-map)
  (evil-define-key 'normal 'prog-mode-map (kbd "\\ti") 'comp-ide)
  :bind
  ("C-c t i" . comp-ide)
  (:map comp-ide-command-map
        ("s" . comp-ide-goto-shell)
        ("c" . comp-ide-comp-ide-compile)
        ("e" . comp-ide-comp-ide-execute)
        ("l" . comp-ide-goto-input)
        ("k" . comp-ide-goto-output)
        ("h" . comp-ide-goto-code))
  :commands comp-ide)

(p! flycheck
  :straight t
  :hook (prog-mode . flycheck-mode)
  :commands flycheck-mode)

(p! dart-mode
  :straight t)

(p! yaml-mode
  :straight t)

(p! typescript-mode
  :straight t)

(p! tree-sitter
  :straight t)

(p! groovy-mode
  :straight t)
(p! restclient :straight t)
