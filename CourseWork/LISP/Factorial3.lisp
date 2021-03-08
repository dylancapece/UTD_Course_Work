(defun factorial3 (n)
    (do
       ((i 1 (+ 1 i))
        (num 1 (* i num)))
       ((equal i (+ n 1)) num)))
(setq fact (make-hash-table) )
(setf (gethash '7 fact) (factorial3 7) )