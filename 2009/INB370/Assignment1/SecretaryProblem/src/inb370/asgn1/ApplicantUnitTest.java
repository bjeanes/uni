package inb370.asgn1;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * @author Bodaniel Jeanes (n5687802)
 * 
 */
public class ApplicantUnitTest {
	private Applicant applicant;

	/**
	 * Tear down method that nullifies all variables to prevent test state
	 * bleeding into each other
	 */
	@After
	public void after() {
		applicant = null;
	}

	/**
	 * Set up method which initialises values used by nearly all if not all
	 * tests.
	 */
	@Before
	public void before() {
		applicant = new Applicant(123, 0.4242);
	}

	/**
	 * This tests that a valid {@code Applicant} is initialised with a
	 * reasonable set of values for the quality score (including edge cases like
	 * 0.0 and 1.0).
	 */
	@Test
	public void testConstructorDoesNotThowExceptionWithValidScore() {
		try {
			applicant = new Applicant(123, 1.0);
			applicant = new Applicant(123, 0.0);
			applicant = new Applicant(123, 0.5);
		} catch (IllegalArgumentException e) {
			AssertionError ae = new AssertionError();
			ae.initCause(e);
			throw ae;
		}
	}

	/**
	 * This tests that an {@code IllegalArgumentException} is raised if the
	 * quality score is over 1.0.
	 */
	@Test(expected = IllegalArgumentException.class)
	public void testConstructorThrowsExceptionWithScoreTooHigh() {
		applicant = new Applicant(123, 1.1);
	}

	/**
	 * This tests that an {@code IllegalArgumentException} is raised if the
	 * quality score is under 0.0.
	 */
	@Test(expected = IllegalArgumentException.class)
	public void testConstructorThrowsExceptionWithScoreTooLow() {
		applicant = new Applicant(123, -0.1);
	}

	/**
	 * This tests that {@code getId()} returns the applicant ID that was
	 * provided to the constructor or {@code setId()}.
	 */
	@Test
	public void testGetId() {
		assertEquals(applicant.getId(), 123);
	}

	/**
	 * This tests that {@code getQualityScore()} returns the quality score that
	 * was provided to the constructor or {@code setQualityScore()}.
	 */
	@Test
	public void testGetQualityScore() {
		assertEquals(applicant.getQualityScore(), 0.4242);
	}

	/**
	 * This tests that {@code setId()} correctly changes the quality score of
	 * the applicant, verified by using {@code getId()} (assumed to be working).
	 */
	@Test
	public void testSetId() {
		applicant.setId(666);
		assertEquals(applicant.getId(), 666);
	}

	/**
	 * This tests that {@code setQualityScore()} correctly changes the quality
	 * score of the applicant, verified by using {@code getQualityScore()}
	 * (assumed to be working).
	 */
	@Test
	public void testSetQualityScore() {
		applicant.setQualityScore(.99);
		assertEquals(applicant.getQualityScore(), .99);
	}

	/**
	 * This tests that {@code setQualityScore()} does not raise an exception if
	 * the score is set using any assumed acceptable values (including edge
	 * cases like 0.0 and 1.0).
	 */
	@Test
	public void testSetQualityScoreDoesNotThowExceptionWithValidScore() {
		try {
			applicant.setQualityScore(1.0);
			applicant.setQualityScore(0.0);
			applicant.setQualityScore(0.5);
		} catch (IllegalArgumentException e) {
			AssertionError ae = new AssertionError();
			ae.initCause(e);
			throw ae;
		}
	}

	/**
	 * This tests that an {@code IllegalArgumentException} is raised if the
	 * quality score is set to a value higher than 1.0.
	 */
	@Test(expected = IllegalArgumentException.class)
	public void testSetQualityScoreThrowsExceptionWithScoreTooHigh() {
		applicant.setQualityScore(1.1);
	}

	/**
	 * This tests that an {@code IllegalArgumentException} is raised if the
	 * quality score is set to a value lower than 0.0.
	 */
	@Test(expected = IllegalArgumentException.class)
	public void testSetQualityScoreThrowsExceptionWithScoreTooLow() {
		applicant.setQualityScore(-0.1);
	}

	/**
	 * Checks that the applicant ID is in the {@code toString()} method and that
	 * it is the right ID.
	 */
	@Test
	public void testToStringIncludesApplicantId() {
		// 123 taken from the @Before setup method
		Pattern pattern = Pattern.compile(".*#123.*");
		Matcher matcher = pattern.matcher(applicant.toString());
		assertTrue(matcher.matches());
	}

	/**
	 * Checks that the quality score is present in the {@code toString()} method
	 * as a percentage with 2 decimal places (e.g. {@value 12.34%}).
	 */
	@Test
	public void testToStringIncludesScore() {
		// need .* at beginning and end because it seems Java
		// regex only performs total matches
		Pattern pattern = Pattern.compile(".*\\d+\\.\\d\\d%.*");
		Matcher matcher = pattern.matcher(applicant.toString());
		assertTrue(matcher.matches());

	}
}
