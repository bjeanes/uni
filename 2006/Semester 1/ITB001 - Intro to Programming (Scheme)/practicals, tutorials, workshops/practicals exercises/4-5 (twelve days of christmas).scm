(define [presents day]
  (if (= day 1) 1 
      (+ day (presents (- day 1)))
      )
  )