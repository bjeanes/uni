package week8;

import java.util.*;

public class ScheduleTasks {
   
public static void main(String[] args) {
      ScheduledTask hello1 = new ScheduledTask("Hello");
      ScheduledTask hello2 = new ScheduledTask("Hello Again");
      ScheduledTask hat1 = new ScheduledTask("Do you like my hat?");
      ScheduledTask hat2 = new ScheduledTask("I do not like that hat");
      ScheduledTask bye1 = new ScheduledTask("Goodbye");
      ScheduledTask bye2 = new ScheduledTask("Goodbye");

      System.out.println("start of conversation");
      
      // create daemon thread
      Timer timer = new Timer(true);
      timer.schedule(hello1, 1000);
      timer.schedule(hello2, 2000);
      timer.schedule(hat1, 3000);
      timer.schedule(hat2, 4000);
      timer.schedule(bye1, 5000);
      timer.schedule(bye2, 6000);

      try {
         Thread.sleep(7000); 
         System.out.println("end of conversation");
      } catch (InterruptedException ex) {
    	  ex.printStackTrace();
      }
   }
}
