/*
 * Created on 14/05/2006
 */
package week8;

public class NumberCruncher implements Runnable {

   private static boolean stopflag = false;

   public void run() {
      try {
         int i = 1;
         double d = 0;
         while (!stopflag) {
            d = Math.log(i++);
            Thread.currentThread().sleep(1);
         }
         System.out.printf("The log of %d is %f%n", i, d);
      } catch (InterruptedException ie) {
         System.out.println(ie.getMessage());
      }
   }

   public void end() {
      stopflag = true;
   }
}
