(define [exp base power]
  (exp-iter base power 1))

(define [exp-iter base power-remaining value-so-far]
  (if (zero? power-remaining) value-so-far
      (exp-iter base (- power-remaining 1) (* base value-so-far))
      )
  )


(exp 2 8)