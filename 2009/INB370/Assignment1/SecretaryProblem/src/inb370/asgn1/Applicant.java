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
	
	public void setQualityScore(double qualityScore) 
			throws IllegalArgumentException {
		if(qualityScore > 1.0 || qualityScore < 0.0) throw new IllegalArgumentException();
		this.qualityScore = qualityScore;
	}
	
	public String toString() {
		return "Applicant #" + Integer.toString(getId()) + 
			" (" + String.format("%1$.2f%%", getQualityScore() * 100.0) + ")";
	}
}