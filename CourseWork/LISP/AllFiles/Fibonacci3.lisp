(defun fibonacci3(n)
(do ( (num 0 (1+ num) )
(cur 0 next)
(next 1 (+ cur next ) ) )
( ( = n num ) cur) ) )
(setq factorial (make-hash-table) )
(setf (gethash '7 factorial) (fibonacci3 7) )

