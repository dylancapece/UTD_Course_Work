;;; p2nim1.lisp file
(defvar pileindex)

(defun p1turn (list1 pil curTokens)	
	(setq ans (+ 1 (random (min 3 curTokens))))
	(setq tokensRemaining (- curTokens ans))
	(if (((nth pil list1)-ans)<0))
	(setf (nth pil list1)-ans)
	
	(format t "((p1 ~D) ~D)~%" ans tokensRemaining)
	(list1)
	list1)
 
(defun p2turn (list2 pils curTokens)
	(setq take (+ 1 (random (min 3 curTokens))))
	(setq pile (+ 1 (random (min 3 curTokens))))
	(setf (nth pils list2)-take)
	(setq tokensRemaining (- curTokens take))
	(format t "(p2 ~D ~D)" pile take)
	(list2)
	list2)
 
(defun printRemaining (remaining)
	(format t "~D tokens remaining~%~%" remaining))
 
(format t "LISP Nim~%~%")
(defun p2nim1 (N)
(list N N N)
(setq rand(+ 1 (random (min 3 curTokens))))
(setq tok N)
(setq result 
(loop
	(setq tok (p1turn list rand tok))
	(if (<= tok 0)
		(return 1))
	(setq tok (p2turn list rand tok))
	(if (<= tok 0)
		(return 2))))
(format t "~%**P~D wins**" result)
)




