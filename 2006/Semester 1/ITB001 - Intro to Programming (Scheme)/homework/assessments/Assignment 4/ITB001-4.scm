;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ITB001 Semester 1, 2006
;;
;; Text Processing Assignment - Part 4 (due Friday 2nd June)
;; Spellchecking and user interface

(load "ITB001-1.scm")
(load "ITB001-2.scm")
(load "ITB001-3.scm")

;; <Put your solution to Part 4a here>
(define [spell-check string dictionary]
  (define [helper token-list]
    (if (empty? token-list) ; base case
        empty
        ;; recursively replace each word with output of get-word
        (cons (get-word (first token-list)) (helper (rest token-list)))))
  
  (define [get-word word]
    (define token-test ;; should the word be replaced with a new one?
      (and (or (char-alphabetic? (first (string->list word))) 
               (char-numeric? (first (string->list word)))) 
           (equal? (lookup word dictionary) "???")))
    
    (if token-test
        (let [[new-word empty]]
          (display "Word not recognized: ")
          (display word)
          (display "\nHit RETURN to accept word ")
          (display "or enter replacement\n") 
          (set! new-word (read-line))
          (if (equal? new-word "") word new-word))
        word))
  (tokens->string (helper (string->tokens string))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; <Put your solution to Part 4b here>
(define [message msg-string]
  ;nothing spectacular here:
  (define [show-msg] msg-string)
  
  ; returns the price of msg-string using text-cost
  (define [show-price]
    (let [[price (fourth (text-cost 8 32 3 msg-string))] ; 3c/byte-word
          [words (word-count msg-string)]] ; how many human-words?
      (string-append  ; human-friendly string reporting price of msg-string
       ; plural/singular tests (one isn't used for these prices, but makes
       ;  for easy upgradability (only have to change price!).
       (number->string price) (if (= 1 price)  " cent for " " cents for ")
       (number->string words) (if (= 1 words) " word" " words"))))
  
  ; encrypt and return msg-string using the encipher procedure
  (define [encrypt-msg key]
    (begin (set! msg-string (encipher msg-string key)) (show-msg)))
  
  ; finds matching decryption key from given key, and calls the
  ;  above encrypter and returns output
  (define [decrypt-msg key] (encrypt-msg (decryption-key key)))
  
  ; translate and return msg-string
  (define [translate-msg dictionary]
    (begin (set! msg-string (translation msg-string dictionary)) (show-msg)))
  
  ; call spell-check and update and return msg-string
  (define [spell-check-msg dictionary]
    (begin (set! msg-string (spell-check msg-string dictionary)) (show-msg)))
  
  ;################# DISPATCH: #####################
  (define [dispatch cmd-string]
    ; case procedure would be better but couldn't get case to work
    ;  in scheme implementation.
    (cond
      [(equal? cmd-string "show") show-msg]
      [(equal? cmd-string "price") show-price]
      [(equal? cmd-string "encrypt") encrypt-msg]
      [(equal? cmd-string "decrypt") decrypt-msg]
      [(equal? cmd-string "translate") translate-msg]
      [(equal? cmd-string "spellcheck") spell-check-msg]
      
      ;; if bad command, let the user know!
      [else (error "Unknown command:" cmd-string)]
      )) 
  dispatch)

; "Syntactic sugar" procedures:
(define [show object] ((object "show")))
(define [price object] ((object "price")))
(define [encrypt object key] ((object "encrypt") key))
(define [decrypt object key] ((object "decrypt") key))
(define [translate object dictionary] ((object "translate") dictionary))
(define [spellcheck object dictionary] ((object "spellcheck") dictionary))