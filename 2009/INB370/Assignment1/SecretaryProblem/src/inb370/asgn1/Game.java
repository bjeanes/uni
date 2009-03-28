/**
 * This code forms part of the HiringProblem Project 
 *
 * This code may be freely distributed and modified under the
 * terms of the GNU Lesser General Public Licence.  This should
 * be distributed with the code.  If you do not have a copy,
 * see:
 *
 *      http://www.gnu.org/copyleft/lesser.html
 *
 * Copyright for this code is held jointly by the individual
 * authors.  
 * 
 * File: Game.java
 * Date: 08/03/2009 6:21:30 PM
 *
 */
package inb370.asgn1;

import javax.swing.JFrame;

/**
 * This class is used to start the game.
 * 
 * @author INB370
 * @version 1.0
 */
public class Game {

	/**
	 * Program entry point.
	 * 
	 * Creates the GUI ready for users to begin playing the Hiring Game!
	 * 
	 * @param args ignored
	 */
	public static void main(String[] args) {
		// Set up the HiringProblem and launch the frame
		HiringFrame frame = new HiringFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
	}
}
