(defun NxNcannibal (x y)

(setq p1 (make-cannibal-problem :initial-state (make-cannibal-state :m1 x :c1 x :b1 y)))
(setq result (breadth-first-search p1))
(solution-actions result)
(solution-nodes result)
(solve p1)

(setq p1 (make-cannibal-problem :initial-state (make-cannibal-state :m1 x :c1 x :b1 y)))
(setq result (uniform-cost-search p1))
(solution-actions result)
(solution-nodes result)
(solve p1)


(setq p1 (make-cannibal-problem :initial-state (make-cannibal-state :m1 x :c1 x :b1 y)))
(setq result (no-returns-breadth-first-search p1))
(solution-actions result)
(solution-nodes result)
(solve p1)


(setq p1 (make-cannibal-problem :initial-state (make-cannibal-state :m1 x :c1 x :b1 y)))
(setq result (no-duplicates-breadth-first-search p1))
(solution-actions result)
(solution-nodes result)
(solve p1)


(setq p1 (make-cannibal-problem :initial-state (make-cannibal-state :m1 x :c1 x :b1 y)))
(setq result (no-cycles-depth-first-search p1))
(solution-actions result)
(solution-nodes result)
(solve p1)


)