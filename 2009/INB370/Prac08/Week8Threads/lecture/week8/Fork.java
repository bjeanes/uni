package week8;

public class Fork {
   private boolean taken = false;

   private int identity;

   Fork(int id) {
      identity = id;
   }

   synchronized void put() {
      taken = false;
      System.out.printf("Fork %d is put down%n", identity);
      notify();
   }

   synchronized void getRight() throws InterruptedException {
      while (taken) {
         wait();
      }
      taken = true;
   }

   synchronized void getLeft() throws InterruptedException {
      while (taken) {
         wait();
      }
      taken = true;
   }

   synchronized int getIdentity() {
      return identity;
   }
}