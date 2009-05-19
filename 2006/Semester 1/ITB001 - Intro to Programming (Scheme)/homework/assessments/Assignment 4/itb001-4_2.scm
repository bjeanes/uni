;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ITB001 Semester 1, 2006
;;
;; Text Processing Assignment - Part 4 (due Friday 2nd June)
;; Spellchecking and user interface
;;
;; This is the template for your solution to Parts 4a and 4b of
;; the ITB001 Text Processing assignment.  
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; The following lines load your solutions to Parts 1 to 3 of the
;; assignment.  Do not change or comment-out these lines.  Make sure
;; that you have appropriate files in the same folder (directory) as
;; this file.  (When we test your solution we will supply our own copies
;; of these files.)

(load "ITB001-1.scm")
(load "ITB001-2.scm")
(load "ITB001-3.scm")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Part 4a - Interactive spellchecker
;;

;; <Put your solution to Part 4a here>
(define [spell-check string dictionary]
  (define [helper tokens total-list]
    (if (not (empty? tokens))
        (if 
         (or (char-alphabetic? (first (string->list (first tokens)))) (char-numeric? (first (string->list (first tokens)))))
         (if 
          (equal? (lookup (first tokens) dictionary) "???")
          (begin
            (display (string-append "Word not recognized: " (first tokens)))
            (newline)
            (display "Hit RETURN to accept word or enter replacement")
            (read-line)
            word)
          (helper (rest (rest tokens) (cons total-list (first tokens))))
          )
         (list)
         )
        total-list)
    )
  (helper (string->tokens string) (list)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Some tests for Part 4a
;;
;; In the following tests the strings in angled brackets <...> denote
;; possible responses typed at the keyboard.  The test results will vary
;; depending on your responses.  The two dictionaries are assumed to have
;; the same words in them as in the tests for Part 3 of the assignment.
(define french->english ;(list (list "4" "four") (list "blah" "blahblah") (list "whore" "what")))
(list))
(spell-check "Oui, Je suis." french->english)
;; returns "Oui, Je suis."
;(spell-check "Je say Non!" french->english)
;; returns "Je <dis> Non!"
;(spell-check "Je suis un Rock Star" french->english)
;; returns "Je suis un <Movie> <Star>"
;(spell-check "c you 2moro, mate :-)" sms->english)
;; returns "c <u> 2moro, <mate> :-)"




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Part 4b - A procedure (object) which allows us to manipulate
;; text in various ways.
;;

;; <Put your solution to Part 4b here>


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Some tests for Part 4b
;;
;; In the following tests the strings in angled brackets <...> denote
;; possible responses typed at the keyboard.  The test results will vary
;; depending on your responses.  The dictionaries are assumed to have
;; the same words in them as in the tests for Part 3 of the assignment.

;(define i-say
;  (message "u r funny! :-)"))
;(show i-say) ; returns "u r funny! :-)"
;(price i-say) ; returns "12 cents for 4 words"
;(define you-say (message "Oui.  Je suis rotfl!"))
;(encrypt i-say "secret") ; returns "ieVrLjbT]se/!n"
;(price i-say) ; returns "12 cents for 1 word"
;(decrypt i-say "secret") ; returns "u r funny! :-)"
;(translate i-say sms->english) ; returns "you are funny! I'm happy"
;(price i-say) ; returns "18 cents for 5 words"
;(show you-say) ; returns "Oui.  Je suis rotfl!"
;(translate you-say french->english) ; returns "Yes.  I am rotfl!"
;(spellcheck you-say sms->english) ; may return "<Yes>.  <Je> <suis> rotfl!"
;(price you-say) ; returns "15 cents for 4 words" in this case
