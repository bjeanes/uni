SELECT FlightNum, max(DiscountRate)
FROM Flights F, Discounts D
WHERE F.SeatsRemaining = D.SeatsRemaining      -- gar why doesn't this work????
GROUP BY FlightNum;