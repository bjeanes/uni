;; Which of the following expressions contain a syntax error and how can it be corrected?

; (6 + 3)              ;; error: should be (+ 6 3)
; (* 4 5 3             ;; error: should have a closing parenthesis
; - (9 3) + (4 6)      ;; error: perhaps (<SOME OPERATOR> (- 9 3) (+ 4 6))  or (+ (- 9 3) (<SOME OPERATOR> 4 6) etc.
; (if (x = 3) x)       ;; error: should be (if (= x 3) x)
; (= (+ 3 3) (> 3 4))  ;; error: cannot compare a number and a boolean. 
                       ;;        change '>' to another operator is one way to solve error