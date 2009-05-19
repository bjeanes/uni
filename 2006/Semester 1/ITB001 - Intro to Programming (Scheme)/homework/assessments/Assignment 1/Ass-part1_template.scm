;;
;; ITB001 Semester 1, 2006
;; Text Processing Assignment, Part 1 (due: Friday 24th March)
;;
;; This is the template for your solution to Part 1 of the ITB001 Text
;; Processing assignment.  Open this file in DrScheme and edit your
;; answer into it at the points shown.  You can use the tests below to
;; see how you are going (but these are not the only tests you should
;; try).  When you have finished, save the file in text format (you
;; can check this by looking at the file in a text editor such as
;; emacs or NotePad) and upload it via OAS.  You can delete these
;; instructions to make your final file look neater.


;; Name: <Your name>
;; Student number: <Your student number>


;; <Put your solution to the assignment here>


;; Some Tests
;;
;; Use the following tests to see how well your solution works.
;; Comment out with semicolons tests you don't want to try.  (They
;; are all commented out by default.)  Highlight tests of interest and
;; use the "Uncomment" and "Comment Out With Semicolons" options from
;; DrScheme's "Scheme" pull-down menu to enable or disable the tests,
;; respectively.  (Do NOT use the "Comment Out with a Box" option!)

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
