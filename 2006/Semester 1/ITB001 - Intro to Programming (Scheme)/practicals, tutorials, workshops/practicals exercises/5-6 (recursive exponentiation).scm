(define [exp base power]
  (if (= power 1) base
      (* base (exp base (- power 1)))))


(exp 2 8)