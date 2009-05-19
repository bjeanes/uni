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
  (define [helper tokens total-list]
    (if (empty? tokens)
        (tokens->string total-list)
        (helper (rest tokens) 
                (append 
                 total-list 
                 (list 
                  (get-word 
                   (string->list 
                    (first tokens))))))))
  
  (define [get-word word]
    (let [[new-word empty]]
      (if (and
           (or (char-alphabetic? (first word)) (char-numeric? (first word))) 
           (equal? (lookup (list->string word) dictionary) "???"))
          (begin 
            (display (string-append 
                      "Word not recognized: " 
                      (list->string word) 
                      "\nHit RETURN to accept word "
                      "or enter replacement\n")) 
            (set! new-word (read-line))
            (if (equal? new-word "") (list->string word) new-word))
          (list->string word))))
  (helper (string->tokens string) (list)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; <Put your solution to Part 4b here>
(define [message msg-string]
  (define [show-msg] msg-string) ; returns message
  
  (define [show-price]               ; returns the cost of the message
    (let 
        [[price (fourth (text-cost 8 32 3 msg-string))]
         [words (word-count msg-string)]]
      (string-append 
       (number->string price) (if (= 1 price)  " cent for " " cents for ")
       (number->string words) (if (= 1 words) " word" " words"))))
  
  (define [encrypt-msg key]          ; encrypts message
    (begin (set! msg-string (encipher msg-string key)) (show-msg)))
  (define [decrypt-msg key] (encrypt-msg (decryption-key key)))
  (define [translate-msg dictionary] ; translates message
    (begin 
      (set! msg-string (translation msg-string dictionary)) (show-msg)))
  (define [spell-check-msg dictionary]
    (begin (set! msg-string (spell-check msg-string dictionary))
           (show-msg)))
  
  ;################# DISPATCH: #####################
  (define [dispatch cmd-string]
    (cond
      [(equal? cmd-string "show") show-msg]
      [(equal? cmd-string "price") show-price]
      [(equal? cmd-string "encrypt") encrypt-msg]
      [(equal? cmd-string "decrypt") decrypt-msg]
      [(equal? cmd-string "translate") translate-msg]
      [(equal? cmd-string "spellcheck") spell-check-msg]
      [else (error "Unknown command:" cmd-string)]
      )) dispatch)

; "Syntactic sugar" procedures:
(define [show object] ((object "show")))
(define [price object] ((object "price")))
(define [encrypt object key] ((object "encrypt") key))
(define [decrypt object key] ((object "decrypt") key))
(define [translate object dictionary] ((object "translate") dictionary))
(define [spellcheck object dictionary] ((object "spellcheck") dictionary))