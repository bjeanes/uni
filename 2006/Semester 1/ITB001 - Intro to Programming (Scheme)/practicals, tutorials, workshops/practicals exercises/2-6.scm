;; What is the result of the following expression when temp is 40, and when temp is 10

(define temp 40)
(cond [(> temp 15) "Cool"]
      [(> temp 25) "Warm"]
      [(> temp 35) "Hot"]
      [else "Cold"]
      )

;; ANSWER: temp set to 10 returns "Cold", but temp set to 40 returns "Cool"
;;             - 10 is not greater than 15, 25, or 35, so it defaults to "Cold" which is fine
;;             - 40 IS greater than 15 (although it is also greater than 25 and 35)
;;                    - problem is, it evaluates true on first statements and stops evaluating further.