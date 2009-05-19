;;
;; ITB001 Semester 1, 2006
;; Text Processing Assignment, Part 3 (due: Friday 5th May)
;;
;; This is the template for your solution to Parts 3a, 3b and 3c of
;; the ITB001 Text Processing assignment.  Open this file in DrScheme
;; and edit your answers into it at the points shown.  You can use the
;; tests below to see how you are going (but these are not the only
;; tests you should try).  When you have finished, save the file in
;; text format (you can check this by looking at the file in a text
;; editor such as emacs or Notepad) and upload it via OAS, together
;; with your documentation for Part 3d.  You can delete these
;; instructions to make your final file look neater.


;; Name: Bodaniel Jeanes
;; Student number: 05687802


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; <Put your solution to Part 3a here>

(define [make-dict] (list))

(define [add-to-dict word synonym dictionary]
  (cons (list word synonym) (remove-from-dict word dictionary)))


(define [lookup word dictionary]
  (define [lookup-filter test]
    (equal? (first test) word))
  (if (empty? (filter lookup-filter dictionary)) 
      "???" 
      (first (rest (first (filter lookup-filter dictionary))))))

(define [dict-size dictionary]
  (length dictionary))

(define [remove-from-dict word dictionary]
  (define [delete-filter test]
    (not (equal? (first test) word)))
  (filter delete-filter dictionary))

;  (define [remover-helper word dictionary] 
;    (if (equal? (first dictionary) word) 
;        (rest dictionary)
;        (remover-helper word (rest dictionary))))
;  (if (empty? dictionary) (list) (remover-helper word dictionary)))

;; Some Tests for Part 3a
;;
;; Use the following tests to see how well your solution works.
;; Comment out with semicolons tests you don't want to try.  (They
;; are all commented out by default.)  Highlight tests of interest and
;; use the "Uncomment" and "Comment Out With Semicolons" options from
;; DrScheme's "Scheme" pull-down menu to enable or disable the tests,
;; respectively.  (Do NOT use the "Comment Out with a Box" option!)

;(define sms->english (make-dict))
;(define french->english (make-dict))
;(lookup "Oui" french->english) ; returns "???"
;(define french->english (add-to-dict "Oui" "Yes" french->english))
;(define french->english (add-to-dict "Non" "No" french->english))
;(lookup "Oui" french->english) ; returns "Yes"
;(define sms->english (add-to-dict "c" "see" sms->english))
;(lookup "u" sms->english) ; returns "???"
;(define sms->english (add-to-dict "r" "are" sms->english))
;(define sms->english (add-to-dict "u" "you" sms->english))
;(lookup "u" sms->english) ; returns "you"
;(define sms->english (add-to-dict "l8r" "later" sms->english))
;(define french->english (add-to-dict "un" "a" french->english))
;(define french->english (add-to-dict "le" "the" french->english))
;(define french->english (add-to-dict "la" "the" french->english))
;(define french->english (add-to-dict "a" "in" french->english))
;(dict-size french->english) ; returns 6
;(define french->english (add-to-dict "avez" "have" french->english))
;(define sms->english (add-to-dict ":-)" "I'm happy" sms->english))
;(dict-size sms->english) ; returns 5
;(define sms->english (add-to-dict "gr8" "great" sms->english))
;(lookup "l8r" sms->english) ; returns "later"
;(lookup "alligator" sms->english) ; returns "???"
;(define sms->english 
;  (add-to-dict "lol" "Laughing out loud" sms->english))
;(define french->english (add-to-dict "Je" "I" french->english))
;(define french->english (add-to-dict "suis" "am" french->english))
;(define sms->english (add-to-dict "sum1" "someone" sms->english))
;(dict-size sms->english) ; returns 8
;(define sms->english (remove-from-dict "lol" sms->english))
;(dict-size sms->english) ; returns 7
;(lookup ":-(" sms->english) ; returns "???"
;(define sms->english 
;  (add-to-dict "rotfl" "I'm rolling on the floor laughing"
;               sms->english))
;(define sms->english (add-to-dict ":-(" "I'm sad!" sms->english))
;(dict-size sms->english) ; returns 9
;(define french->english (add-to-dict "A" "In" french->english))
;(define french->english 
;  (add-to-dict "habite" "live in" french->english))
;(define sms->english (add-to-dict "@" "at" sms->english))
;(define sms->english (add-to-dict ":-(" "Sob!" sms->english))
;(dict-size sms->english) ; returns 10
;(lookup ":-(" french->english) ; returns "???"
;(lookup ":-(" sms->english) ; returns "Sob!"
;(define sms->english (add-to-dict "tmrw" "tomorrow" sms->english))
;(dict-size sms->english) ; returns 11
;(define sms->english (add-to-dict "2moro" "tomorrow" sms->english))
;(dict-size sms->english) ; returns 12
;(lookup "Non" french->english) ; returns "No"
;(lookup "habite" french->english) ; returns "live in"
;(dict-size french->english) ; returns 11


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; <Put your solution to Part 3b here>
;; Procedure from 2a for reference:

(define [string->tokens message]
  (define [s->t-helper char-list final-list prev-char cur-token]
    (if (empty? char-list) ;; if char-list is empty, then we have converted all of the message to tokens,
    			   ;;  so return the final list of tokens as well as the cur-token appended:
    	(append final-list (list cur-token)) ;; final-list being returned
        (cond 	
        	[(and ;;check that both the previous character and the first character of the remaining message are either a character or a number:
        		(or 
        			(char-numeric? (first char-list))
        			(char-alphabetic? (first char-list))) 
        		(or 
        			(char-alphabetic? prev-char)
        			(char-numeric? prev-char)))
        		  ;; if tests passed:
        		(s->t-helper (rest char-list) final-list (first char-list) (string-append cur-token (list->string (list (first char-list)))))
        	   ]
         	[(and
         		(char-whitespace? (first char-list))
         		(char-whitespace? prev-char))
         		(s->t-helper (rest char-list) final-list (first char-list) (string-append cur-token (list->string (list (first char-list)))))	
         	   ]
         	[(and
         		(char-punctuation? (first char-list))
         		(char-punctuation? prev-char))
         		(s->t-helper (rest char-list) final-list (first char-list) (string-append cur-token (list->string (list (first char-list)))))	
         	   ]
         	[else (s->t-helper (rest char-list) (append final-list (list cur-token)) (first char-list) (list->string (list (first char-list))))]
           )
    )
   )
  (if (equal? 0 (string-length message)) (list)
  (s->t-helper (rest (string->list message)) (list) (first (string->list message)) (list->string (list (first (string->list message))))))
  )

;; Some Tests for Part 3b

(string->tokens "See Spot run") 
; returns (list "See" " " "Spot" " " "run")
(string->tokens "  See Spot run  ") 
; returns (list "  " "See" " " "Spot" " " "run" "  ")
(string->tokens "    ")
; returns (list "    ")
(string->tokens "") 
; returns empty
(string->tokens " The     quick    brown  fox???!!!")
; returns (list " " "The" "     " "quick" "    " "brown" "  " "fox"
;               "???!!!")
(string->tokens "This is (very) sneaky! :-)")
; returns (list "This" " " "is" " " "(" "very" ")" " " "sneaky" "!"
;               " " ":-)")
(string->tokens "c u l8r, alligator!")
; returns (list "c" " " "u" " " "l8r" "," " " "alligator" "!")
;(tokens->string empty)
;; returns ""
;(tokens->string (list "See" " " "Spot" " " "run"))
;; returns "See Spot run"
;(tokens->string (list "Dr" "." " " "Who" "?"))
;; returns "Dr. Who?"
;(tokens->string (string->tokens 
;                 "The quick brown fox jumps over the lazy dog!"))
;; returns "The quick brown fox jumps over the lazy dog!"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; <Put your solution to Part 3c here>


;; Some Tests for Part 3c

;(translation "This is written in English." sms->english)
;; returns "This is written in English."
;(translation "c u l8r, alligator!" sms->english)
;; returns "see you later, alligator!"
;(translation "I'll c u @ QUT 2moro." sms->english)
;; returns "I'll see you at QUT tomorrow."
;(translation "What, r u sure!? :-(" sms->english)
;; returns "What, are you sure!? Sob!"
;(translation "That's gr8, mate! :-)" sms->english)
;; returns "That's great, mate! I'm happy"
;(translation "Je suis un rock star, Je avez un residence, Je habite [lah], A la South of France" french->english)
;; returns "I am a rock star, I have a residence, I live in [lah], In the South of France"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
