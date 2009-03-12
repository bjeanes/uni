package myAnswers;

public class Decoder {
	/**
	 * @param args
	 */
	public static void main(String[] args) {

		/* The secret message */
		final int[] message = {82, 96, 103, 103, 27, 95, 106, 105, 96, 28};
		
		/* The key for unlocking the message */
		final int key = 5;
		
		for(int character:message) {
			System.out.print((char)(character + key));
		}
	}
}
