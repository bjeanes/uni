using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

namespace Sudoku
{
    /// <summary>
    /// This enum is used throughout program to specify the difficulty level
    /// of the current or next puzzle to be played.
    /// </summary>
    enum DifficultyLevel
    {
        easy,
        medium,
        hard,
        genius
    }

    /// <summary>
    /// The Game class contains all the puzzles, including ones in play. 
    /// It is the parent of all but the form.
    /// </summary>
    [Serializable]
    class Game
    {
        /// <summary>
        /// currentPuzzle holds the Puzzle that is in play
        /// </summary>
        private Puzzle currentPuzzle;

        /// <summary>
        /// CurrentSquare stores the square that is currently selected.
        /// </summary>
        private UserSquare currentSquare;

        /// <summary>
        /// grid is the GroupBox item that contains all 81 squares.
        /// </summary>
        private GroupBox grid;

        /// <summary>
        /// morePuzzles contains strings of other Sudoku puzzles 
        /// that can be played,indexed by difficulty.
        /// </summary>
        private ArrayList[] morePuzzles = new ArrayList[4]
                                        {
                                           new ArrayList(),   // Easy puzzles
                                           new ArrayList(),   // Medium puzzles
                                           new ArrayList(),   // Hard puzzles
                                           new ArrayList()    // Genius puzzles
                                        };
        
        /// <summary>
        /// puzzlesAvailable specifies how many puzzles there are left to be 
        /// played
        /// </summary>
        private int puzzlesAvailable = 0; // first line of save file

        /// <summary>
        /// defaultPuzzlesFile stores the location of the file to be read at 
        /// startup and written on quit.
        /// </summary>
        private string defaultPuzzlesFile = 
            System.IO.Path.GetDirectoryName(Application.ExecutablePath) 
                                            + "\\sudokupuzzles.dat";
        private string saveGameFile       = 
            System.IO.Path.GetDirectoryName(Application.ExecutablePath) 
                                            + "\\savegame.dat";

        /// <summary>
        /// Game class constructor. Reads in puzzles from default file, 
        /// and if no puzzles can be extracted or no puzzle file exists, 
        /// displays a message box error.
        /// </summary>
        /// <param name="grid">GroupBox that should contain the Square buttons
        /// </param>
        public Game(GroupBox grid)
        {
            this.grid = grid;
            this.ReadPuzzles(defaultPuzzlesFile);
            if (!PuzzlesAvailable())
            {
                MessageBox.Show("Default puzzles file does not exist " +
                                "or is empty.  No puzzles are available. " +
                                "Please add some.", "File Error");
            }
        }

        /// <summary>
        /// NewPuzzle(DifficultyLevel level) clears previous puzzle, 
        /// if it exists, and creates a new one of specified difficulty.
        /// <remarks>Precondition: PuzzlesAvailable() returns true.</remarks>
        /// </summary>
        /// <param name="level">difficulty level of the new puzzle</param>
        public bool NewPuzzle(DifficultyLevel level)
        {
            if (morePuzzles[(int)level].Count > 0)
            {
                // If a puzzle is already in existence, get rid of it:
                if (currentPuzzle != null)
                {
                    currentPuzzle.Clear();
                }

                // Randomly choose puzzle
                int i = new Random().Next(morePuzzles[(int)level].Count);
 
                // Create puzzle
                currentPuzzle = 
                    new Puzzle(this, (string)morePuzzles[(int)level][i]);
                
                // if game is unfinished, 
                //   the puzzlestring in puzzle will be re-added to 
                //   morePuzzles iff they didn't save game.

                // remove new puzzle from the morePuzzles list
                morePuzzles[(int)level].RemoveAt(i); 
                puzzlesAvailable--; // decrease the level of puzzlesAvailable.
               
                return true;
            }
            else
            {
                MessageBox.Show("No puzzles available in that difficulty. \n" +
                                "Please add more puzzles or choose a " +
                                "different difficulty", "No more puzzles!", 
                                MessageBoxButtons.OK);
                return false;
            }
        }

        /// <summary>
        /// PuzzlesAvailable() checks if there are any puzzles left.
        /// </summary>
        /// <returns>true for >0 puzzles, else false</returns>
        public bool PuzzlesAvailable()
        {
            return (puzzlesAvailable > 0);
        }

        /// <summary>
        /// This simply returns the grid the game is using.
        /// </summary>
        /// <returns>GroupBox of the 81 buttons</returns>
        public GroupBox GetGrid()
        {
            return grid;
        }
        
        /// <summary>
        /// Reads in a given file and parses each new puzzle string into the
        /// morePuzzles ArrayList.
        /// </summary>
        /// <param name="filename">this is the location of puzzles file.</param>
        public void ReadPuzzles(String filename)
        {
            // Check that the file is valid:
            if (File.Exists(filename))
            {
                // open file stream:
                StreamReader puzzleFile = new StreamReader(filename);
               
                // read in first line to find out how many puzzles it contains:
                String line = puzzleFile.ReadLine();
                
                int puzzlesInFile = int.Parse(line);

                // iterate through each line of file, adding each one too 
                // morePuzzles, if it isn't already in the morePuzzles 
                // ArrayList.
                for(int i=0,errorCount=0; i<puzzlesInFile; i++)
                {
                    line = puzzleFile.ReadLine();
                    if (line == null)
                    {
                        puzzleFile.Close();
                        return;
                    }

                    if (this.ValidPuzzle(line.Remove(0, 1)))
                    {
                        DifficultyLevel level = new DifficultyLevel();
                        switch (line[0])
                        {
                            case 'E':
                                level = DifficultyLevel.easy;
                                break;
                            case 'M':
                                level = DifficultyLevel.medium;
                                break;
                            case 'H':
                                level = DifficultyLevel.hard;
                                break;
                            case 'G':
                                level = DifficultyLevel.genius;
                                break;
                        }
                        if (!morePuzzles[(int)level].Contains(line))
                        {
                            // Add puzzle to the appropriate list:
                            morePuzzles[(int)level].Add(line);
                            // increment the puzzles counter:
                            puzzlesAvailable++;
                        }
                    }
                    else
                    {
                        errorCount++;
                        MessageBox.Show("A corrupted puzzle string was found." +
                            " This puzzle string is being skipped.\n\n" +
                            "There have been " + errorCount.ToString() + 
                            " broken puzzle string(s) found.",
                            "Puzzle error",MessageBoxButtons.OK,
                            MessageBoxIcon.Error);
                    }
                }
                puzzleFile.Close();
            }
        }

        /// <summary>
        /// This method checks if a given string is a valid puzzlestring. It 
        /// wil perform simple tests first, successfully getting more complicated
        /// and detailed. If at any stage it fails an integrity test, it will
        /// return an error.
        /// </summary>
        /// <param name="line">string to check</param>
        /// <returns>true for valid, else false</returns>
        public bool ValidPuzzle(string fLine)
        {
            string line = fLine.Replace("F","");
            int sumOfNum = 0;
            String[] grpStrings = new String[27];
            
            // initialize each element of array:
            for (int i=0;i<27;i++)
            {
                grpStrings[i] = "";
            }

            //verifies that there are 81 numbers
            if (line.Length != 81)
            {
                return false;
            }

            // add up the value of each number
            foreach(char character in line)
            {
                try
                {
                    sumOfNum += int.Parse(character.ToString());
                }
                catch
                {
                    // this will occur if a character that 
                    // can not be parsed to int is found:
                    return false;
                }
            }

            // this verifies that there are 9 of each number:
            if (sumOfNum != 405)
            {
                return false;
            }

            //create virtual columns
            for (int i = 0; i < 9; i++)
            {
                grpStrings[i] = line.Substring(i*9, 9);
            }

            //create virtual rows
            for (int i = 0; i < 9; i++)
            {
                for(int j=0;j<9;j++ )
                {
                    grpStrings[i+9] += grpStrings[j].Substring(i,1);
                }
            }

            //create virtual blocks
            for (int k = 0; k < 3; k++)
            {
                for (int i = 0; i < 3; i++)
                {
                    for (int j = 0; j < 9; j++)
                    {
                        // calculate correct block group (perhaps more 
                        // complicated than need-be):
                        int blockIndex = (((i / 3) + 1) * ((j / 3) + 1) + (3 * k)) - 1;
                        grpStrings[blockIndex+18] += grpStrings[(i+(3*k))].Substring(j,1);
                    }
                }
            }

            //check that each grouping has every number from 1 to 9 once;
            foreach (string str in grpStrings)
            {
                int numvalue = 0;
                foreach (char character in str)
                {
                    numvalue += int.Parse(character.ToString());
                }
                if ((numvalue != 45) || (str.Length != 9))
                {
                    return false;
                }
            }

            return true;
        }

        /// <summary>
        /// Gets/Sets the CurrentSquare.
        /// </summary>
        public UserSquare CurrentSquare
        {
            get
            {
                return currentSquare;
            }
            set
            {
                currentSquare = value;
            }
        }

        /// <summary>
        /// Add a number to the current square.
        /// </summary>
        /// <param name="num">the number to be added to the square</param>
        public void AddNumber(int num)
        {
            // Add number to current square
            CurrentSquare.AddNumber(num);
        }

        /// <summary>
        /// RemoveNumber removes a number from the current square.
        /// </summary>
        /// <param name="num">the number to be removed from the square</param>
        public void RemoveNumber(int num)
        {
            // Remove number from current square.
            CurrentSquare.RemoveNumber(num);
        }

        /// <summary>
        /// Removes all numbers from the current square.
        /// </summary>
        public void ClearCurrentSquare()
        {
            // clear numbers from current square.
            CurrentSquare.Clear();
        }

        /// <summary>
        /// wipe puzzle so a new one can be started
        /// </summary>
        public void Clear()
        {
            // removes buttons so a new puzzle can be made
            currentPuzzle.Clear();
        }

        /// <summary>
        /// Checks for any incorrect numbers entered into any square.
        /// </summary>
        public void CheckValues()
        {
            currentPuzzle.CheckValues();
        }

        /// <summary>
        /// CheckFinished just calls the method to check if the puzzle
        /// is in a finished state and is correct.
        /// </summary>
        /// <returns>true if an error is found, else false</returns>
        public bool CheckFinished()
        {
            return this.currentPuzzle.CheckFinished();
        }

        /// <summary>
        /// Show the correct answer for the currentSquare
        /// </summary>
        public void GiveHint()
        {
            this.CurrentSquare.ShowAnswer();
        }

        /// <summary>
        /// Is there only a single number in each square?
        /// </summary>
        /// <returns>true if puzzle is finished, else false</returns>
        public bool PuzzleFinished()
        {
            if (this.currentPuzzle != null)
            {
                return this.currentPuzzle.IsFinished();
            }
            return true;
        }
        
        /// <summary>
        /// Replaces all square values with the correct values.
        /// </summary>
        public void ShowSolution()
        {
            this.currentPuzzle.ShowSolution();
        }

        /// <summary>
        /// Saves the morePuzzles list to the default startup file.
        /// </summary>
        /// <param name="saveCurrentGame">
        /// whether or not to include the
        /// current puzzle in the save.
        /// </param>
        public void SavePuzzles(bool saveCurrentGame)
        {
            // add morePuzzles into a new ArrayList to 
            //  be written to default puzzles file:
            ArrayList puzzles = new ArrayList();
            for (int i=0; i < 4; i++)
            {
                puzzles.AddRange(this.morePuzzles[i]);
            }

            // if saveCurrentGame, add current puzzle string 
            //  to the ArrayList for later writing:
            if (saveCurrentGame)
            {
                puzzles.Add(this.currentPuzzle.PuzzleString);
            }

            try
            {
                FileStream file = new FileStream(defaultPuzzlesFile, 
                                            FileMode.Create, FileAccess.Write);
                StreamWriter stream = new StreamWriter(file);
                stream.WriteLine(puzzles.Count.ToString());
                foreach (String line in puzzles)
                {
                    stream.WriteLine(line);
                }
                stream.Close();
                file.Close();
            }
            catch
            {
                DialogResult result = 
                    MessageBox.Show("Could not save default puzzle file. " +
                    "Make sure the file is not in use and is accessible, " +
                    "and try again.", "Sorry", MessageBoxButtons.RetryCancel, 
                    MessageBoxIcon.Error);
                if (result == DialogResult.Retry)
                {
                    this.SavePuzzles(saveCurrentGame);
                }
                return;
            }
        }

        /// <summary>
        /// Loads an unfinished puzzle from a file.
        /// </summary>
        /// <returns>true if file read was successful.</returns>
        public bool LoadPuzzle()
        {
            if (this.currentPuzzle != null)
            {
                this.currentPuzzle.Clear();
            }

            try //to read the file 
            {
                Stream bStream = File.Open(this.saveGameFile, FileMode.Open);
                BinaryFormatter bFormatter = new BinaryFormatter();
                this.currentPuzzle = (Puzzle)bFormatter.Deserialize(bStream);
                this.currentPuzzle.Load(this); // then load will InitButtons().
                bStream.Close();
            }
            catch
            {
                // display error message?
                return false;
            }

            // if all is well, puzzle is loaded.
            return true;
        }

        /// <summary>
        /// Saves the current puzzle to a file.
        /// </summary>
        /// <returns>true if file write was successful.</returns>
        public bool SavePuzzle()
        {
            if (currentPuzzle != null)
            {
                try
                {
                    Stream bStream = File.Open(this.saveGameFile, 
                                                    FileMode.Create);
                    BinaryFormatter bFormatter = new BinaryFormatter();
                    bFormatter.Serialize(bStream, currentPuzzle);
                    bStream.Close();
                    currentPuzzle.Clear();
                    currentPuzzle = null;
                }
                catch
                {
                    DialogResult result = 
                        MessageBox.Show("Could not save your game file. " +
                        "Do you have write permissions to the file\n " +
                        System.IO.Directory.GetCurrentDirectory() + 
                        "\\savegame.dat", "Sorry", 
                        MessageBoxButtons.RetryCancel, MessageBoxIcon.Error);
                    if (result == DialogResult.Retry)
                    {
                        return this.SavePuzzle();
                    }
                    else
                    {
                        return false;
                    }
                }
                return true;
            }
            return false;
        }
    }
}
