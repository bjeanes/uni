package implementationsToTest;

/* DON'T LOOK AT THE CODE BELOW UNTIL AFTER COMPLETING YOUR TESTS! */

/* All Same program Version B */

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

public class AllSameB {

	public boolean same(int[] naturals) throws Exception {
		int first = naturals[0];
		for (int index = 0; index < naturals.length - 1; index++)
			if (naturals[index] != first)
				return false;
		return true;
	}

}
