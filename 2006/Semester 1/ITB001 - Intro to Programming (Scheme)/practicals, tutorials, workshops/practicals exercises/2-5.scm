;; What is the result of evaluating the following?
"Hello World!"                   ;; "Hello World!"
(string->list "Hi you")          ;; (#\H #\i #\space #\y #\o #\u)
(string-length 
 (string-append "abc" "123"))    ;; 6

;; Write an expression to ...
      ;; Create a list of characters
         (list #\M #\y #\space #\n #\a #\m #\e #\space #\i #\s #\space #\B #\o)
      ;; Replace the first letter of the string "hello" with a 'y'         
         (list->string (cons #\y (rest (string->list "Hello"))))
      ;; Change the string "three" to "free"
         (list->string (cons #\f (rest (rest (string->list "three")))))