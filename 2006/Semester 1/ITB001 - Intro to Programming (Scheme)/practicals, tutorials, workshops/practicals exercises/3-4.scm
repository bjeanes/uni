(define [square num] (* num num))
(define [circle-area r]
  (* pi (square r)))
(define [ring-area outer inner]
  (- (circle-area outer) (circle-area inner)))

(ring-area 10 8)