(setq modules-config-list '(
				(minimal (compile core appearance))
				(main (compile core appearance packages programming vi mount org news mail dashboard vc ivy tracking finance server))
				))
    (setq modules-config-default 'main)
  (setq modules-path "~/.emacs.d/lisp")
(setq modules-inject-modules-list nil)
    (defun command-line-args-process ()
      ""
      (interactive)
      (let ((config nil))
      (dolist (it command-line-args)
	(if (equal it "--config")
	    (progn
	      (setq command-line-args (delete it command-line-args))
	      (setq config t))
	  (if (equal config t)
	      (progn
		(setq config it)
	      (setq command-line-args (delete it command-line-args))

		))))
      (if (equal config nil)
	  (setq config (symbol-name modules-config-default)))
  (modules-process (intern config))))




  (defun modules-process (arg)
  "Processing various modules"

  (let ((modules nil))
  (dolist (it modules-config-list) 
  (if (equal (car it) arg)
	    (setq modules (car (cdr it)))
	    )
	)
  (dolist
      (module modules)
  ;;  (message  module)
    (load (concat modules-path "/" (symbol-name module)))
    (message "[Module]: %s" (symbol-name module))

    )))

    (defun modules-inject-modules-add (a)
    ""
    (interactive)
    (add-to-list 'modules-inject-modules-list a)

    )
    (defun modules-inject-modules ()
       ""
      (interactive)
      (let ((modules nil))
      (while (not (equal (setq module (read-string "Modules: ")) ""))
	 (mapc #'modules-inject-modules-add (split-string module))))
      (mapc #'modules-process modules-inject-modules-list))

  (command-line-args-process)
