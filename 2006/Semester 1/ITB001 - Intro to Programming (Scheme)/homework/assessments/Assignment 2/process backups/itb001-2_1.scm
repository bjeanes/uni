(define [word-count message]
  (word-count-helper 0 #\space (string->list message))
  
  )

(define [word-count-helper count prev-char char-list]
  (if (empty? char-list) count 
      (word-count-helper 
       (if                   ;; begin first argument passed to word-count-helper iteration
        (and (equal? #\space prev-char) (not (equal? #\space (first char-list))))
        (+ count 1) count
        )                    ;; end first argument
       (first char-list)     ;; second argument
       (rest char-list)      ;; third argument
       )
      )
  )