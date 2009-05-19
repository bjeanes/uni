(define [string-map proc the-string]
  (if 
   (empty? the-string) 
   empty
   (list->string 
    (map proc 
         (string->list the-string)
         )
    )
   )
  )

(string-map char-downcase "Hello World!")