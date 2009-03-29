package inb370.asgn1;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Random;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * 
 * @author Bodaniel Jeanes
 * 
 */
public class HiringGameUnitTest {
	private HiringGame game;
	private Random random;

	/**
	 * Tear down method that nullifies all variables to prevent test state
	 * bleeding into each other
	 */
	@After
	public void after() {
		game = null;
		random = null;
	}

	/**
	 * Set up method which initialises values used by nearly all if not all
	 * tests.
	 */
	@Before
	public void before() {
		game = new HiringGame();
		random = new Random();
	}

	/**
	 * This tests that {@code getNextApplicant()} properly throws a
	 * {@code HiringException} when an applicant has already been chosen. It
	 * also ensures that no other method is the cause of the exception in the
	 * set up.
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testGetNextApplicantThrowsExceptionWhenApplicantHasBeenAccepted()
			throws HiringException {
		try {
			game.newGame(10, random);
			game.getNextApplicant();
			game.acceptApplicant();
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}

		// Only is a success if this call raises a HiringException
		game.getNextApplicant();
	}

	/**
	 * This tests that {@code getNextApplicant()} cannot be called before a game
	 * is started without raising a {@code HiringException}.
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testGetNextApplicantThrowsExceptionWhenGameHasNotStarted()
			throws HiringException {
		game.getNextApplicant();
	}

	/**
	 * This tests that the game will immediately accept a sole applicant if a
	 * game is started with only one applicant.
	 */
	@Test
	public void testIsAcceptedImmediatelyIfOnlyOneApplicant() {
		try {
			game.newGame(1, random);
			game.getNextApplicant();
			assertTrue(game.isAccepted());
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}
	}

	/**
	 * This tests that if an applicant has not been accepted using
	 * {@code acceptApplicant()}, isAccepted will return {@code false}.
	 */
	@Test
	public void testIsAcceptedReturnsFalseWhenAnApplicantHasNotBeenAccepted() {
		try {
			game.newGame(5, random);
			game.getNextApplicant();
			assertFalse(game.isAccepted());
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}
	}

	/**
	 * This tests that if an applicant has been accepted using
	 * {@code acceptApplicant()}, isAccepted will return {@code true}.
	 */
	@Test
	public void testIsAcceptedReturnsTrueWhenAnApplicantHasBeenAccepted() {
		try {
			game.newGame(5, random);
			game.getNextApplicant();
			game.acceptApplicant();
			assertTrue(game.isAccepted());
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}
	}

	/**
	 * This tests that {@code newGame()} does not raise an exception when passed
	 * normal parameters.
	 */
	@Test
	public void testNewGameDoesNotThrowAnExceptionWhenGivenNormalAmountOfMaxApplicant() {
		try {
			game.newGame(100, random);
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}
	}

	/**
	 * This tests that {@code newGame()} does not raise an exception when given
	 * only one applicant, a plausible edge case that could cause issues with
	 * some implementations.
	 */
	@Test
	public void testNewGameDoesNotThrowAnExceptionWhenGivenOneMaxApplicant() {
		try {
			game.newGame(1, random);
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}
	}

	/**
	 * This tests that {@code newGame()} raises a {@code HiringException} when
	 * given a negative number of applicants.
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testNewGameThrowsAnExceptionWhenGivenNegativeMaxApplicant()
			throws HiringException {
		game.newGame(-1, random);
	}

	/**
	 * This tests that {@code newGame()} raises a {@code HiringException} when
	 * the {@code random} parameter is {@code null}.
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testNewGameThrowsAnExceptionWhenGivenNullRandomObject()
			throws HiringException {
		game.newGame(5, null);
	}

	/**
	 * This tests that {@code newGame()} raises a {@code HiringException} when
	 * given 0 applicants.
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testNewGameThrowsAnExceptionWhenGivenZeroMaxApplicant()
			throws HiringException {
		game.newGame(0, random);
	}

	/**
	 * This is a utility method used internally by the tests to make them a bit
	 * DRYer when handling HiringExceptions that should not be raised.
	 * 
	 * @param e
	 * @throws AssertionError
	 */
	protected void unexpectedHiringExceptionRaised(HiringException e)
			throws AssertionError {
		AssertionError ae = new AssertionError();
		ae.initCause(e);
		throw ae;
	}
}
