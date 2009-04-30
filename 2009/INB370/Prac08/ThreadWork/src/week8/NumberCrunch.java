/*
 * Created on 26/04/2006
 */
package week8;

public class NumberCrunch extends Thread {
   private static boolean stopflag = false;

   public void run() {
      int i = 1;
      double d = 0.0;
      try {
         while (!stopflag) {
            d = Math.log(i++);
            sleep(1);
         }
         System.out.println("The log of " + i + " is " + d);
     } catch (InterruptedException ie) {
         System.out.println(ie.getMessage());
     }
   }

   public void end() {
      stopflag = true;
   }
}
