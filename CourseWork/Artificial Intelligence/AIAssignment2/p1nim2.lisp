;;; p1nim2.lisp file

(defvar nodes 0)
(defvar leafnodes 0)

(defstruct node
	value
	weight
	player
	leftchild
	middlechild
	rightchild
)

(defun buildtree (root)
	(setq nodes (+ nodes 1))
	(if (= (node-player root) 1) (setq curplayer 2) (setq curplayer 1))
	(if (= (node-value root) 0) (setq leafnodes (+ leafnodes 1)))
	(if (and (= (node-value root) 0) (= curplayer 2)) (setf (node-weight root) 1))
	(if (and (= (node-value root) 0) (= curplayer 1)) (setf (node-weight root) -1))
	(if (> (node-value root) 0) (setf (node-leftchild root) (make-node :value (- (node-value root) 1) :player curplayer)))
	(if (> (node-value root) 1) (setf (node-middlechild root) (make-node :value (- (node-value root) 2) :player curplayer)))
	(if (> (node-value root) 2) (setf (node-rightchild root) (make-node :value (- (node-value root) 3) :player curplayer)))
	(if (node-leftchild root) (buildtree (node-leftchild root)))
	(if (node-middlechild root) (buildtree (node-middlechild root)))
	(if (node-rightchild root) (buildtree (node-rightchild root)))
)

(defun p1nim2 (N)
(setq node (make-node :value N
		      :player 1))
(buildtree node)
(format t "The total number of the leaf node generated: ~D" leafnodes)
(format t "~%The total number of the nodes generated: ~D" nodes)
(format t "~%The first solution: the depth of the solution is: ~D" nodes)
(format t "~%The best solution: the depth of the solution is: ~D" nodes)

)









