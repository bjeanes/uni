(define [longest-word-length list-of-words]
  (if (empty? list-of-words) -1
      (if (> (string-length (first list-of-words)) (longest-word-length (rest list-of-words))) (string-length (first list-of-words)) (longest-word-length (rest list-of-words)))
      )
  )