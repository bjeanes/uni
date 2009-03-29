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

	@Test(expected = HiringException.class)
	public void testNewGameThrowsAnExceptionWhenGivenNullRandomObject()
			throws HiringException {
		game.newGame(5, null);
	}

	@Test(expected = HiringException.class)
	public void testNewGameThrowsAnExceptionWhenGivenZeroMaxApplicant()
			throws HiringException {
		game.newGame(0, random);
	}

	@Test(expected = HiringException.class)
	public void testNewGameThrowsAnExceptionWhenGivenNegativeMaxApplicant()
			throws HiringException {
		game.newGame(-1, random);
	}

	@Test
	public void testNewGameDoesNotThrowAnExceptionWhenGivenOneMaxApplicant() {
		try {
			game.newGame(1, random);
		} catch (HiringException e) {
			AssertionError ae = new AssertionError();
			ae.initCause(e);
			throw ae;
		}
	}

	@Test
	public void testNewGameDoesNotThrowAnExceptionWhenGivenNormalAmountOfMaxApplicant() {
		try {
			game.newGame(100, random);
		} catch (HiringException e) {
			AssertionError ae = new AssertionError();
			ae.initCause(e);
			throw ae;
		}
	}

	@Test(expected = HiringException.class)
	public void testGetNextApplicantThrowsExceptionWhenGameHasNotStarted()
			throws HiringException {
		game.getNextApplicant();
	}

	@Test(expected = HiringException.class)
	public void testGetNextApplicantThrowsExceptionWhenApplicantHasBeenAccepted()
			throws HiringException {
		try {
			game.newGame(10, random);
			game.getNextApplicant();
			game.acceptApplicant();
		} catch (HiringException e) {
			AssertionError ae = new AssertionError();
			ae.initCause(e);
			throw ae;
		}

		// Only is a success if this call raises a HiringException
		game.getNextApplicant();
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
			AssertionError ae = new AssertionError();
			ae.initCause(e);
			throw ae;
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
			AssertionError ae = new AssertionError();
			ae.initCause(e);
			throw ae;
		}
	}

	/**
	 * This tests that the game will immediately accept a single applicant.
	 */
	@Test
	public void testIsAcceptedImmediatelyIfOnlyOneApplicant() {
		try {
			game.newGame(1, random);
			game.getNextApplicant();
			assertTrue(game.isAccepted());
		} catch (HiringException e) {
			AssertionError ae = new AssertionError();
			ae.initCause(e);
			throw ae;
		}
	}
}
