package myAnswers;

public class Encoder {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		/* The secret message */
		final char[] message = "Well done!".toCharArray();
		
		/* The key for unlocking the message */
		final int key = 5;
		
		
		for(char character:message) {
			System.out.println((int)character - key);
		}
	}

}
