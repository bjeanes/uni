package week8;

import java.util.*;

public class ScheduledTask extends TimerTask {
   
   private String message;

   public ScheduledTask(String message) {
     this.message = message;
   }

   public void run() {
     System.out.println(message);
   }
}
