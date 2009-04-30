/*
 * Created on 14/05/2006
 */
package week8;

import java.awt.Graphics;

import javax.swing.JPanel;

public class Packer extends Thread {

    private JPanel box;
    
    public Packer(JPanel box) {
        this.box = box;
    }
    
    public static final int FILL_WIDTH = 300;
    public static final int FILL_HEIGHT = 100;
    public static final int CIRCLE_SIZE = 10;
    public static final int PAUSE = 100;

    public void run() {
        Graphics g = box.getGraphics();
        for (int y = 0; y < FILL_HEIGHT; y += CIRCLE_SIZE) {
            for (int x = 0; x < FILL_WIDTH; x += CIRCLE_SIZE) {
                g.fillOval(x, y, CIRCLE_SIZE, CIRCLE_SIZE);
                doNothing(PAUSE);
            }
        }
    }

    private void doNothing(int time) {
        try {
            Thread.sleep(time);
        } catch (InterruptedException ie) {
            System.out.println("Unexpected Interrupt");
            System.exit(0);
        }
    }

}
