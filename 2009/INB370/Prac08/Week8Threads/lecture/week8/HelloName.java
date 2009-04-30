/*
 * Created on 26/04/2006
 */
package week8;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class HelloName extends Thread {

    public void run() {
        try {
            System.out.print("What is your name? ");
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    System.in));
            String name = reader.readLine();
            System.out.println("Hello " + name);
        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());
        }
    }
}
