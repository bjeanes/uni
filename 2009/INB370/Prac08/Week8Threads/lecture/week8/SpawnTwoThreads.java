/*
 * Created on 26/04/2006
 */
package week8;

public class SpawnTwoThreads {

   public static void main(String[] args) throws InterruptedException {
      HelloName one = new HelloName();
      one.start();
      NumberCrunch two = new NumberCrunch();
      two.start();
      one.join();
      two.end();
   }
}
