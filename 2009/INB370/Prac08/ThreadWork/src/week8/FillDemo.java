/*
 * Created on 14/05/2006
 */
package week8;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class FillDemo extends JFrame implements ActionListener {

   private static final long serialVersionUID = 3781131228852609629L;

   public static final int WIDTH = 300;

   public static final int HEIGHT = 200;

   public static final int FILL_WIDTH = 300;

   public static final int FILL_HEIGHT = 100;

   public static final int CIRCLE_SIZE = 10;

   public static final int PAUSE = 100;

   private JPanel box;

   public FillDemo() {
      setSize(WIDTH, HEIGHT);
      setTitle("Fill Demo");
      setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      setLayout(new BorderLayout());
      box = new JPanel();
      add(box, "Center");

      JPanel buttonPanel = new JPanel();
      buttonPanel.setLayout(new FlowLayout());
      JButton startButton = new JButton("Start");
      startButton.addActionListener(this);
      buttonPanel.add(startButton);
      add(buttonPanel, "South");
      setVisible(true);
   }

   public void actionPerformed(ActionEvent e) {
      fill();
   }

   private void fill() {
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

   public static void main(String[] args) {
      JFrame.setDefaultLookAndFeelDecorated(true);
      FillDemo gui = new FillDemo();
   }
}
