;;; p1nim1.lisp file

(defun p1turn (curTokens)	
	(setq ans (+ 1 (random (min 3 curTokens))))
	(setq tokensRemaining (- curTokens ans))
	(format t "((p1 ~D) ~D)~%" ans tokensRemaining)
	tokensRemaining)
 
(defun p2turn (curTokens)
	(setq take (+ 1 (random (min 3 curTokens))))
	(setq tokensRemaining (- curTokens take))
	(format t "((p2 ~D) ~D)~%" take tokensRemaining)
	tokensRemaining)
 
(defun printRemaining (remaining)
	(format t "~D tokens remaining~%~%" remaining))
 
(format t "LISP Nim~%~%")
(defun p1nim1 (N)
(setq tok N)
(setq result 
(loop
	(setq tok (p1turn tok))
	(if (<= tok 0)
		(return 1))
	(setq tok (p2turn tok))
	(if (<= tok 0)
		(return 2))))
(format t "~%**P~D wins**" result)
)




