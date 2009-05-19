(define [cinema-usher max-seats]
  (let [[seat 0]] ; Variable local to this procedure
    (define [dispatch request]
    (cond [(equal? request "gimme") allocate-seat]
          [(equal? request "seats left") seats-left]
          [else huh-msg]))

    (define [allocate-seat] ; The seat allocation procedure
      (if (>= seat max-seats)
          "Sorry, sold out!"
          (begin
            (set! seat (+ seat 1))
            seat)))
    (define [huh-msg] "Huh?")
    (define [seats-left] (- max-seats seat))
    dispatch))

(define star-wars (cinema-usher 3))
((star-wars "gimme"))
((star-wars "hi!"))
((star-wars "gimme"))
((star-wars "seats left"))