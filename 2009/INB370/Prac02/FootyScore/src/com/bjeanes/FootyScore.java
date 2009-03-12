package com.bjeanes;

/**
 * @author Bodaniel Jeanes (n5687802)
 *
 */
public class FootyScore {

	/**
	 * Stores the number of goals scored
	 */
	private int goals = 0;
	
	/**
	 * Stores the number of behinds scored
	 */
	private int behinds = 0;
	
	/**
	 * Represents the teams score in conventional AFL style
	 * 
	 * @return a string representing the score
	 */
	public String sayScore() {
		return Integer.toString(this.goals) + ", " +
			Integer.toString(this.behinds) + ", " +
			Integer.toString(this.getPoints());
	}
	
	/**
	 * Returns whether or not the receiver is
	 * ahead of the otherTeam
	 * 
	 * @param otherTeam
	 * @return true if the receiver is winning
	 */
	public boolean inFrontOf(FootyScore otherTeam) {
		return this.getPoints() > otherTeam.getPoints();
	}
	
	/**
	 * Gets the total number of points the
	 * team has scored.
	 * 
	 * @return total points
	 */
	public int getPoints() {
		return ((this.goals * 6) + this.behinds);
	}
	
	/**
	 * Records a goal
	 */
	public void kickGoal() {
		this.goals += 1;
	}
	
	/** 
	 * Records a behind
	 */
	public void kickBehind() {
		this.behinds += 1;
	}
}
