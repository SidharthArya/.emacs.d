(use-package ido
  :ensure t
  :custom
  (ido-use-filename-at-point 'guess)
  (ido-create-new-buffer 'always)
  (ido-file-extensions-order '(".py" ".org" ".txt"  ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))
  (ido-ignore-buffers '("\*.*\*"))
  (ido-ignore-directories '("\..*"))
  (ido-ignore-files '("\..*"))
  :config
  (ido-mode t))

(use-package powerido
  :ensure SidharthArya/powerido)
