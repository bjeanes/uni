;(define dayNumber 1)
(display "Today is ")
(cond [(= dayNumber 0) (display "Sunday")]
      [(= dayNumber 1) (display "Monday")]
      [(= dayNumber 2) (display "Tuesday")]
      [(= dayNumber 3) (display "Wednesday")]
      [(= dayNumber 4) (display "Thursday")]
      [(= dayNumber 5) (display "Friday")]
      [(= dayNumber 6) (display "Saturday")]
      [else (display "unknown")]
      )
(display "!")