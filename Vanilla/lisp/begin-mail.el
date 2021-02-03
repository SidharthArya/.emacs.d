(set-frame-parameter nil 'title "Mail")
(gnus)
(add-hook 'after-make-frame-functions (lambda (&optional frame) (switch-to-buffer "*Group*")))
