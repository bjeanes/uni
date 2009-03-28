package inb370.asgn1;

import java.lang.String;

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
	
	public void setId(int id) {
		this.id = id;
	}
	
	public double getQualityScore() {
		return qualityScore;
	}
	
	public void setQualityScore(double qualityScore) {
		this.qualityScore = qualityScore;
	}
	
	public String toString() {
//		TODO needs to display the quality as a percentage
		return "Applicant #" + Integer.toString(getId()) + 
			" (" + Double.toString(getQualityScore()) + ")";
	}
}