package implementationsToTest;

/* DON'T LOOK AT THE CODE BELOW UNTIL AFTER COMPLETING YOUR TESTS! */

/* All Same program Version A */

import java.lang.Exception;

/*
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */

/* Comments have been removed from the code to make it harder
 * to debug by inspection
 */

public class AllSameA {

	public boolean same(int[] naturals) throws Exception {
		if (naturals.length == 0)
			throw new Exception("No numbers to compare");
		for (int number: naturals)
			if (number < 0) 
				throw new Exception("Non-natural number in array");
		int sum = 0;
		for (int natural: naturals) sum += natural;
		System.out.println((double)sum / naturals.length);
		return (double)sum / naturals.length == naturals[0];
	}

}
