using System;
using System.Windows.Forms;
//using System.Collections.Generic;
using System.Text;

namespace Sudoku
{   
    [Serializable]
    class Puzzle
    {
        

        /// <summary>
        /// A 2-dimensional array (9x9) representing the 81 squares. 
        /// Each element contains a square.
        /// </summary>
        private Square[,] puzzle = new Square[9,9]; // puzzle[row][column]
        
        /// <summary>
        /// An array of group. Each array element represents one row. 
        /// Each row has 9 squares.
        /// </summary>
        private Group[] rows = new Group[9];
        
        /// <summary>
        /// An array of group. Each array element represents one column. 
        /// Each column has 9 squares.
        /// </summary>
        private Group[] columns = new Group[9];
        
        /// <summary>
        /// An array of group. Each array element represents one block. 
        /// Each block has 9 squares.
        /// </summary>
        private Group[] blocks = new Group[9];
        
        /// <summary>
        /// The game to which puzzle belongs.
        /// </summary>
        [NonSerialized]
        private Game game;
        
        /// <summary>
        /// String that will represent the puzzle
        /// </summary>
        private String puzzleString;

        /// <summary>
        /// constructer that creates the puzzle with supplied string. 
        /// It also sorts the squares into groupings of rows, columns, 
        /// and blocks.
        /// </summary>
        /// <param name="game">
        /// This is the game that this puzzle is a member of.
        /// </param>
        /// <param name="puzzle">
        /// String representing the puzzle to be solved.
        /// </param>
        public Puzzle(Game game, String puzzle)
        {
            this.game = game;
            this.puzzleString = puzzle;
            int charPos = 1; // 1 instead of 0 to avoid difficulty character.

            // Initialize square groupings:
            for (int g = 0; g < 9; g++)
            {
                this.rows[g] = new Group();
                this.columns[g] = new Group();
                this.blocks[g] = new Group();
            }

            // Put squares into puzzle array:
            for (int i = 0; i < 9; i++)     // create 9 rows
            {
                for (int j = 0; j < 9; j++, charPos++) // create 9 columns
                {
                    // check if its a fixed square:
                    if (PuzzleString[charPos] == "F"[0])
                    {
                        charPos++;            // must turn the char into a 
                                              // string, then parse as int
                        this.puzzle[i,j] = new FixedSquare(this, i, j,
                                               int.Parse(
                                               this.PuzzleString[charPos].
                                               ToString()));
                    }
                    // else it's a user square:
                    else
                    {
                        this.puzzle[i, j] = new UserSquare(this, i, j,
                                                int.Parse(
                                                this.PuzzleString[charPos].
                                                ToString()));
                    }
                    this.puzzle[i, j].InitButton();  // Position button on grid.
                    this.game.GetGrid().Controls.Add(
                          this.puzzle[i,j].Button);  // Add button to grid.
                    

                    // add squares to rows and columns groupings:
                    this.rows[i].AddSquare(this.puzzle[i, j]);
                    this.columns[j].AddSquare(this.puzzle[i, j]);
                }
            }

            // add squares into groupings of blocks
            //   (look at python script for algorithm development):
            for (int k = 0; k < 3; k++)
            {
                for (int i = 0; i < 3; i++)
                {
                    for (int j = 0; j < 9; j++)
                    {
                        // calculate correct block group (perhaps more 
                        // complicated than need-be):
                        int blockIndex = (((i/3)+1)*((j/3)+1)+(3*k))-1;
                        this.blocks[blockIndex].AddSquare(
                                                    this.puzzle[(i+(3*k)), j]);
                    }
                }
            }

            // Select the first usersquare in the puzzle so that pressing a
            //  control button does not crash the program.
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {
                    if (this.puzzle[i, j] is UserSquare)
                    {
                        this.puzzle[i, j].Button.Select();
                        this.puzzle[i, j].Button.PerformClick();
                        return;
                    }
                }
            }
        }

        /// <summary>
        /// Removes all puzzle buttons from the GroupBox grid.
        /// </summary>
        public void Clear()
        {
            // removes buttons from the grid.
            for (int i = 0; i < 9; i++)     // iterate through all 9 rows
            {
                for (int j = 0; j < 9; j++) // iterate through all 9 columns
                {
                    this.game.GetGrid().Controls.Remove(puzzle[i,j].Button);
                    this.puzzle[i, j] = null;
                }
            }
        }

        /// <summary>
        /// returns the string repesenting the puzzle.
        /// </summary>
        public String PuzzleString
        {
            get
            {
                return puzzleString;
            }
        }

        /// <summary>
        /// Load game variable into the puzzle after deserialization (because
        /// game object is not serialized).
        /// </summary>
        /// <param name="game">game to load</param>
        public void Load(Game game)
        {
            // re-create game after deserializing saved game:
            this.game = game;
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {
                    // reinitialize each button and add it to the grid.
                    this.puzzle[i, j].InitButton();
                    this.game.GetGrid().Controls.Add(this.puzzle[i, j].Button);
                }
            }
        }

        /// <summary>
        /// Calls the check method for every single group in the puzzle.
        /// </summary>
        public void CheckValues()
        {
            for (int i = 0; i < 9; i++)
            {
                rows[i].Check();
                columns[i].Check();
                blocks[i].Check();
            }
        }

        /// <summary>
        /// Checks that all squares have one number (and only one number),
        /// and returns false if the puzzle is in a finished state.
        /// </summary>
        /// <returns>true if error, else false</returns>
        public bool CheckFinished()
        {
            if (this.IsFinished())
            {
                for (int i = 0; i < 9; i++)
                {
                    for (int j = 0; j < 9; j++)
                    {
                        if (this.puzzle[i, j].CheckAnswer(true))
                        {
                            return true;
                        }
                    }
                }
            }
            else
            {
                return true;
            }

            return false;
        }

        /// <summary>
        /// set's the puzzles currentSquare parameter.
        /// </summary>
        /// <param name="square">square to set to current</param>
        public void SetCurrent(UserSquare square)
        {
            if (this.game.CurrentSquare is Square)
            {
                this.game.CurrentSquare.Unselect();
            }
            this.game.CurrentSquare = square;
        }

        /// <summary>
        /// Checks if the puzzle is in a finished state (one number per square).
        /// </summary>
        /// <returns>true if the puzzle is finished</returns>
        public bool IsFinished()
        {
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {
                    if (this.puzzle[j, i].IsSingleNumber() == false)
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        /// <summary>
        /// Replaces all squares with the correct answer.
        /// </summary>
        public void ShowSolution()
        {
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {
                    this.puzzle[i, j].ShowAnswer();
                }
            }
        }
    }
}
