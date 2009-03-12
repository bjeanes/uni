package superheroes;

/**
 * This enumerated type lists super powers commonly available
 * to comic book superheroes and associates a (subjective) value
 * with each one for defeating supervillains.  (The list of
 * powers is by no means comprehensive.)
 * 
 * @author Colin Fidge
 * @version 1.0
 *
 */
public enum SuperPower {
	
	Flight(100),
	SuperStrength(75),
	XRayVision(20),
	SuperSpeed(40),
	Invulnerability(150),
	SuperIntellect(90);
	
	/* 
	 * This particular power's value to its possessor
	 */
	private int value_of_power;
	
	/* 
	 * When an object of this enumerated type is
	 * constructed, the constructor stores the particular
	 * value associated with the power in a private field
	 */
	SuperPower(int value) {
		value_of_power = value;
	}
	
	/**
	 * Returns the (subjective) value of this power to the
	 * hero who possesses it.
	 */
	public int getValue() {
		return value_of_power;
	}

}
