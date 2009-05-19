using System;
//using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;

namespace Sudoku
{
    [Serializable]
    abstract class Square
    {
        /// <summary>
        /// row in which the square resides
        /// </summary>
        private int row;

        /// <summary>
        /// column in which the square resides.
        /// </summary>
        private int column;
        
        /// <summary>
        /// Stores the correct answer for this square
        /// </summary>
        protected int correctAnswer;
        
        /// <summary>
        /// This is the button the user clicks to select this square
        /// </summary>
        [NonSerialized]
        protected Button button = null;
        
        /// <summary>
        /// A variable storing the puzzle in which the square belongs
        /// </summary>
        protected Puzzle puzzle;

        /// <summary>
        ///
        /// </summary>
        /// <param name="puzzle">puzzle which the square is a member of</param>
        /// <param name="row">row which square is in</param>
        /// <param name="column">column which square is in</param>
        /// <param name="answer">the correct answer that belongs to this square
        /// </param>
        public Square(Puzzle puzzle, int row, int column, int answer)
        {
            this.correctAnswer = answer;
            this.row = row;
            this.column = column;
            this.puzzle = puzzle;
        }

        /// <summary>
        /// Access the button object.
        /// </summary>
        public Button Button
        {
            get
            {
                return button;
            }
        }

        /// <summary>
        /// Sets the look and position of the square.
        /// </summary>
        public virtual void InitButton()
        {
            if (button == null)
            {
                int btnSize = 45;
                button = new Button();
                button.Location = 
                    new System.Drawing.Point(
                        17 + btnSize * column, 22 + btnSize * row);
                button.Size = new System.Drawing.Size(btnSize, btnSize);
                button.FlatStyle = FlatStyle.Flat;
            }

            // Colour certain squares to make groups easier to see:
            if (((row == 0 || row == 1 || row == 2 || row == 6 ||
                row == 7 || row == 8) && (column == 3 || column == 4 || 
                column == 5)) || ((column == 0 || column == 1 || column == 2 || 
                column == 6 || column == 7 || column == 8) && (row == 3 || 
                row == 4 || row == 5)))
            {
                button.BackColor = System.Drawing.SystemColors.ControlDark;
            }
            else
            {
                button.BackColor = System.Drawing.SystemColors.Control;
            }
        }

        /// <summary>
        /// Checks if the given number is in the square.
        /// </summary>
        /// <param name="num">number to check</param>
        /// <returns>true if number exists, else false</returns>
        public abstract bool HasNumber(int num);

        /// <summary>
        /// Verifies that there is only one number in the square's number list.
        /// </summary>
        /// <returns>true if single number, else false</returns>
        public abstract bool IsSingleNumber();

        /// <summary>
        /// Returns the single number in the numbers list.
        /// </summary>
        /// <returns>square.numbers[0]</returns>
        public abstract int GetSingleNumber();

        /// <summary>
        /// Abstract method skeleton for checking to see if the buttons text
        /// is equivalent to the correct answer. 
        /// </summary>
        /// <param name="finished"></param>
        /// <returns></returns>
        public abstract bool CheckAnswer(bool finished);

        /// <summary>
        /// Checks if the given square has any numbers in common with itself
        /// and if so calls the error method on those squares.
        /// </summary>
        /// <param name="square"></param>
        /// <returns></returns>
        public abstract bool Check(Square square);

        /// <summary>
        /// The Error method is called when an error has been detected so
        /// that this square can display the error by changing the colours.
        /// </summary>
        public abstract void Error();

        /// <summary>
        /// ShowAnswer will display the correct answer for this square.
        /// </summary>
        public abstract void ShowAnswer();
    }
}
