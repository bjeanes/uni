;;  What is returned by each of the following?
(if (< 2 3)
    "First Option" "Second Option")    ;; "First Option"

(if (or (< 2 3) (> 2 3))
    "First Option"
    "Second Option"
    )                                  ;; "First Option"


;; Write an 'if' expression that returns string "True"
;; when its condition evaluation to true, and returns string "False"

;(define cond #t)  ; can be anything
(if cond "True" "False")