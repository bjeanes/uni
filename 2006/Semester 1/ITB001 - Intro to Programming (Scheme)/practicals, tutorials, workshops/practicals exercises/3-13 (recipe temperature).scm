(define [candy-temperature temp elevation]
  (round (- temp (/ elevation 500.0)))
  )

(candy-temperature 244 5280)