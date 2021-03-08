
(defun factorial3(n)
(setq f 1)
(loop for a from 1 to n
do (setq f (* f a))
)
(format t "Factorial: ~a~%" f)
)
