(define [apply-and-sum proc items]
  (if (empty? items) 0 
      (+ (proc (first items)) (apply-and-sum proc (rest items)))
      )
  )

;(apply-and-sum abs (list 2 4 -6 23 -8 -4))