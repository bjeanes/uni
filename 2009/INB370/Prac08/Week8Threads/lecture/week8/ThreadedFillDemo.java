/*
 * Created on 14/05/2006
 */
package week8;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class ThreadedFillDemo extends JFrame implements ActionListener {

   /**
    * 
    */
   private static final long serialVersionUID = 3536677810191119028L;

   public static final int WIDTH = 300;

   public static final int HEIGHT = 200;

   private JPanel box;

   public ThreadedFillDemo() {
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
      Packer packer = new Packer(box);
      packer.start();
   }

   /**
    * @param args
    */
   public static void main(String[] args) {
      JFrame.setDefaultLookAndFeelDecorated(true);
      ThreadedFillDemo gui = new ThreadedFillDemo();
   }

}
