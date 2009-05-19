(define [apply-and-sum proc items]
  (if (empty? items) 0 
      (+ (proc (first items)) (apply-and-sum proc (rest items)))
      )
  )


(define [count-chars list-of-words]
  (apply-and-sum string-length list-of-words))

