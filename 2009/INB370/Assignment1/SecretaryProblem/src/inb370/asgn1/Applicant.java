package inb370.asgn1;

public class Applicant {
	private int id;
	private double qualityScore;

	public Applicant(int id, double qualityScore) {
		setId(id);
		setQualityScore(qualityScore);
	}

	public int getId() {
		return id;
	}

	public double getQualityScore() {
		return qualityScore;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * This sets the quality score if it is within an acceptable range (0.0 <=
	 * qualityScore <= 1.0), else raises an exception
	 * 
	 * @param qualityScore
	 * @throws IllegalArgumentException
	 */
	public void setQualityScore(double qualityScore)
			throws IllegalArgumentException {
		if (qualityScore > 1.0 || qualityScore < 0.0)
			throw new IllegalArgumentException();
		this.qualityScore = qualityScore;
	}

	
	/**
	 * Shows the applicant ID and the quality score as a percentage with an accuracy of 2
	 * 
	 * @return String - e.g. "Applicant #123 (12.34%)"
	 */
	public String toString() {
		return "Applicant #" + Integer.toString(getId()) + " ("
				+ String.format("%1$.2f%%", getQualityScore() * 100.0) + ")";
	}
}