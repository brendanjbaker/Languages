;; -*- lexical-binding: t; -*-

(let ((sum 0))
	(dotimes (i 101)
		(setq sum (+ sum i)))
	(princ sum)
	(princ "\n"))
