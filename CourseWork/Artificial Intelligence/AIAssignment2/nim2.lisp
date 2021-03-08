(format t "LISP Nim~%~%")

;; (setq tok 8)
;; (format t "We have ~D tokens initially.~%" tok)

(defun random123 ()  ;; this returns a number 1,2,or 3
	(+ 1 (random 3))
)

(defun take123 (tokens) 
	;; given # of tokens, return a number 1,2,3 or tokens
	(if (>= tokens (setq x (+ 1 (random 3))))
		x
		tokens
	)
)
			 

(defun pturn (curTokens)
	(write-string "How many tokens would you like to take?: ")
	(setq ans (read))
	(setq tokensRemaining (- curTokens ans))
	(format t "You take ~D tokens~%" ans)
	(printRemaining tokensRemaining)
	tokensRemaining)
 
(defun cturn (curTokens)
	(setq take (take123 curTokens))
	(setq tokensRemaining (- curTokens take))
	(format t "Computer takes ~D tokens~%" take)
	(printRemaining tokensRemaining)
	 tokensRemaining)
 
(defun printRemaining (remaining)
	(format t "~D tokens remaining~%~%" remaining))

(defun runNim ()
	(write-string "How many tokens would it be initially?: ")
	(setq tok (read))

	(loop
		(setq tok (pturn tok))
		(if (zerop tok)  
			(return (write-string "You win!"))
		)

		(setq tok (cturn tok))
		(if (zerop tok)  
			(return (write-string "Computer wins!"))
		)
	)
	(write-string "Game ends!")
)



