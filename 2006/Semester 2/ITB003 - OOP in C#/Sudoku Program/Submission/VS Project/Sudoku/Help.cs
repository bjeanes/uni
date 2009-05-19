using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Sudoku
{
    public partial class Help : Form
    {
        private int initialTab;
        public Help(int initialTab)
        {
            this.initialTab = initialTab;
            InitializeComponent();
        }

        private void Help_Load(object sender, EventArgs e)
        {
            this.helpTabs.SelectTab(this.initialTab);
        }

        private void sudokuLink_LinkClicked(object sender, 
                                                LinkLabelLinkClickedEventArgs e)
        {
            System.Diagnostics.Process.Start(
                "IExplore", 
                "http://en.wikipedia.org/wiki/Sudoku#Solution_methods");
            this.sudokuLink.LinkVisited = true;
        }
    }
}