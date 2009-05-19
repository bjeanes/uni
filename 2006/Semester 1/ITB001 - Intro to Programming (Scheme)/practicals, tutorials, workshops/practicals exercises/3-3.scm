(define [gst product] (* product .1))
(define [add-gst a b] (gst (+ a b)))

(add-gst (+ 10 8) (* 3 4))