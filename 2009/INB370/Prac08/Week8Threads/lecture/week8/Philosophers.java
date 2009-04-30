package week8;

public class Philosophers {
   public final static int N = 5;

   public static void main(String[] args) {
      Philosopher[] phil = new Philosopher[N];
      Fork[] fork = new Fork[N];

     // instantiate forks
      for (int i = 0; i < N; ++i) {
         fork[i] = new Fork(i);
      }
      
      // instantiate philosophers and assign forks
      for (int i = 0; i < N; ++i) {
         phil[i] = new Philosopher(i, fork[((i - 1) + N) % N], fork[i]);
         phil[i].start();
      }
      
      try {
         Thread.sleep(10000);
         for (int i = 0; i < N; ++i) {
            phil[i].leave();
            phil[i].join();
         }
         System.out.println("No deadlock after 10 seconds");
      } catch (InterruptedException e) {
         System.out.println("Exception: " + e);
      }
   }
}



