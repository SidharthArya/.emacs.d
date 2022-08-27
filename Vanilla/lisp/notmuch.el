(p! notmuch
  :straight t)
(defun notmuch-startup-function()
  ""
  (notmuch)
  (get-buffer-create "*notmuch-hello*"))
(setq initial-buffer-choice 'notmuch-startup-function)
