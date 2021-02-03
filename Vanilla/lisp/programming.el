(use-package ide-mode
  :ensure SidharthArya/emacs-ide-mode
  :init
  (require 'ide-mode)
  :config
  (require 'ide-mode-recipes)
  
  (define-key prog-mode-map (kbd "H-x") ide-mode-command-map) 
  (define-key ide-slave-mode-map (kbd "H-x") ide-mode-command-map)
  (define-key prog-mode-map (kbd "H-\\ i") 'ide-mode) 
  :bind
  (:map ide-mode-command-map
        ("s" . ide/goto-shell)
        ("c" . ide/ide-mode-compile)
        ("e" . ide/ide-mode-execute)
        ("l" . ide/goto-input)
        ("k" . ide/goto-output)
        ("h" . ide/goto-code))
  :commands ide-mode)

(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode)
  :commands flycheck-mode)
