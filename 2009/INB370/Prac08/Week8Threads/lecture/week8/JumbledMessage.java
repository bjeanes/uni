/*
 * Created on 14/05/2006
 */
package week8;

public class JumbledMessage implements Runnable {

   private String message;

   private int pauseTime;

   private volatile boolean stopFlag;

   public JumbledMessage() {
      super();
   }

   public JumbledMessage(String message, int pauseTime) {
      this();
      this.message = message;
      this.pauseTime = pauseTime;
   }

    public static void displayMessage(JumbledMessage jm)
         throws InterruptedException {
      for (int i = 0; i < jm.message.length(); i++) {
         System.out.print(jm.message.charAt(i));
         Thread.currentThread().sleep(50);
      }
      System.out.println();
   }

//    public static synchronized void displayMessage(JumbledMessage jm)
//         throws InterruptedException {
//      for (int i = 0; i < jm.message.length(); i++) {
//         System.out.print(jm.message.charAt(i));
//         Thread.currentThread().sleep(50);
//      }
//      System.out.println();
//   }

//   private static Object sharedLock = new Object();
//
//   public static void displayMessage(JumbledMessage jm)
//         throws InterruptedException {
//      synchronized (sharedLock) {
//         for (int i = 0; i < jm.message.length(); i++) {
//            System.out.print(jm.message.charAt(i));
//            Thread.currentThread().sleep(50);
//         }
//         System.out.println();
//      }
//   }

   public void run() {
      stopFlag = false;
      try {
         while (!stopFlag) {
            displayMessage(this);
            Thread.currentThread().sleep(pauseTime);
         }
      } catch (InterruptedException ie) {
         System.out.println(ie.getMessage());
      }

   }

   public void finish() {
      stopFlag = true;
      return;
   }

   public static void main(String[] args) {
      try {
         JumbledMessage m1 = new JumbledMessage("bonjour!", 250);
         JumbledMessage m2 = new JumbledMessage("Hello!", 100);
         Thread m1Thread = new Thread(m1);
         Thread m2Thread = new Thread(m2);
         m1Thread.start();
         m2Thread.start();

         // pause
         Thread.currentThread().sleep(5000);
         m1.finish();
         m2.finish();
         m1Thread.join();
         m2Thread.join();
      } catch (InterruptedException ie) {
         System.out.println(ie.getMessage());
      } finally {
         System.out.println();
      }
   }
}
