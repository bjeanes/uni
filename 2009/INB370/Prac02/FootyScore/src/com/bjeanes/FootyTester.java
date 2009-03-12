package com.bjeanes;

import java.io.PrintWriter;

public class FootyTester {

	/* This program tests your FootyScore class.  The expected
	 * output can be found in the question sheet.
	 */
	public static void main(String[] args) {

		/* Declare a "screen" object for displaying test results */
		PrintWriter screen = new PrintWriter(System.out, true);
		
		/* Introduce the two teams */
		FootyScore Collingwood = new FootyScore();
		FootyScore Richmond = new FootyScore();
		
		/* First quarter */
		Collingwood.kickBehind();
		Richmond.kickGoal();
		Collingwood.kickBehind();
		screen.println("At the end of the first quarter, it's " +
				"Collingwood, " + Collingwood.sayScore() + " and " +
				"Richmond " + Richmond.sayScore() + ".");
		screen.println((Richmond.inFrontOf(Collingwood) ? "Richmond" : "Collingwood") +
				" lead by " +
				(Richmond.getPoints() - Collingwood.getPoints()) +
				" points!");
		screen.println();
		
		/* Second quarter */
		Richmond.kickGoal();
		Collingwood.kickGoal();
		Collingwood.kickBehind();
		Richmond.kickGoal();
		Collingwood.kickGoal();
		screen.println("At the end of the second quarter, it's " +
				"Collingwood, " + Collingwood.sayScore() + " and " +
				"Richmond " + Richmond.sayScore() + ".");
		screen.println((Richmond.inFrontOf(Collingwood) ? "Richmond" : "Collingwood") +
				" lead by " +
				(Richmond.getPoints() - Collingwood.getPoints()) +
				" points!");
		screen.println();
		
		/* Third quarter */
		Collingwood.kickGoal();
		Richmond.kickBehind();
		Richmond.kickBehind();
		screen.println("At the end of the third quarter, it's " +
				"Collingwood, " + Collingwood.sayScore() + " and " +
				"Richmond " + Richmond.sayScore() + ".");
		screen.println((Collingwood.inFrontOf(Richmond) ? "Collingwood" : "Richmond") +
				" lead by " +
				(Collingwood.getPoints() - Richmond.getPoints()) +
				" point!");
		
		/* Who will win? */

	}

}
