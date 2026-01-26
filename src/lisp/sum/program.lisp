(defun main ()
	(princ (apply #'+ (loop for i from 0 to 100 collect i)))
	(terpri))

(main)
