(define [remove-second given-list]
  (if (>= (length given-list) 2) 
      (cons (first given-list) (rest (rest given-list)))
      (display "List too short!")
      )
  )

(remove-second (list 1 2 3 4 5))
(remove-second (list "Moe" "Larry" "Curly"))