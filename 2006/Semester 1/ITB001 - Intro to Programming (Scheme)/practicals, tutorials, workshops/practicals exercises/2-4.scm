;; What is the result returned by each of the following?
(first (rest (list 1 2 3)))         ;; 2
(length (list 2 3 6))               ;; 3
(cons 5 (cons 4 (list 1 2 3)))      ;; (5 4 1 2 3)

;; ------------

;; Write expressions to ...
     ;; Return the first element of (list 1 2 3)
        (first (list 1 2 3))
     ;; Return the second element of (list 1 2 3)
        (first (rest (list 1 2 3)))
     ;; Add 4 to the beginning of (list 1 2 3)
        (cons 4 (list 1 2 3))
     ;; Create (list 4 2 3) from (list 1 2 3)
        (cons 4 (rest (list 1 2 3)))