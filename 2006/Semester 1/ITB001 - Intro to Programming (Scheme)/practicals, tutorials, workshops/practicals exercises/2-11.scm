(define a 3)
(define b 4)

; 1)    result = 4
(if (and (> b a) (< b (* a b))) b a)

; 2)    result = 16
(cond [(= a 4) 6]
      [(= b 4) (+ 6 7 a)]
      [else 25]
      )

; 3)    result = 6
(+ 2 (if (> b a) b a))

; 4)    result = 16
(* (cond [(> a b) a]
         [(< a b) b]
         [else -1]
         )
   (+ a 1))