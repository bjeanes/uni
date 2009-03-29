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

	@After
	public void after() {
		applicant = null;
	}

	@Before
	public void before() {
		applicant = new Applicant(123, 0.4242);
	}

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

	@Test(expected = IllegalArgumentException.class)
	public void testConstructorThrowsExceptionWithScoreTooHigh() {
		applicant = new Applicant(123, 1.1);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testConstructorThrowsExceptionWithScoreTooLow() {
		applicant = new Applicant(123, -0.1);
	}

	@Test
	public void testGetId() {
		assertEquals(applicant.getId(), 123);
	}

	@Test
	public void testGetQualityScore() {
		assertEquals(applicant.getQualityScore(), 0.4242);
	}

	@Test
	public void testSetId() {
		applicant.setId(666);
		assertEquals(applicant.getId(), 666);
	}

	@Test
	public void testSetQualityScore() {
		applicant.setQualityScore(.99);
		assertEquals(applicant.getQualityScore(), .99);
	}

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

	@Test(expected = IllegalArgumentException.class)
	public void testSetQualityScoreThrowsExceptionWithScoreTooHigh() {
		applicant.setQualityScore(1.1);
	}

	@Test(expected = IllegalArgumentException.class)
	public void testSetQualityScoreThrowsExceptionWithScoreTooLow() {
		applicant.setQualityScore(-0.1);
	}
	
	
	@Test
	public void testToStringIncludesScore() {
		// need .* at beginning and end because it seems Java 
		// regex only performs total matches
		Pattern pattern = Pattern.compile(".*\\d+\\.\\d\\d%.*");
		Matcher matcher = pattern.matcher(applicant.toString());
		assertTrue(matcher.matches());
		
	}
	
	@Test
	public void testToStringIncludesApplicantId() {
		Pattern pattern = Pattern.compile(".*#123.*");
		Matcher matcher = pattern.matcher(applicant.toString());
		assertTrue(matcher.matches());
	}
}
