package inb370.asgn1;

import java.util.Random;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * Basic Rules of hiring game:
 * 	1.	There is a single secretarial position to fill.
 *	2.	There are n applicants for the position, and the value of n is known.
 *	3.	The applicants can be ranked from best to worst with no ties.
 *	4.	The applicants are interviewed sequentially in a random order, with each order being equally likely.
 *	5.	After each interview, the applicant is accepted or rejected.
 *	6.	The decision to accept or reject an applicant can be based only on the relative ranks of the applicants interviewed so far.
 *	7.	Rejected applicants cannot be recalled.
 *	8.	If the first n-1 applicants are rejected, then the final applicant is automatically accepted. 
 *	9.	The object is to select the best applicant. You win the game only if you get the very best applicant. Otherwise you lose. 
 *
 * @author Bodaniel Jeanes
 *
 */
public class HiringGameUnitTest {
	private HiringGame game;
	private Random random;

	@After
	public void after() {
		game = null;
		random = null;
	}

	@Before
	public void before() {
		game = new HiringGame();
		random = new Random();
	}
	
	@Test(expected=HiringException.class)
	public void testNewGameThrowsAnExceptionWhenGivenNullRandomObject() throws HiringException {
		game.newGame(5, null);
	}
	
	@Test(expected=HiringException.class)
	public void testNewGameThrowsAnExceptionWhenGivenZeroMaxApplicant() throws HiringException {
		game.newGame(0, random);
	}
	
	@Test(expected=HiringException.class)
	public void testNewGameThrowsAnExceptionWhenGivenNegativeMaxApplicant() throws HiringException {
		game.newGame(-1, random);
	}
	
	@Test
	public void testNewGameDoesNotThrowAnExceptionWhenGivenOneMaxApplicant() {
		try { game.newGame(1, random); }
		catch(HiringException e) {
			AssertionError ae = new AssertionError();
			ae.initCause(e);
			throw ae;
		}
	}

	@Test
	public void testNewGameDoesNotThrowAnExceptionWhenGivenNormalAmountOfMaxApplicant() {
		try { game.newGame(100, random); }
		catch(HiringException e) {
			AssertionError ae = new AssertionError();
			ae.initCause(e);
			throw ae;
		}
	}
	
	@Test(expected=HiringException.class)
	public void testGetNextApplicantThrowsExceptionWhenGameHasNotStarted() throws HiringException {
		game.getNextApplicant();
	}
	
	@Test(expected=HiringException.class)
	public void testGetNextApplicantThrowsExceptionWhenApplicantHasBeenAccepted() throws HiringException {
		try {
			game.newGame(10, random);
			game.getNextApplicant();
			game.acceptApplicant();
		} catch(HiringException e) {
			AssertionError ae = new AssertionError();
			ae.initCause(e);
			throw ae;
		}
		
		// Only is a success if this call raises a HiringException		
		game.getNextApplicant();
	}
}
