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

(define [spell-check textmsg dictionary newword]
    ;;if the length of text message is not equal to 0 then... 
    (if (not (equal? (length textmsg) 0
                     (checker textmsg dictionary newline))) 
        ;;if the first value in the text message is alphabetic or numeric then...
        (if (or (equal? char-alphabetic (first (sting->list (first (string->tokens textmsg)))))  
                (equal? char-numeric (first (sting->list (first (string->tokens textmsg))))))
            ;;if the (converted list->string) value word doesnt match a value in the dictionary (using the search function lookup) then display the message asking for user input 
            (if (equal? (lookup (list->string textmsg) dictionary)"???")
                (begin  
                  (display (string-append "Word not recognised: " (list->string textmsg)));CHANGE VALUE TO WORD??????
                  (newline)
                  (display "Hit RETURN to accept word or enter  replacement") 
                  (new-line)
                  (read-line)  
                  ) 
                "no3"
                )
            "no2"
            )
        "no1")
    (spell-check (string->tokens (first textmsg))(rest textmsg)dictionary newword (read-line)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Some tests for Part 4a
;;
;; In the following tests the strings in angled brackets <...> denote
;; possible responses typed at the keyboard.  The test results will vary
;; depending on your responses.  The two dictionaries are assumed to have
;; the same words in them as in the tests for Part 3 of the assignment.

(spell-check "Oui, Je suis." french->english)
; returns "Oui, Je suis."
(spell-check "Je say Non!" french->english)
; returns "Je <dis> Non!"
(spell-check "Je suis un Rock Star" french->english)
; returns "Je suis un <Movie> <Star>"
(spell-check "c you 2moro, mate :-)" sms->english)
; returns "c <u> 2moro, <mate> :-)"




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
