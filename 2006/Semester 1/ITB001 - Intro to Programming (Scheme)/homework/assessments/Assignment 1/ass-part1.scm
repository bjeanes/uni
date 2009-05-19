;;
;; ITB001 Semester 1, 2006
;; Text Processing Assignment, Part 1 (due: Friday 24th March)

;; Name: Bodaniel Jeanes
;; Student number: 5687802


;; PROCEDURE:
(define [text-cost bits-per-byte bits-per-word cents-per-word message]
  (if (and
       (number? bits-per-byte)
       (number? bits-per-word)
       (number? cents-per-word)
       (>= bits-per-byte 8) ;makes sure bits-per-byte is at least 8 (also takes care of positive check)
       (and 
        (> bits-per-word 0) ;check that it's positive
        (or 
         (= (/ bits-per-word bits-per-byte) (round (/ bits-per-word bits-per-byte))) ;better way to make sure 
         ;bits-per-byte is a factor 
         ;of bits-per-word?
         )
        )
       (> cents-per-word 0) ;check that it's positive
       (string? message) ;check that it's a string
       ) ;end 'and' statement
      ( ;do real work here (above is just checking that input meets criteria)
       list 
       (* (string-length message) bits-per-byte)  ;bits needed to store message
       (string-length message)                    ;bytes needed to store message
       (ceiling (/ (* (string-length message) bits-per-byte) bits-per-word))     ;WHOLE words required to store message
       (* (ceiling (/ (* (string-length message) bits-per-byte) bits-per-word)) cents-per-word) ;cost to send message, only whole words can be sent
       )
      "ERROR"
      )
  )

;; Some Tests

;(text-cost "8" 16 5 "See Spot run.")
;; should return "ERROR" because "8" is not a number
;(text-cost 0 16 5 "See Spot run.")
;; should return "ERROR" because 0 is not a positive number
;(text-cost 8 16 -5 "See Spot run.")
;; should return "ERROR" because -5 is not a positive number
;(text-cost 8 16 5 7) 
;; should return "ERROR" because 7 is not a string
;(text-cost 6 24 10 "See Spot run.")
;; should return "ERROR" because we can't represent a character in
;; only 6 bits
;(text-cost 8 30 5 "See Spot run.")
;; should return "ERROR" because the number of bits per word is not a
;; whole multiple of the number of bits per byte
;(text-cost 8 32 1 "")
;; should return (list 0 0 0 0) bits, bytes, words and cents
;(text-cost 8 32 4 "X")
;; should return (list 8 1 1 4) bits, bytes, words and cents
;(text-cost 8 32 4 "XYZ")
;; should return (list 24 3 1 4) bits, bytes, words and cents
;(text-cost 8 32 4 "See Spot run.")
;; should return (list 104 13 4 16) bits, bytes, words and cents
;(text-cost 8 16 5 "The quick brown fox jumps over the lazy dog!")
;; should return (list 352 44 22 110) bits, bytes, words and cents
;(text-cost 12 60 8 "The quick brown fox jumps over the lazy dog!")
;; should return (list 528 44 9 72) bits, bytes, words and cents
;(text-cost 11 33 10 "See Spot run.")
;; should return (list 143 13 5 50) bits, bytes, words and cents
