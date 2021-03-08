(defun FLATTEN (list)
  (labels ((%FLATTEN (list tail)
             (cond
               ((null list) tail)
               ((atom list) (list* list tail))
               (t (%FLATTEN (first list)
                            (%FLATTEN (rest list)
                                      tail))))))
    (%FLATTEN list '())))
