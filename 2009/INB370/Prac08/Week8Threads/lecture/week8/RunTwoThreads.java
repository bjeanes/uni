/*
 * Created on 14/05/2006
 */
package week8;

public class RunTwoThreads {

   public static void main(String[] args) throws InterruptedException {
      Thread one = new Thread(new HelloRunnable());
      one.start();
      NumberCruncher nc = new NumberCruncher();
      Thread two = new Thread(nc);
      two.start();
      one.join();
      nc.end();
   }
}
