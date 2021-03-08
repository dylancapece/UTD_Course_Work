(defun fibonacci2 (n)
(labels ((fib (n a b)
(if (= n 0)
a
(fib (- n 1) b (+ a b)))))
(fib n 0 1)))
(setq fact (make-hash-table) )
(setf (gethash '7 fact) (fibonacci2 7) )
