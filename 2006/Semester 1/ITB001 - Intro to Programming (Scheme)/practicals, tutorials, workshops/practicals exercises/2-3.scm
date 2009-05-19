(not #t)                      ;; returns #f: 'not' always returns opposite boolean value.
(not (= (* 2 3) (+ 3 3)))     ;; returns #f: evaluated as '(not (= 6 6))'.
                              ;;                 - inner statement is #t, so 
                              ;;                   'not' makes final result #f.
(and (< 3 5) (< 4 6) (< 5 7)) ;; returns #t: all inner procedures return #t.
(or (< 3 5) (< 4 6) (< 5 7))  ;; returns #t: one or more inner procedures return #t.
(and (or #f #t) (or #t #f))   ;; returns #t: both inner statemets return #t.
                              ;;                 - both inner-most statements contain
                              ;;                   at least one #t value.