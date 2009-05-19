;; note: used ifs instead of conds because i couldnt get the less-than to work. kept returning #f or #t instead of returning specified values

(define [square s] (* s s))
(define [sum-squares x y] (+ (square x) (square y)))
(define [sum-squares-of-largest-two a b c]
  (if (< a b) 
      (if (< a c) ; b is the larger
          (sum-squares b c) ; sum-squares b and c here
          (sum-squares a b) ; sum-squares a and b here
          )
      (if (< c b) ; a is the larger
          (sum-squares a b) ; sum-squares a and b here
          (sum-squares a c) ; sum-squares a and c here
          )
      )
  )

(sum-squares-of-largest-two 2 3 4)
(sum-squares-of-largest-two 2 4 3)
(sum-squares-of-largest-two 3 2 4)
(sum-squares-of-largest-two 3 4 2)
(sum-squares-of-largest-two 4 2 3)
(sum-squares-of-largest-two 4 3 2)

