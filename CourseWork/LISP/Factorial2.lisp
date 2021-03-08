(defun factorial2 (n &optional (a 1))
(if (< n 2) a (factorial2 (1- n) (* a n))))
(setq fact (make-hash-table) )
(setf (gethash '7 fact) (factorial2 7) )
