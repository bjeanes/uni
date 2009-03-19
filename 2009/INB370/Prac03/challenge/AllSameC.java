package implementationsToTest;

/* DON'T LOOK AT THE CODE BELOW UNTIL AFTER COMPLETING YOUR TESTS! */

/* All Same program Version C */

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

public class AllSameC {

	public boolean same(int[] naturals) throws Exception {
		if (naturals.length == 0)
			throw new Exception("No numbers to compare");
		for (int number: naturals)
			if (number < 0) 
				throw new Exception("Non-natural number in array");
		int first = naturals[0];
		for (int index = 1; index < naturals.length; index++)
			if (naturals[index] != first)
				return false;
		return true;
	}

}
