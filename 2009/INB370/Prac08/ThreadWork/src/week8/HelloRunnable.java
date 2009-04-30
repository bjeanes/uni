/*
 * Created on 14/05/2006
 */
package week8;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class HelloRunnable implements Runnable {

    public void run() {
        try {
            System.out.print("What is your name? ");
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
            String name = reader.readLine();
            System.out.println();
        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());
        }
    }

}
