(use-package pdf-tools
  :ensure t
  ;; :ensure tali713/esxml
  ;; :ensure https://depp.brause.cc/nov.el.git
  :config
  (require 'pdf-occur)
  (require 'pdf-history)
  (require 'pdf-annot)
  (require 'pdf-links)
  (require 'pdf-outline)
  (require 'pdf-sync)
  (pdf-tools-install))
