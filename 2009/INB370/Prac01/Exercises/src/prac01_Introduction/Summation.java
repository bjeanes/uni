package prac01_Introduction;

/*
 * Program to use in Practical 1 for practice with some of 
 * Eclipse's debugging features
 * 
 * The program is meant to sum the natural numbers in a
 * fixed range
 * 
 * Author: Malcolm Corney
 * Version: 1.1
 * 
 */

public class Summation {

	/* Constants defining the bounds of the range to be summed */
	private static final short START = 1;
	private static final short END = 5; // First try 5, then 1000;
	
	/* Variable to hold the sum of numbers from START to END, inclusive */
	private short total;

	/* Constructor to initialise instance variable */
   public Summation() {
      total = 0;
   }

   /* Method to calculate the sum */
   public void add() {
      for (short index = START; index <= END; index++) {
         total += index;
      }
   }

   /* Method to print the result to the screen */
   public void displayResult() {
      System.out.printf("The sum of integers from %d to %d is %d%n",
    		  START, END, total);
   }
   
   /* Main program */
   public static void main(String[] args) {
      Summation sum = new Summation();
      sum.add();
      sum.displayResult();
   }
}


