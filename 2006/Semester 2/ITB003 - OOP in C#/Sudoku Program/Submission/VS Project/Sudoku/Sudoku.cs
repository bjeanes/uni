using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Sudoku
{
    public partial class Sudoku : Form
    {
        /// <summary>
        /// This is the game!!!
        /// </summary>
        Game game;

        /// <summary>
        /// This variable keeps track of the currently selected
        /// difficulty level.
        /// </summary>
        DifficultyLevel level;

        bool enabled = false;

        /// <summary>
        /// Form constructor
        /// </summary>
        public Sudoku()
        {
            InitializeComponent();
        }
        /// <summary>
        /// Form OnLoad event. Initializes the game object
        /// and sets the Add More Puzzles open dialog initial
        /// directory (can't put it in Sudoku.Designer.cs because it
        /// doesn't seem to access Application.ExecutablePath).
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Sudoku_Load(object sender, EventArgs e)
        {
            this.game = new Game(grpBoxPuzzle);
            this.openAddNewPuzzles.InitialDirectory = 
                System.IO.Path.GetDirectoryName(Application.ExecutablePath);
        }

        /// <summary>
        /// This method handles the Application quit verification
        /// i.e. does user want to quit, and if so do they want to save their 
        /// game?
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Sudoku_FormClosing(object sender, 
                                        System.ComponentModel.CancelEventArgs e)
        {
            DialogResult quitDialog1 = MessageBox.Show("Are you sure you wish to exit?",
                                       "Quit Dialog", MessageBoxButtons.YesNo);
            if (quitDialog1 == DialogResult.Yes)
            {
                if (!game.PuzzleFinished())
                {
                    // Prompt player to save game before exiting:
                    DialogResult quitDialog2 = MessageBox.Show("Do you wish to save current"
                                              + " puzzle before exiting?",
                                              "Save Puzzles Dialog",
                                              MessageBoxButtons.YesNoCancel);

                    if (quitDialog2 == DialogResult.Yes)
                    {
                        // Save the current game to a save file.
                        this.game.SavePuzzle();

                        // User is saving the current puzzle to resume later, 
                        //   so do not include in default puzzles file:
                        this.game.SavePuzzles(false);
                        return;
                    }
                    else if (quitDialog2 == DialogResult.No)
                    {
                        // puzzle is unfinished and user is not saving to savegame file,
                        //   so put back into default puzzles file:
                        this.game.SavePuzzles(true);
                    }
                    else
                    {
                        // This is in case the player chooses not to exit.
                        e.Cancel = true;
                    }
                }
                else
                {
                    // the current puzzle has been finished, so not save it to default puzzles file:
                    game.SavePuzzles(false);
                }
                // And now, we quit here!
            }
            else
            {
                e.Cancel = true;
            }
        }

        #region Menu Items
        /// <summary>
        /// Check one difficulty level and ensure everything else is unchecked.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DifficultyToolStripMenuItem_Click(object sender, 
                                                       EventArgs e)
        {
            ToolStripMenuItem levelSelect = (ToolStripMenuItem)sender;
            
            mediumToolStripMenuItem.Checked = false;
            hardToolStripMenuItem.Checked = false;
            geniusToolStripMenuItem.Checked = false;
            easyToolStripMenuItem.Checked = false;

            switch (levelSelect.Text.ToString().Remove(0,1))
            {
                case "Easy":
                    easyToolStripMenuItem.Checked = true;
                    this.level = DifficultyLevel.easy;
                    break;
                case "Medium":
                    mediumToolStripMenuItem.Checked = true;
                    this.level = DifficultyLevel.medium;
                    break;
                case "Hard":
                    hardToolStripMenuItem.Checked = true;
                    this.level = DifficultyLevel.hard;
                    break;
                case "Genius":
                    geniusToolStripMenuItem.Checked = true;
                    this.level = DifficultyLevel.genius;
                    break;
            }
        }

        /// <summary>
        /// Starts a new puzzle using the difficulty level of the checked 
        /// value in the Level menu. This also changes the graphic indicator 
        /// to show difficulty level.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void newToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // Check that there are puzzles to be added, else error.
            if (this.game.PuzzlesAvailable())
            {
                // Create puzzle and if successful, enable buttons
                if (this.game.NewPuzzle(this.level))
                {
                    this.EnableControlButtons(true);

                    // Change the image depicting puzzle difficulty:
                    switch (this.level)
                    {
                        case DifficultyLevel.easy:
                            this.picDifficultyLevel.Image = 
                                global::Sudoku.Properties.Resources.
                                                                difficulty_easy;
                            break;
                        case DifficultyLevel.medium:
                            this.picDifficultyLevel.Image = 
                                global::Sudoku.Properties.Resources.
                                                                difficulty_med;
                            break;
                        case DifficultyLevel.hard:
                            this.picDifficultyLevel.Image = 
                                global::Sudoku.Properties.Resources.
                                                                difficulty_hard;
                            break;
                        case DifficultyLevel.genius:
                            this.picDifficultyLevel.Image = 
                                global::Sudoku.Properties.Resources.
                                                              difficulty_genius;
                            break;
                    }
                }
            }
            else
            {
                MessageBox.Show("There are no puzzles left, please add more.",
                                "Puzzle Error", MessageBoxButtons.OK);
            }
        }


        /// <summary>
        /// Call method to load the saved game and, if successful,
        /// enable the control buttons (if necessary);
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void loadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (this.game.LoadPuzzle())
            {
                this.EnableControlButtons(true);
            }
        }

        /// <summary>
        /// Calls the method to save and close a game and disable the 
        /// control buttons.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (this.game.SavePuzzle())
            {
                this.EnableControlButtons(false);
            }
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void quitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void addMorePuzzlesToolStripMenuItem_Click(object sender, 
                                                           EventArgs e)
        {
            openAddNewPuzzles.ShowDialog();
            game.ReadPuzzles(openAddNewPuzzles.FileName);
        }
        #endregion

        /// <summary>
        /// This event handles pressing buttons 1-9 to either add 
        /// or remove the number from the square.
        /// </summary>
        /// <param name="sender">
        /// Used to determine which button called the action
        /// </param>
        /// <param name="e"></param>
        private void btnNum_Click(object sender, EventArgs e)
        {
            Button item = (Button)sender; 
            switch ((string)this.lblStatusMain.Tag)
            {
                case "waitingForNumClear":
                    this.game.RemoveNumber(int.Parse(item.Text.Remove(0,1)));
                    this.lblStatusMain.Tag = "ready";
                    this.lblStatusMain.Text = "Ready.";
                    break;
                case "ready":
                default:
                    this.game.AddNumber(int.Parse(item.Text.Remove(0,1)));
                    break;
            }
        }

        // Done?
        #region Game Buttons
        /// <summary>
        /// Clears all the numbers from the selected square.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnClearSquare_Click(object sender, EventArgs e)
        {
            this.game.CurrentSquare.Clear();
        }

        /// <summary>
        /// Clear number from square (number is specified after this event)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnClearNumber_Click(object sender, EventArgs e)
        {
            this.lblStatusMain.Tag = "waitingForNumClear";
            this.lblStatusMain.Text = "Waiting for a number to remove ...";
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCheckValues_Click(object sender, EventArgs e)
        {
            this.game.CheckValues();
        }

        /// <summary>
        /// Calls the method to check if the puzzle is finished and correct,
        /// and displays a message based on its return.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCheckFinished_Click(object sender, EventArgs e)
        {
            if (!this.game.CheckFinished())
            {
                DialogResult result = 
                    MessageBox.Show("Congratulations, you have successfully " +
                            "finished this sudoku puzzle!","Congratulations",
                            MessageBoxButtons.OK,MessageBoxIcon.Exclamation);
            }
            else
            {
                DialogResult result =
                   MessageBox.Show("Sorry, you have not yet " +
                           "finished this sudoku puzzle!", "Sorry =(",
                           MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// Calls method to set the current square to the correct answer.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnHint_Click(object sender, EventArgs e)
        {
            this.game.GiveHint();
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnShowSolution_Click(object sender, EventArgs e)
        {
            this.game.ShowSolution();
            this.EnableControlButtons(false);
        }
        #endregion

        /// <summary>
        /// Enables all of the controls to the side of the puzzle once a 
        /// puzzle has been started.
        /// </summary>
        private void EnableControlButtons(bool state)
        {
            this.btnNum1.Enabled = state;
            this.btnNum2.Enabled = state;
            this.btnNum3.Enabled = state;
            this.btnNum4.Enabled = state;
            this.btnNum5.Enabled = state;
            this.btnNum6.Enabled = state;
            this.btnNum7.Enabled = state;
            this.btnNum8.Enabled = state;
            this.btnNum9.Enabled = state;
            this.btnClearSquare.Enabled = state;
            this.btnClearNumber.Enabled = state;
            this.btnCheckValues.Enabled = state;
            this.btnCheckFinished.Enabled = state;
            this.btnHint.Enabled = state;
            this.btnShowSolution.Enabled = state;
            this.shortcutsToolStripMenuItem.Enabled = state;
            this.enabled = state;
        }

        private void howToPlaySudokuToolStripMenuItem_Click(object sender, 
                                                            EventArgs e)
        {
            Form help = new Help(0);
            help.ShowDialog(this);
            help = null;
        }

        private void solvingTipsToolStripMenuItem_Click(object sender, 
                                                        EventArgs e)
        {
            Form help = new Help(1);
            help.ShowDialog(this);
            help = null;
        }

        private void aboutSudokuToolStripMenuItem_Click(object sender, 
                                                        EventArgs e)
        {
            Form help = new Help(2);
            help.ShowDialog(this);
            help = null;
        }

        private void shortcut(object sender, EventArgs e)
        {
            ToolStripMenuItem item = (ToolStripMenuItem)sender;

            if (this.enabled)
            {
                switch (item.Text)
                {
                    case "Clear Square":
                        this.btnClearSquare.PerformClick();
                        break;
                    case "Subtract Number":
                        this.btnClearNumber.PerformClick();
                        break;
                    default:
                        Button button = new Button();
                        button.Text = item.Text;
                        this.btnNum_Click(button, e);
                        break;
                }
            }
        }
    }
}
