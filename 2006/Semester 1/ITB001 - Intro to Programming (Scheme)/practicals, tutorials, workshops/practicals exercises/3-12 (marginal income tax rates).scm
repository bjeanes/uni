(define [tax income]
  (if (< income 10000)
      0
      (* 0.2 (- income 10000)))
  )

(tax 12500)