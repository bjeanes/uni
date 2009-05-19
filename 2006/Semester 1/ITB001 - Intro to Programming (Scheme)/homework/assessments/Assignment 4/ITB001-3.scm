;; ITB001 Semester 1, 2006
;; Text Processing Assignment, Part 3 (due: Friday 5th May)

;; Name: Bodaniel Jeanes
;; Student number: 05687802

;; NOTE (PLEASE READ):
;;  My documentation needs to be opened in OpenOffice.org. I run linux, and
;;  although I saved it as in .doc format, the deskcheck table gets corrupted
;;  in Microsoft Word. You can still read the deskcheck, but it will not be
;;  easy. It should be fine in OpenOffice.org. Sorry for the inconvenience, but
;;  I can't seem to fix it.
;                                                                              |
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;|
;                                                                              |
;; <Put your solution to Part 3a here>

(define [make-dict] (list)) ; create a structure for a dictionary
(define [dict-size dictionary] (length dictionary)) ; how big is my dictionary?
(define [add-to-dict word synonym dictionary] ; define a new word in dictionary
  (cons (list word synonym) (remove-from-dict word dictionary)))

;; (lookup ) uses (filter ) to return the matching word.
(define [lookup word dictionary]
  (define [lookup-filter test-word] (equal? (first test-word) word))
  (if (empty? (filter lookup-filter dictionary)) "???" 
      (first (rest (first (filter lookup-filter dictionary))))))

;; (remove-from-dict ) uses (filter ) to return all but the matching word.
(define [remove-from-dict word dictionary]
  (define [delete-filter test-word] (not (equal? (first test-word) word)))
  (filter delete-filter dictionary))

;; <Put your solution to Part 3b here>

;;3b:
(define [string->tokens message] ;tokenises a string into a list of strings
  (define [char->string char] (if (char? char) (list->string (list char)) "")) ;eg: #\c => "c"
  (define [same-type? char1 char2] ;boolean check to see if both chars are the same type
    (define [char-alphanumeric? char] (or (char-numeric? char) (char-alphabetic? char))) ;either alpha or numeric?
    (define [char-punct? char] (not (or (char-alphanumeric? char) (char-whitespace? char)))) ;special punct test
    (or (and (char-alphanumeric? char1) (char-alphanumeric? char2))
        (and (char-whitespace? char1) (char-whitespace? char2))
        (and (char-punct? char1) (char-punct? char2))))
  (define [last list] (list-ref list (- (length list) 1))) ;pulls last list element
  (define [ll list] (last (string->list (last list)))) ;gets last char from last token in list
  (define [delete-token token token-list] ;used to replace the last token in list when its updated.
    (define [delete-filter test-token] (not (equal? test-token token))) ;custom procedure for filter
    (filter delete-filter token-list))
  
  (define [s->t-helper char-list final-list] 
    (if (empty? char-list) final-list 
        (if (same-type? (ll final-list) (first char-list))
            (s->t-helper (rest char-list) (append (delete-token (last final-list) final-list)
                     (list (string-append (last final-list) (char->string (first char-list))))))
            (s->t-helper (rest char-list) (append final-list (list (char->string (first char-list))))))
        )
    )
  ; initiate tokenisation:
  (s->t-helper (rest (string->list message)) (list (char->string (first (string->list message))))))

;; reverse procedure for above tokeniser:
(define [tokens->string token-list]
  (if (empty? token-list) ""
      (string-append (first token-list) (tokens->string (rest token-list)))))


;; 3c
(define [translation message dictionary]
  (define [lookup-dict word] 
    (if (equal? (lookup word dictionary) "???") ; "???" =.\ 
    	word                                    ;         \\=> original word
    	(lookup word dictionary)))
  
  (tokens->string (map lookup-dict (string->tokens message))))

(define sms->english (make-dict))
(define french->english (make-dict))
(define french->english (add-to-dict "Oui" "Yes" french->english))
(define french->english (add-to-dict "Non" "No" french->english))
(define sms->english (add-to-dict "c" "see" sms->english))
(define sms->english (add-to-dict "r" "are" sms->english))
(define sms->english (add-to-dict "u" "you" sms->english))
(define sms->english (add-to-dict "l8r" "later" sms->english))
(define french->english (add-to-dict "un" "a" french->english))
(define french->english (add-to-dict "le" "the" french->english))
(define french->english (add-to-dict "la" "the" french->english))
(define french->english (add-to-dict "a" "in" french->english))
(define french->english (add-to-dict "avez" "have" french->english))
(define sms->english (add-to-dict ":-)" "I'm happy" sms->english))
(define sms->english (add-to-dict "gr8" "great" sms->english))
(define sms->english 
  (add-to-dict "lol" "Laughing out loud" sms->english))
(define french->english (add-to-dict "Je" "I" french->english))
(define french->english (add-to-dict "suis" "am" french->english))
(define sms->english (add-to-dict "sum1" "someone" sms->english))
(define sms->english (remove-from-dict "lol" sms->english))
(define sms->english 
  (add-to-dict "rotfl" "I'm rolling on the floor laughing"
               sms->english))
(define sms->english (add-to-dict ":-(" "I'm sad!" sms->english))
(define french->english (add-to-dict "A" "In" french->english))
(define french->english 
  (add-to-dict "habite" "live in" french->english))
(define sms->english (add-to-dict "@" "at" sms->english))
(define sms->english (add-to-dict ":-(" "Sob!" sms->english))
(define sms->english (add-to-dict "tmrw" "tomorrow" sms->english))
(define sms->english (add-to-dict "2moro" "tomorrow" sms->english))