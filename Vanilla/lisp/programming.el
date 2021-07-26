(use-package ide-mode
  :straight (ide-mode :type git :fetcher github :repo "https://github.com/SidharthArya/emacs-ide-mode" :files (:defaults))
  :init
  (require 'ide-mode)
  :config
  (require 'ide-mode-recipes)
  (evil-define-key 'normal 'prog-mode-map (kbd "\\i") ide-mode-command-map) 
  (evil-define-key 'normal 'ide-slave-mode-map (kbd "\\i") ide-mode-command-map)
  (evil-define-key 'normal 'prog-mode-map (kbd "\\ti") 'ide-mode)

  :bind
 ("C-c t i" . ide-mode)
  (:map ide-mode-command-map
        ("s" . ide/goto-shell)
        ("c" . ide/ide-mode-compile)
        ("e" . ide/ide-mode-execute)
        ("l" . ide/goto-input)
        ("k" . ide/goto-output)
        ("h" . ide/goto-code))
  :commands ide-mode)

(p! flycheck
  :straight t
  :hook (prog-mode . flycheck-mode)
  :commands flycheck-mode)

