using System;
//using System.Collections.Generic;
using System.Text;

namespace Sudoku
{
    [Serializable]
    class FixedSquare : Square
    {
        /// <summary>
        /// This does nothing but pass on the parameters to the base
        /// constructor.
        /// </summary>
        /// <param name="puzzle">
        /// puzzle which the square is a member of</param>
        /// <param name="row">
        /// row which square is in</param>
        /// <param name="column">
        /// column which square is in</param>
        /// <param name="answer">
        /// the correct answer that belongs to this square
        /// </param>
        public FixedSquare(Puzzle puzzle, int row, int column, int answer) : 
                                                  base(puzzle,row,column,answer)
        {
        }

        /// <summary>
        /// Performs some preliminary button configuration settings such as
        /// colour, text, and enabled state.
        /// </summary>
        public override void InitButton()
        {
            base.InitButton();
            this.button.Text = base.correctAnswer.ToString();
            //this.button.FlatAppearance.BorderSize = 2;
            this.button.Font = 
                new System.Drawing.Font("Microsoft Sans Serif", 10.00F, 
                            ((System.Drawing.FontStyle)((
                            System.Drawing.FontStyle.Bold | 
                            System.Drawing.FontStyle.Underline))), 
                            System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button.Enabled = false;
        }

        /// <summary>
        /// Checks if the provided number is in the square. In the case of
        /// FixedSquare, it checks if the number is the correct answer
        /// </summary>
        /// <param name="num"></param>
        /// <returns>true if given number is in the square</returns>
        public override bool HasNumber(int num)
        {
            return (num == this.correctAnswer);
        }

        /// <summary>
        /// FixedSquare is always a single numbered square,
        /// so always return true.
        /// </summary>
        /// <returns>true</returns>
        public override bool IsSingleNumber()
        {
            // shouldn't this always return true?
            return true;
        }

        /// <summary>
        /// Just returns the correct answer.
        /// </summary>
        /// <returns></returns>
        public override int GetSingleNumber()
        {
            // just return correctAnswer, 
            // because that's all that can ever be in FixedSquare
            return this.correctAnswer;
        }

        /// <summary>
        /// Always returns false because answer is always right.
        /// </summary>
        /// <param name="finished"></param>
        /// <returns>true for error</returns>
        public override bool CheckAnswer(bool finished)
        {
            // should always return false, because there will be no errors.
            return false;
        }

        /// <summary>
        /// This doesn't have to do anything because UserSquare can handle all
        /// checking.
        /// </summary>
        /// <param name="square"></param>
        /// <returns>true for error</returns>
        public override bool Check(Square square)
        {
            return false;
        }

        /// <summary>
        /// Does nothing except exist to make Group class easier
        /// </summary>
        public override void Error()
        {
        }

        /// <summary>
        /// Does nothing because correct answer is already shown on
        /// a FixedSquare
        /// </summary>
        public override void ShowAnswer()
        {
        }
    }
}
