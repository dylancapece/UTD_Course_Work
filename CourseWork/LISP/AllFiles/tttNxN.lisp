(defun generate-board (n)
  (loop repeat (* n n) collect nil))
;;(defparameter *straights*
  ;;   '((1 2 3) (2 3 4) (5 6 7) (6 7 8) (9 10 11) (10 11 12)
    ;;(13 14 15) (14 15 16) (5 9 13) (2 6 10) (1 5 9) (3 7 11) (6 10 14) (7 11 15) (4 8 12) (1 6 11) (8 12 16) (5 10 15) (2 7 12) (10 7 4) (13 10 7) (6 11 16) (9 6 3) (14 11 8)))

(defun make-straights(board n)
    (setq entry '())
    (loop for i from 1 to (length board) 
        do (progn (setq j i) 
               (setq entry (append entry (list (list j (+ j 1) (+ j 2))))) 
               (if (<= (* 2 n) (length board)) 
                   (setq entry (append entry (list (list j (+ j n) (+ j (* 2 n))))))) 
               (if (and (< j (- n 2)) (<= (+ (* 2 n) 2) (length board))) 
                   (setq entry (append entry (list (list j (+ j (+ n 1)) (+ j (+ (* 2 n) 2))))))) 
               (if (and (> j 2) (<= (+ (* 2 n) 2) (length board))) 
                   (setq entry (append entry (list (list j (+ j (- n 1)) (+ j (- (* 2 n) 2))))))) 
               (setq j (+ (mod j n) 1)))) entry) 

(defparameter *current-player* 'x)

(defun get-board-elt (n board)
  (nth (1- n) board))

(defun legal-p (n board)
  (null (get-board-elt n board)))

(defun set-board-elt (n board symbol)
  (if (legal-p n board)
    (setf (nth (1- n) board) symbol)
      (progn (format t "Illegal move. Try again.~&")
          (set-board-elt (read) board symbol))))

(defun list-legal-moves (board)
  (loop for i from 1 to (length board)
     when (legal-p i board)
     collect i))

(defun get-random-element (entry)
  (nth (random (length entry)) entry))

(defun multi-non-nil-eq (entry)
  (and (notany #'null entry)
       (notany #'null (mapcar #'(lambda (x) (eq (car entry) x)) entry))
       (car entry)))

(defun elements-of-straights (board)
  (loop for i in *straights*
     collect (loop for j from 0 to 2
        collect (get-board-elt (nth j i) board))))
(defun find-winner (board)
  (car (remove-if #'null (mapcar #'multi-non-nil-eq (elements-of-straights board)))))
 
(defun set-player (mark)
  (format t "Shall a computer play as ~a? (y/n)~&" mark)
  (let ((response (read)))
   (cond ((equalp response 'y) t)
       ((equalp response 'n) nil)
       (t (format t "Come again?~&")
          (set-player mark)))))

(defun player-move (board symbol)
  (format t "~%Player ~a, please input your move.~&" symbol)
  (set-board-elt (read) board symbol)
  (format t "~%"))

 

(defun computer-move (board symbol)
  (let ((move (get-random-element (list-legal-moves board))))
    (set-board-elt move board symbol)
    (format t "~%computer selects ~a~%~%" move)))

 
(defun computer-move-p (current-player autoplay-x-p autoplay-o-p)
  (if (eq current-player 'x)
      autoplay-x-p
      autoplay-o-p))

(defun perform-turn (current-player board autoplay-x-p autoplay-o-p)
  (if (computer-move-p current-player autoplay-x-p autoplay-o-p)
      (computer-move board current-player)
      (player-move board current-player)))

 

(defun switch-player ()
  (if (eq *current-player* 'x)
      (setf *current-player* 'o)
      (setf *current-player* 'x)))

 

(defun display-board (board n)
  (loop for i downfrom (- n 1) to 0
     do (loop for j from 1 to n
	   initially (format t "|")
	   do (if (or (or (eq (or (get-board-elt (+ (* n i) j) board) (+ (* n i) j)) 'x) 
                          (eq (or (get-board-elt (+ (* n i) j) board) (+ (* n i) j)) 'o))
                   (and (> (or (get-board-elt (+ (* n i) j) board) (+ (* n i) j)) 0)
                        (< (or (get-board-elt (+ (* n i) j) board) (+ (* n i) j)) 10)))
               (format t "~a |" (or (get-board-elt (+ (* n i) j) board) (+ (* n i) j))) 
               (format t "~a|" (or (get-board-elt (+ (* n i) j) board) (+ (* n i) j))))
	   finally (format t "~&"))))

 

(defun tic-tac-toe (n)
  (setf *current-player* 'x)
  (let ((board (generate-board n))
    (autoplay-x-p (set-player 'x))
     (autoplay-o-p (set-player 'o)))
     (setf *straights* (make-straights board n))
    (format t "~%")
    (loop until (or (find-winner board) (null (list-legal-moves board)))
       do (display-board board n)     
       do (perform-turn *current-player* board autoplay-x-p autoplay-o-p)
       do (switch-player)
       finally (if (find-winner board)
              (format t "The winner is ~a!" (find-winner board))
              (format t "It's a tie.")))))