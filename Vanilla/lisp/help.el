(use-package helpful
  :bind
  (:map space-prefix
   ("h M" . helm-man-woman)
   ("h f" . helpful-function)
   ("h h" . helpful-symbol)
   ("h v" . helpful-variable)
   ("h b" . describe-bindings)
   ("h ." . helpful-at-point))
  )

