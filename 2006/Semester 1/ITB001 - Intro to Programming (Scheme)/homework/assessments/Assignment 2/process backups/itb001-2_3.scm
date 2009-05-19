;;
;; ITB001 Semester 1, 2006
;; Text Processing Assignment, Part 2 (due: Friday 14th April)
;;
;; This is the template for your solution to Parts 2a, 2b and 2c of
;; the ITB001 Text Processing assignment.  Open this file in DrScheme
;; and edit your answers into it at the points shown.  You can use the
;; tests below to see how you are going (but these are not the only
;; tests you should try).  When you have finished, save the file in
;; text format (you can check this by looking at the file in a text
;; editor such as emacs or NotePad) and upload it via OAS, together
;; with your documentation for Part 2d.  You can delete these
;; instructions to make your final file look neater.


;; Name: Bodaniel Jeanes
;; Student number: n05687802


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define [word-count message]
  ;; define helper function internally to prevent user from directly changing initialisation
  ;; and producing unwanted results.
  (define [word-count-helper count prev-char char-list]
    (if (empty? char-list) count 
        (word-count-helper 
         (if                   ;; begin first argument passed to word-count-helper iteration
          (and (equal? #\space prev-char) (not (equal? #\space (first char-list))))
          (+ count 1) count
          )                    ;; end first argument
         (first char-list)     ;; second argument
         (rest char-list)      ;; third argument
         )
        )
    )
  
  (word-count-helper 0 #\space (string->list message))
  )

;; Some Tests for Part 2a
;;
;; Use the following tests to see how well your solution works.
;; Comment out with semicolons tests you don't want to try.  (They
;; are all commented out by default.)  Highlight tests of interest and
;; use the "Uncomment" and "Comment Out With Semicolons" options from
;; DrScheme's "Scheme" pull-down menu to enable or disable the tests,
;; respectively.  (Do NOT use the "Comment Out with a Box" option!)

;(word-count "See Spot run!") 
;; should return 3
;(word-count "  See     Spot  run  !") 
;; should return 4
;(word-count "SeeSpotrun!") 
;; should return 1
;(word-count "    ") 
;; should return 0
;(word-count "") 
;; should return 0
;(word-count "How r u? ;-)") 
;; should return 4
;(word-count "The (quick) brown fox jumps over the (lazy) dog.") 
;; should return 9


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; The following two procedures are needed for your solution to
;; Parts 2b and 2c.  Do not comment out or change these procedures.


;; Given a printable character, return its corresponding numeric code
(define [printchar->integer char]
  (- (char->integer char) 32))

;; Given the numeric code for a printable character, return the
;; corresponding character
(define [integer->printchar code]
  (integer->char (+ code 32)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define [encipher message encryption-key]
  
  ;; pass original message each time and use (list-ref msg pos) 
  ;; to pick out a character from the message and encrypt it, 
  ;; then append to end of encr-msg. 
  
  (define [do-encipher msg key encr-msg pos]
    ;; once original msg and encr-msg are the same length:
    (if (equal? (length msg) (length encr-msg))
        ;; we know that we have encrypted the entire message and can 
        ;; RETURN it. 
        encr-msg                                 
        ;;  otherwise, we call procedure again to work on next char:
        (do-encipher
         ;; pass oringinal message:
         msg
         ;; pass key
         key
         ;;pass encrypted message:
         (append encr-msg
                 (list (integer->printchar 
                        (remainder 
                         (+    ;; add integers together (do the actual encryption)
                          (printchar->integer ;; convert message character to integer for encryption
                           (list-ref msg pos)) 
                          (printchar->integer ;; convert key character to integer to encrypt message
                           (list-ref key 
                                     (remainder pos 
                                                (length? key)
                                                    )))) 95))) ;; SWITCH REMAINDER IF IT DOESN'T WORK?
                 ;;;;;;;;;;;; ^^^ APPEND TO THE LIST ^^^ ;;;;;;;;;;;;;;;;
                 (+ pos 1)))) ;; increase position marker
    
    (do-encipher (string->list message) (string->list encryption-key) (list) 0))) ;; turn encryption-key and message to lists so that we can deal with one character at a time. pass an empty list as the encrypted message (because none is encrypted yet), and pass 0 as the initialised position.
  
  
  
  ;; Some Tests for Part 2b
  
  ;(encipher "Fred" "   ") 
  ;; should return "Fred"
  ;(encipher "abcdefg" "!") 
  ;; should return "bcdefgh"
  ;(encipher "Beware the Ides of March" "#") 
  ;; should return "Ehzduh#wkh#Lghv#ri#Pdufk"
  ;(encipher "Beware the Ides of March" "Julie") 
  ;; should return "l[dKX0uaRKJ?QOYJeSi3,hPR"
  ;(encipher "short text" "very long key") 
  ;; should return "jNbltldT`t"
  ;(encipher "See Spot run" "YourKey") 
  ;; should return "-U[r~ViNohh:"
  ;(encipher "See Spot run" "MyKey") 
  ;; should return "!_1eM>i@elCh"
  ;(encipher "!_1eM>i@elCh" "R&T:&")
  ;; should return "See Spot run"
  ;(encipher (encipher "Gaius Julius Caesar was here!" "Julie") "U*36:")
  ;; should return "Gaius Julius Caesar was here!"
  ;(encipher "The quick brown fox jumps over the lazy dog!" "qwerty")
  ;; should return "F`Krfo[[QrWlaoTr[ijwPhbjewUiZlqlNXtfSr_rYiYx"
  ;(encipher "F`Krfo[[QrWlaoTr[ijwPhbjewUiZlqlNXtfSr_rYiYx" ".(;-+&")
  ;; should return "Thf quicl browo fox kumps pver tie lazz dog!"
  
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  
  ;; <Put your solution to Part 2c here>
  
  
  ;; Some Tests for Part 2c
  
  ;(decryption-key "MyKey") 
  ;; should return "R&T:&"
  ;(decryption-key "YourKey") 
  ;; should return "F0*-T:&"
  ;(decryption-key "abcdefghijklmnopqrstuvwxyz")
  ;; should return ">=<;:9876543210/.-,+*)('&%"
  ;(decryption-key "qwerty") 
  ;; should return ".(:-+&"
  ;(decryption-key "Julie") 
  ;; should return "U*36:"
  ;(decryption-key (decryption-key "Brutus")) 
  ;; should return "Brutus"
  ;(encipher (encipher "Agent 86 to Control" "Kaos")
  ;          (decryption-key "Kaos"))
  ;; should return "Agent 86 to Control"
  ;(encipher (encipher "Agent 86 to Control" "Kaos")
  ;          (decryption-key "chaos"))
  ;; should return ")`srL}?H[b{+-aj%Uol"
  ;(encipher (encipher "Testing, One, Two, Three" 
  ;                    (decryption-key "qwerty")) 
  ;          "qwerty")
  ;; should return "Testing, One, Two, Three"
  