;; What is the value of these expressions?
(* 3 4)                        ;; 12
(* (+ 5 3) (- 5 3))            ;; 16
(/ (+ (* (- 17 14) 5) 6) 7)    ;; 3
(not (> (+ 3 3) (* 2 3)))      ;; #t
(and #t #t #t #t #f)           ;; #f
(or (and #t #f) (or #t #f))    ;; #t