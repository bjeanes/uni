(define [calculate-interest amount]
  (if (<= amount 1000) (* .04 amount) (* .05 amount))
  )

(calculate-interest 2500)
(calculate-interest 600)