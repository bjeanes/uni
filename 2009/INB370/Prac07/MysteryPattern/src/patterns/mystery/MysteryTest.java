
package patterns.mystery; 

import patterns.mystery.Singleton;


public class MysteryTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Singleton m1 = Singleton.getInstance(); 
		m1.HereIAm();
		Singleton m2 = Singleton.getInstance();
		m2.HereIAm();
	}

}
