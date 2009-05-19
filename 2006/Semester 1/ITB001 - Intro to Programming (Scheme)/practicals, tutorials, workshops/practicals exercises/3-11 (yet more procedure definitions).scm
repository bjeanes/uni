(define [f x] (* x x))
(define square f)   ;; according to results below, this 'copies' the 
                    ;;   procedure to a new name; it doesn't 'point' 
                    ;;   to the original procedure.

(f 7)                    ;; 49
(square 7)               ;; 49
(define [f x] (+ x 2))   ;; 9
(f 7)                    ;; 49
(square 7)