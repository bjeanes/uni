package inb370.asgn1;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.HashSet;
import java.util.Random;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * 
 * @author Bodaniel Jeanes (n5687802)
 * 
 */
public class HiringGameUnitTest {
	private HiringGame game;
	private Random random;
	private int maxApplicants = 5; // Magic number alert! (:O)

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
	 * To be perfectly honest I am not sure if this one is SUPPOSED to throw an
	 * exception or do nothing because there will be no "current" applicant
	 * until the next one is asked for.
	 * 
	 * Based on {@code GamePanel} code in {@code handleNewGame()}, I am taking
	 * the requirement here for a game to have "begun" to mean that at least one
	 * applicant has been reviewed such that there is a "current" applicant.
	 * However, I think this is rather open-ended and could go either way.
	 * 
	 * This means I will treat the expected behaviour here to raise an
	 * exception.
	 */
	@Test(expected = HiringException.class)
	public void testAcceptApplicantAcceptsTheCurrentApplicant()
			throws HiringException {
		try {
			game.newGame(maxApplicants, random);
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}

		game.acceptApplicant();
	}

	/**
	 * This tests that the applicant is accepted without raising an exception.
	 */
	@Test
	public void testAcceptApplicantAcceptsTheCurrentApplicantAfterGettingNext() {
		try {
			game.newGame(maxApplicants, random);
			game.getNextApplicant(); // sets current applicant
			game.acceptApplicant();
			assertTrue(game.isAccepted());
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}
	}

	/**
	 * This tests that an applicant can not be accepted after another one has
	 * already been accepted.
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testAcceptApplicantThrowsHiringExceptionWhenApplicantHasAlreadyBeenAccepted()
			throws HiringException {
		try {
			game.newGame(maxApplicants, random);
			game.getNextApplicant();

			// This call should not raise an error
			game.acceptApplicant();
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}

		// This one should
		game.acceptApplicant();
	}

	/**
	 * This tests that an applicant can't be accepted if none exist (i.e. a game
	 * is not in play).
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testAcceptApplicantThrowsHiringExceptionWhenGameHasNotStarted()
			throws HiringException {
		game.acceptApplicant();
	}

	/**
	 * This tests that after a game is started and an applicant is chosen
	 * {@code getBestApplicant()} returns the correct {@code Applicant}
	 * instance.
	 */
	@Test
	public void testGetBestApplicantReturnsCorrectApplicant() {
		try {
			game.newGame(1, random);
			Applicant app = game.getNextApplicant();
			assertEquals(game.getBestApplicant(), app);
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}
	}

	/**
	 * This tests that {@code getBestApplicant()} throws a
	 * {@code HiringException} when a game has not been started.
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testGetBestApplicantThrowsExceptionWhenGameHasNotBeenStarted()
			throws HiringException {
		game.getBestApplicant();
	}

	/**
	 * This tests that {@code getBestApplicant()} throws a
	 * {@code HiringException} when an applicant has NOT been selected.
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testGetBestApplicantThrowsExceptionWhenApplicantHasNotBeenSelected()
			throws HiringException {
		try {
			game.newGame(5, random);
			game.getNextApplicant();
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}

		game.getBestApplicant();
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
			game.newGame(maxApplicants, random);
			game.getNextApplicant();
			game.acceptApplicant();
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}

		// Only is a success if this call raises a HiringException
		game.getNextApplicant();
	}

	/**
	 * This tests three things:<br>
	 * <br>
	 * &nbsp;&nbsp; 1) That for {@code n} applicants, it will take
	 * {@code (n - 1)} determine the outcome of the game; and<br>
	 * &nbsp;&nbsp; 2) That the last applicant is automatically chosen when
	 * there is only one left (other test only proves this when 1 applicant is
	 * provided to begin with); and<br>
	 * &nbsp;&nbsp; 3) That each applicant is only returned at most once,
	 * because {@code (n + 1)} iterations throws the exception instead of
	 * choosing an item from the least (Note: this does not test that each
	 * applicant returned is unique).
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testGetNextApplicantThrowsExceptionWhenCalledMoreTimesThanNumberOfApplicants()
			throws HiringException {
		game.newGame(maxApplicants, random);

		// less than equal because we want to push it past boundary of
		// applicants
		for (int i = 0; i <= maxApplicants; i++) {
			try {
				game.getNextApplicant();
			} catch (HiringException e) {
				if (i < maxApplicants) {
					// HiringException should not have been raised yet
					unexpectedHiringExceptionRaised(e);
				} else
					throw e;
			}
		}
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
	 * This tests that each item that comes out of {@code getNextApplicant()} is
	 * unique by adding it to a new {@code HashSet} and comparing the size.
	 * {@code HashSet}s can only have one of each item so if the
	 * {@code getNextApplicant()} had returned an item twice, the size would be
	 * smaller.
	 */
	// This is a safety measure in case getNextApplicant() doesn't raise an
	// exception to break the while loop
	@Test(timeout = 500)
	public void testGetNextApplicationReturnsEachItemExactlyOnce() {
		HashSet<Applicant> set = new HashSet<Applicant>();

		try {
			game.newGame(maxApplicants, random);
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}

		while (true) {
			try {
				Applicant applicant = game.getNextApplicant();

				// extra level of checking makes sure that this item has never
				// been returned before:
				assertFalse(set.contains(applicant));

				// Add it so future iterations can verify it isn't returned
				// again:
				set.add(applicant);
			} catch (HiringException e) {
				break;
			}
		}

		// Sanity check: if the size differs from the maxApplicants, then
		// getNextApplicant() has either returned duplicate values or not enough
		// values:
		assertEquals(set.size(), maxApplicants);
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
			game.newGame(maxApplicants, random);
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
			game.newGame(maxApplicants, random);
			game.getNextApplicant();
			game.acceptApplicant();
			assertTrue(game.isAccepted());
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}
	}

	/**
	 * This tests that {@code isBestApplicant()} returns true when a correct
	 * applicant is chosen.
	 */
	@Test
	public void testIsBestApplicantReturnsTrueWhenACorrectApplicantIsChosen() {
		try {
			game.newGame(1, random);

			// This will auto-accept the only applicant (hence the right one)
			game.getNextApplicant();

			assertTrue(game.isBestApplicant());
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}
	}

	/**
	 * This tests that {@code isBestApplicant()} returns false when an incorrect
	 * applicant is chosen.
	 */
	@Test
	public void testIsBestApplicantReturnsFalseWhenAIncorrectApplicantIsChosen() {
		try {
			// Make this sufficiently high because I am not sure how to mock out
			// the best applicant...
			game.newGame(100000, random);

			// This will auto-accept the only applicant (hence the right one)
			game.getNextApplicant();
			game.acceptApplicant();

			assertFalse(game.isBestApplicant());
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}
	}

	/**
	 * This tests that {@code isBestApplicant()} throws a
	 * {@code HiringException} when the game has not started.
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testIsBestApplicantThrowsExceptionWhenGameHasNotStarted()
			throws HiringException {
		game.isBestApplicant();
	}

	/**
	 * This tests that {@code isBestApplicant()} throws a
	 * {@code HiringException} when an applicant has NOT been accepted.
	 * 
	 * @throws HiringException
	 */
	@Test(expected = HiringException.class)
	public void testIsBestApplicantThrowsExceptionWhenApplicantHasNotBeenAccepted()
			throws HiringException {
		try {
			game.newGame(maxApplicants, random);
			game.getNextApplicant();
		} catch (HiringException e) {
			unexpectedHiringExceptionRaised(e);
		}

		game.isBestApplicant();
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
		game.newGame(maxApplicants, null);
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
