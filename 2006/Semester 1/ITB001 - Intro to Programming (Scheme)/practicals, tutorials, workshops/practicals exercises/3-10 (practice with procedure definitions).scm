(define [square n] (* n n))
(define [sum-of-squares x y] (+ (square x) (square y)))
(define [f a] (sum-of-squares (+ a 1) (* a 2)))

(sum-of-squares 3 4)     ;; 25
(f 5)                    ;; 136