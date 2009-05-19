(define [square num] (* num num))
(define [circle-area r]
  (* pi (square r)))
(define [ring-area outer inner]
  (- (circle-area outer) (circle-area inner)))

(define [pipe-volume outer inner length]
  (* length (ring-area outer inner))
  )

(pipe-volume 4 3 5)