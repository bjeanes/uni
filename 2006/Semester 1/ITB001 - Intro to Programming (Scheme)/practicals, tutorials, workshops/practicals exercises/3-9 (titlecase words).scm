(define [titlecase-word given-string]
  (list->string (cons (char-upcase (first(string->list given-string))) (rest(string->list given-string))))
  )

(titlecase-word "spock")