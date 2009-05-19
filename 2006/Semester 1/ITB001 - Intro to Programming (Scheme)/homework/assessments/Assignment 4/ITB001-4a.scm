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
    (if (empty? tokens)
        (tokens->string total-list)
        (helper (rest tokens) 
                (append total-list (list (get-word (string->list 
                                                    (first tokens))))))))
  
  (define [get-word word]
    (define [get-word-helper]
      (define new-word (read-line))
      (if (equal? new-word "") (list->string word) new-word))
    (if (and
         (or (char-alphabetic? (first word)) (char-numeric? (first word))) 
         (equal? (lookup (list->string word) dictionary) "???"))
        (begin (display (string-append "Word not recognized: " 
                                       (list->string word) 
                                       "\nHit RETURN to accept word "
                                       "or enter replacement\n")) 
               (get-word-helper))
        (list->string word)))
  (helper (string->tokens string) (list)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Some tests for Part 4a
;;
;; In the following tests the strings in angled brackets <...> denote
;; possible responses typed at the keyboard.  The test results will vary
;; depending on your responses.  The two dictionaries are assumed to have
;; the same words in them as in the tests for Part 3 of the assignment.

;(spell-check "Oui, Je suis." french->english)
;; returns "Oui, Je suis."
;(spell-check "Je say Non!" french->english)
;; returns "Je <dis> Non!"
;(spell-check "Je suis un Rock Star" french->english)
;; returns "Je suis un <Movie> <Star>"
;(spell-check "c you 2moro, mate :-)" sms->english)
;; returns "c <u> 2moro, <mate> :-)"