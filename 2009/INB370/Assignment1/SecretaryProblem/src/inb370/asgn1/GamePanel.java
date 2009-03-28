package inb370.asgn1;

import java.awt.Component;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import java.util.Random;

/**
 * The actual GUI components used to run the game and also stores the current
 * game state.
 * 
 * @author INB370
 * @version 1.0
 */
public class GamePanel extends JPanel implements ActionListener {
	// Constants
	public static final int DefaultMaxApplicants = 20;
	public static final long DefaultSeed = 100;

	// GUI Components
	private JButton newGameButton;
	private JButton acceptButton;
	private JButton rejectButton;
	private JTextArea display;
	private JScrollPane textScrollPane;
	private JLabel seedLabel;
	private JTextField seedText;
	private JLabel maxApplicantsLabel;
	private JTextField maxApplicantsText;

	// Game state
	private IHiringGame game;
	private Applicant currentApplicant;

	/**
	 * Creates a new game panel and initializes all of the contained GUI
	 * components.
	 */
	public GamePanel() {
		// Initialize the GUI Components
		initializeComponents();

		game = new HiringGame();
		showNewGameControls();
	}

	/**
	 * This method is called when any button in the GUI is clicked.
	 * 
	 * The method calls an appropriate handler based on which button was
	 * clicked.
	 * 
	 * @param evt Action details
	 */
	public void actionPerformed(ActionEvent evt) {
		// Get event source
		Object src = evt.getSource();

		// Consider the alternatives - not all active at once.
		if (src == newGameButton) {
			handleNewGame();
		} else if (src == acceptButton) {
			handleAcceptButton();
		} else if (src == rejectButton) {
			handleRejectButton();
		}
	}

	private void handleNewGame() {
		try {
			long seed = Long.parseLong(seedText.getText().trim());
			int maxApplicants = Integer.parseInt(maxApplicantsText.getText()
					.trim());

			game.newGame(maxApplicants, new Random(seed));

			currentApplicant = game.getNextApplicant();
			updateDisplay();
		} catch (NumberFormatException e) {
			display.setText(e.toString());
		} catch (HiringException e) {
			display.setText(e.toString());
		} catch (Exception e) {
			display.setText("Unandled Exception: " + e.toString());
			throw new RuntimeException(e);
		}
	}

	private void handleAcceptButton() {
		try {
			game.acceptApplicant();
			updateDisplay();
		} catch (HiringException e) {
			display.setText(e.getMessage());
		} catch (Exception e) {
			display.setText("Unandled Exception: " + e.getMessage());
			throw new RuntimeException(e);
		}
	}

	private void handleRejectButton() {
		try {
			if (!game.isAccepted()) {
				currentApplicant = game.getNextApplicant();
			}
			updateDisplay();
		} catch (HiringException e) {
			display.setText(e.getMessage());
		} catch (Exception e) {
			display.setText("Unandled Exception: " + e.toString());
			throw new RuntimeException(e);
		}
	}

	private void updateDisplay() {
		try {
			if (game.isAccepted()) {
				String str = "Selected Applicant:\n\n"
						+ currentApplicant.toString() + "\n\nwas ";
				if (game.isBestApplicant()) {
					str += "the BEST.  You Win!";
				} else {
					str += "not the best available.  You Lose.\n\nBest applicant was: \n\n"
							+ game.getBestApplicant();
				}
				display.setText(str);
				showNewGameControls();
			} else {
				display.setText("Current applicant is:\n\n"
						+ currentApplicant.toString()
						+ "\n\nDo you wish to accept or reject?");
				showCurrentGameControls();
			}
		} catch (HiringException e) {
			display.setText(e.getMessage());
		} catch (Exception e) {
			display.setText("Unandled Exception: " + e.toString());
			throw new RuntimeException(e);
		}
	}

	private void initializeComponents() {
		GridBagLayout layout = new GridBagLayout();
		this.setLayout(layout);

		GridBagConstraints constraints = new GridBagConstraints();
		constraints.anchor = GridBagConstraints.CENTER;
		constraints.weightx = 100;
		constraints.weighty = 100;
		constraints.fill = GridBagConstraints.BOTH;

		// Text Area and Scroll Pane
		display = new JTextArea();
		display.setEditable(false);
		display.setLineWrap(true);
		display.setFont(new Font("Arial", Font.BOLD, 24));
		display.setBorder(BorderFactory.createEtchedBorder());

		textScrollPane = new JScrollPane(display);
		addToPanel(textScrollPane, constraints, 1, 0, 3, 1);

		// Buttons
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.CENTER;
		constraints.weightx = 10;
		constraints.weighty = 20;

		acceptButton = new JButton("Accept Applicant");
		acceptButton.addActionListener(this);
		addToPanel(acceptButton, constraints, 1, 10, 1, 1);

		rejectButton = new JButton("Reject Applicant");
		rejectButton.addActionListener(this);
		addToPanel(rejectButton, constraints, 3, 10, 1, 1);

		constraints.weighty = 10;
		newGameButton = new JButton("Start New Game");
		newGameButton.addActionListener(this);
		addToPanel(newGameButton, constraints, 1, 9, 1, 2);

		// Labels
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.CENTER;
		constraints.weighty = 10;

		seedLabel = new JLabel("RNG Seed:");
		addToPanel(seedLabel, constraints, 2, 9, 1, 1);

		maxApplicantsLabel = new JLabel("Max Applicants:");
		addToPanel(maxApplicantsLabel, constraints, 3, 9, 1, 1);

		// Text Fields
		constraints.fill = GridBagConstraints.NONE;
		constraints.anchor = GridBagConstraints.CENTER;
		constraints.weightx = 80;

		seedText = new JTextField("" + DefaultSeed, 5);
		seedText.setEditable(true);
		addToPanel(seedText, constraints, 2, 10, 1, 1);

		maxApplicantsText = new JTextField("" + DefaultMaxApplicants, 5);
		maxApplicantsText.setEditable(true);
		addToPanel(maxApplicantsText, constraints, 3, 10, 1, 1);

		repaint();
	}

	private void showNewGameControls() {
		toggleControls(true);
	}

	private void showCurrentGameControls() {
		toggleControls(false);
	}

	private void toggleControls(boolean newGame) {
		newGameButton.setVisible(newGame);
		acceptButton.setVisible(!newGame);
		rejectButton.setVisible(!newGame);

		seedLabel.setVisible(newGame);
		seedText.setVisible(newGame);
		maxApplicantsLabel.setVisible(newGame);
		maxApplicantsText.setVisible(newGame);

		repaint();
	}

	/**
	 * 
	 * A convenience method to add a component to given grid bag layout
	 * locations. Code due to Cay Horstmann
	 * 
	 * @param c the component to add
	 * @param constraints the grid bag constraints to use
	 * @param x the x grid position
	 * @param y the y grid position
	 * @param w the grid width
	 * @param h the grid height
	 */
	private void addToPanel(Component c, GridBagConstraints constraints, int x,
			int y, int w, int h) {
		constraints.gridx = x;
		constraints.gridy = y;
		constraints.gridwidth = w;
		constraints.gridheight = h;
		add(c, constraints);
	}
}
