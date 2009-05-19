using System;
using System.Collections;
using System.Text;
using System.Windows.Forms;

namespace Sudoku
{
    [Serializable]
    class UserSquare : Square
    {
        /// <summary>
        /// This ArrayList stores all the numbers that the square contins.
        /// </summary>
        private ArrayList numbers = new ArrayList();
        
        /// <summary>
        /// Not sure what this is used for. My implemenation has not needed it.
        /// </summary>
        private bool checkMode;

        /// <summary>
        /// Constructor that defaults to the base constructor.
        /// </summary>
        /// <param name="puzzle">puzzle which the square is a member of</param>
        /// <param name="row">row which square is in</param>
        /// <param name="column">column which square is in</param>
        /// <param name="answer">the correct answer that belongs to this square
        /// </param>
        public UserSquare(Puzzle puzzle, int row, int column, int answer) : 
                                               base(puzzle, row, column, answer)
        {
        }

        /// <summary>
        /// Set button properties such as event handler and font and 
        /// draws any numbers in the numbers ArrayList onto the button Text.
        /// </summary>
        public override void InitButton()
        {
            base.InitButton();
            this.button.Click += new EventHandler(ButtonClick);
            this.button.Font = 
                new System.Drawing.Font("Microsoft Sans Serif", 16.0F, 
                    System.Drawing.FontStyle.Regular, 
                    System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.AddNumber(-10); //simply draws numbers onto button
        }

        /// <summary>
        /// Checks if the given number is contained in the square.
        /// </summary>
        /// <param name="num">number to check</param>
        /// <returns>true if the number is in square, else false</returns>
        public override bool HasNumber(int num)
        {
            return this.numbers.Contains(num);
        }

        /// <summary>
        /// Tests to see if square contains one number, no more, no less.
        /// </summary>
        /// <returns>true if there is only one number.</returns>
        public override bool IsSingleNumber()
        {
            return (this.numbers.Count == 1);
        }

        /// <summary>
        /// If there is only one number in square, this will return it.
        /// </summary>
        /// <returns>single number of square, else 0</returns>
        public override int GetSingleNumber()
        {
            if (IsSingleNumber())
            {
                return (int)this.numbers[0];
            }
            else
            {
                return 0;
            }
        }

        /// <summary>
        /// Adds positive numbers to square (avoids duplicates), 
        /// Removes absolute value of negative numbers (if it is on button), 
        /// and removes all numbers when num = 0. A negative
        /// value should simply repaint the button.
        /// </summary>
        /// <param name="num">number to modfy to square</param>
        public void AddNumber(int num)
        {
            // Add number to square if it isn't already in the list.
            if ((num > 0) && !HasNumber(num))
            {
                this.numbers.Add(num);
            }
            else if (num == 0)// Remove all numbers.
            {
                this.numbers.RemoveRange(0, numbers.Count);
            }
            // Remove Number if it is in square
            else if ((num < 0) && HasNumber(System.Math.Abs(num)))  
            {
                this.numbers.Remove(System.Math.Abs(num));
            }
            //else if num<0 and number does NOT exist, 
            //do nothing just repaint the button(below):

            // Rewrite button text so numbers are in order and sized properly:
            if (numbers.Count > 0)
            {
                this.numbers.Sort();//Sort list so numbers are in order on square.
                this.button.Text = this.numbers[0].ToString();//Add first number

                // Add additional numbers as needed (comma separated)
                for (int i = 1; i < this.numbers.Count; i++)   
                {
                    this.button.Text += this.numbers[i].ToString();
                }

                // This simply ensures that the numbers will fit on the 
                // button by changing font size:

                if (numbers.Count > 1) // When 1-4 numbers are on square:
                {
                    this.button.Font = 
                        new System.Drawing.Font("Microsoft Sans Serif", 8F, 
                            System.Drawing.FontStyle.Regular, 
                            System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                }
                else // when 0-1 numbers are on square:
                {
                    this.button.Font = 
                        new System.Drawing.Font("Microsoft Sans Serif", 16F, 
                            System.Drawing.FontStyle.Regular, 
                            System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                }
            }
            else // If no numbers are in the list anymore, clear the button text.
            {
                this.button.Text = "";
            }

            if (checkMode)
            {
                this.ResetCheckMode();
            }
        }

        /// <summary>
        /// Remove number from square.
        /// </summary>
        /// <param name="num">number to remove from square</param>
        public void RemoveNumber(int num)
        {
            AddNumber(0 - num); // Negative number removes number from list.
        }

        /// <summary>
        /// Clears all numbers from the square.
        /// </summary>
        public void Clear()
        {
            // AddNumber(0) removes all numbers fro button.
            AddNumber(0);
        }

        /// <summary>
        /// Checks if the square has an error (i.e. correct answer is not in 
        /// square).
        /// </summary>
        /// <param name="finished">whether or not the square should be
        /// complete at this point.</param>
        /// <returns>false for correct answer, true for error.</returns>
        public override bool CheckAnswer(bool finished)
        {
            
            if (finished == true) // should only have one number in square
            {
                if (this.GetSingleNumber() == this.correctAnswer)
                {
                    return false;
                }
                return true;
            }
            else // more than one number in square
            {
                return !HasNumber(this.correctAnswer);
            }
        }

        /// <summary>
        /// Checks this square against the given square for numbers comparison, 
        /// and errors the squares if any numbers in common are found.
        /// </summary>
        /// <param name="square"></param>
        /// <returns>true for error, false for</returns>
        public override bool Check(Square square)
        {
            if (square.IsSingleNumber())
            {
                foreach (int num in this.numbers)
                {
                    if (num == square.GetSingleNumber())
                    {
                        this.Error();
                        return true;
                    }
                }
            }
            return false;
        }

        /// <summary>
        /// This method will highlight the square with a red color
        /// to show user that at least one of the square's numbers 
        /// are in error.
        /// </summary>
        public override void Error()
        {
            checkMode = true;
            // express error somehow
            // i.e. change colour of square.
            this.button.BackColor = System.Drawing.Color.Red;
        }

        /// <summary>
        /// Set the currentSquare button to the correct answer
        /// </summary>
        public override void ShowAnswer()
        {
            this.Clear();
            this.AddNumber(this.correctAnswer);
        }

        /// <summary>
        /// Resets button to an unselected state.
        /// </summary>
        public void Unselect()
        {
            base.InitButton();
        }

        /// <summary>
        /// Resets checkmode and un-errors the button.
        /// </summary>
        public void ResetCheckMode()
        {
            checkMode = false;
            base.InitButton();
        }

        /// <summary>
        /// Event handler for when a square button in the grid is clicked.
        /// ButtonClick(sender, args) sets that square as the currentSquare.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        public void ButtonClick(object sender, EventArgs args)
        {
            this.puzzle.SetCurrent(this);
            this.Button.BackColor = System.Drawing.Color.LightBlue;
        }
    }
}
