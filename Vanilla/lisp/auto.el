(use-package haskell-mode :ensure haskell/haskell-mode :commands haskell-mode)
(use-package rust-mode :ensure rust-lang/rust-mode :commands rust-mode)
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode)) 
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
