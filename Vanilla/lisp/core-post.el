(mapcar #'(lambda (el) (add-to-list 'file-name-handler-alist el)) my-temp-file-name-handler-alist)
(setq gc-cons-threshold my-temp-gc-cons-threshold )
