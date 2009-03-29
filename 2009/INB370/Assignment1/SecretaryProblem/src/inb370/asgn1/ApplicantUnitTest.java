package inb370.asgn1;

import org.junit.*;
import static org.junit.Assert.*;


public class ApplicantUnitTest {
	private Applicant applicant;
	
	@Before
	public void before() {
		applicant = new Applicant(123, 0.42);
	}
	
	@After
	public void after() {
		applicant = null;
	}
	
	@Test
    public void testGetId() {
		assertEquals(applicant.getId(), 123);
    }
	
	@Test
    public void testGetQualityScore() {
		assertEquals(applicant.getQualityScore(), 0.42);
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
	
	@Test(expected=IllegalArgumentException.class)
    public void testSetQualityScoreThrowsExceptionWithInvalidScore() {
		applicant.setQualityScore(1.1);
	}
	
	@Test(expected=IllegalArgumentException.class)
    public void testConstructorThrowsExceptionWithInvalidScore() {
		applicant = new Applicant(123, 1.5);
	}
	
	@Test
    public void testSetQualityScoreDoesNotThowExceptionWithValidScore() {
		try { 
			applicant.setQualityScore(1.0);
			applicant.setQualityScore(0.0);
			applicant.setQualityScore(0.5);
		} catch(IllegalArgumentException e) {
			fail("Applicant.setQualityScore threw IllegalArgumentException with valid score value");
		}
	}
	
	@Test
    public void testConstructorDoesNotThowExceptionWithValidScore() {
		try { 
			applicant = new Applicant(123, 1.0);
			applicant = new Applicant(123, 0.0);
			applicant = new Applicant(123, 0.5);
		} catch(IllegalArgumentException e) {
			fail("Applicant constructor threw IllegalArgumentException with valid score value");
		}
	}
}
