package week8;

public class Philosopher extends Thread {
   boolean active = true;

   int identity, rightFork, leftFork;

   Fork left;

   Fork right;

   Philosopher(int id, Fork l, Fork r) {
      identity = id;
      left = l;
      right = r;
      leftFork = left.getIdentity();
      rightFork = right.getIdentity();
   }

   public void run() {
      try {
         while (active) {
            System.out.printf("Philosopher %d is thinking%n", identity);
            thinking();
            right.getRight();
            System.out.printf(
                  "Philosopher %d got right fork %d ... looking for left fork %d%n",
                  identity, rightFork, leftFork);
            left.getLeft();
            System.out.printf("Philosopher %d got left fork %d and eats :-)%n",
                  identity, leftFork);
            eating();
            left.put();
            right.put();
         }
      } catch (InterruptedException ignore) {
      }
   }
   
   public void leave() {
      active = false;
   }

   // --- Auxiliary functions (do not change) -------------------------------

   static void eating() {
      if (Math.random() > 0.95)
         try {
            Thread.sleep(100);
         } catch (InterruptedException ignore) {
         }
   }

   static void thinking() {
      if (Math.random() > 0.75)
         try {
            Thread.sleep(5);
         } catch (InterruptedException ignore) {
         }
   }

   static void pause() {
      try {
         Thread.sleep(1000);
      } catch (InterruptedException ignore) {
      }
   }
}