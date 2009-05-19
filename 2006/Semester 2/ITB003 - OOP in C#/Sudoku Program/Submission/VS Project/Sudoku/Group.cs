using System;
//using System.Collections.Generic;
using System.Text;

namespace Sudoku
{
    [Serializable]
    class Group
    {
        /// <summary>
        /// Array of all the squares in the group.
        /// </summary>
        private Square[] squares = new Square[9];

        /// <summary>
        /// numSquares keeps track of how many squares are in the group.
        /// </summary>
        private int numSquares;

        /// <summary>
        /// Does nothing, haha!
        /// </summary>
        public Group()
        {
        }

        /// <summary>
        /// Adds a square to the group.
        /// </summary>
        /// <param name="square">square to add to group.</param>
        public void AddSquare(Square square)
        {
            this.squares[numSquares] = square;
            this.numSquares++;
        }

        /// <summary>
        /// Checks each square against each other in group to make sure
        /// there are no duplicates. It first checks that all squares in group
        /// consist of a single number.
        /// </summary>
        /// <returns>true if error is found.</returns>
        public bool Check()
        {
            // Loop through all group elements:
            for (int i = 0; i < 9; i++)
            {
                for (int j = 0; j < 9; j++)
                {
                    if(j != i)
                    {
                        // compare this square (i) against others in group (j)
                        this.squares[i].Check(squares[j]);
                    }
                }
            }

            // If it makes it this far, then everything in the group is OK:
            return false;
        }
    }
}
