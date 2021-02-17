(use-package haskell-mode :straight haskell-mode :commands haskell-mode)
(use-package rust-mode :straight rust-mode :commands rust-mode)
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode)) 
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
