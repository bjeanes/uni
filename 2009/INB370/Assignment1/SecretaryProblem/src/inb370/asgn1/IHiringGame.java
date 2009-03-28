package inb370.asgn1;

import java.util.Random;

/**
 * Abstract representation of the Hiring Problem also known as the Secretary Problem.
 * 
 * <a href="http://en.wikipedia.org/wiki/Secretary_problem">Wikipedia problem description</a>
 * 
 * You need to create a class called HiringGame which implements this interface.
 * Your class will be called by the provided GUI to actually run the game. 
 * 
 * @author INB370
 * @version 1.0
 */
public interface IHiringGame
{
	/**
	 * Initializes a new game clearing any previous game state.
	 * 
	 * The new game initialization involves creating <code>maxApplicant</code>
	 * number of applicants each with a unique id and quality score obtained from the
	 * provided java.util.Random object.
	 * 
	 * @param maxApplicants a positive integer number of applicants to consider
	 * @param random a non-null java.util.Random number generator
	 * @throws HiringException thrown when invalid arguments are supplied
	 * 
	 */
	void newGame(int maxApplicants, Random random) throws HiringException;
	
	/**
	 * Returns the next applicant to be considered.
	 * 
	 * If the final applicant has been reached, it is automatically accepted.
	 * The applicants are interviewed sequentially in random order with each interview
	 * order being equally likely. This method rejects the current applicant and returns
	 * the next.
	 * 
	 * Rejected applicants cannot be recalled; therefore, each applicant is returned at
	 * most once by this method.
	 * 
	 * @return A unique applicant to be considered.
	 * @throws HiringException thrown when the game has not been started or an applicant
	 * has already been selected
	 */
	Applicant getNextApplicant() throws HiringException;
	
	/**
	 * Returns if the player has accepted an applicant or not.
	 * @return true iff an applicant has been accepted (see {@link #getNextApplicant()} for
	 * automatic acceptance conditions).
	 * @throws HiringException thrown when the game has not been started
	 */
	boolean isAccepted() throws HiringException;
	
	/**
	 * Accept the current applicant.
	 * 
	 * @throws HiringException thrown when the game has not been started or an applicant
	 * has already been accepted
	 */
	void acceptApplicant() throws HiringException;
	
	/**
	 * Returns if the player has won.
	 * 
	 * @return Returns true iff the accepted applicant has the highest quality score of all
	 * the applicants in the current game.
	 * @throws HiringException thrown when the game has not been started or an applicant has
	 * not been accepted
	 */
	boolean isBestApplicant() throws HiringException;
	
	/**
	 * Returns the best applicant
	 * @return Returns the applicant with the highest quality score of all the applicants in
	 * the current game.
	 * @throws HiringException thrown when the game has not been started or an applicant has
	 * not been accepted 
	 */
	Applicant getBestApplicant() throws HiringException;
}
