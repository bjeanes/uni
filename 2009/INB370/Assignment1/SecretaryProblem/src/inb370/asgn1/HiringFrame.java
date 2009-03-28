package inb370.asgn1;

import java.awt.Dimension;
import javax.swing.JFrame;

/**
 * This class is the outermost container for the game's GUI components.
 * 
 * @author INB370
 */
public class HiringFrame extends JFrame {

	// Display constants
	protected static final int WIDTH = 600;
	protected static final int HEIGHT = 500;
	protected static final Dimension PREFSIZE = new Dimension(WIDTH, HEIGHT);

	/**
	 * Create the HiringFrame object and fill the frame with the game panel
	 */
	public HiringFrame() {
		// Initialize the Frame and add the GamePanel
		setTitle("HiringProblem Game Application");
		setSize(PREFSIZE);

		this.getContentPane().add(new GamePanel());
		repaint();
	}
}
