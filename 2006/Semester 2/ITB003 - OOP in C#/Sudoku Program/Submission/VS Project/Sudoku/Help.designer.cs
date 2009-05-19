namespace Sudoku
{
    partial class Help
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Help));
            this.helpTabs = new System.Windows.Forms.TabControl();
            this.tabHowToPlay = new System.Windows.Forms.TabPage();
            this.label1 = new System.Windows.Forms.Label();
            this.tabSolvingTips = new System.Windows.Forms.TabPage();
            this.sudokuLink = new System.Windows.Forms.LinkLabel();
            this.lblSolvingTips = new System.Windows.Forms.Label();
            this.tabAbout = new System.Windows.Forms.TabPage();
            this.tableLayoutPanel = new System.Windows.Forms.TableLayoutPanel();
            this.labelProductName = new System.Windows.Forms.Label();
            this.labelVersion = new System.Windows.Forms.Label();
            this.labelCopyright = new System.Windows.Forms.Label();
            this.labelCompanyName = new System.Windows.Forms.Label();
            this.textBoxDescription = new System.Windows.Forms.TextBox();
            this.helpTabs.SuspendLayout();
            this.tabHowToPlay.SuspendLayout();
            this.tabSolvingTips.SuspendLayout();
            this.tabAbout.SuspendLayout();
            this.tableLayoutPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // helpTabs
            // 
            this.helpTabs.Controls.Add(this.tabHowToPlay);
            this.helpTabs.Controls.Add(this.tabSolvingTips);
            this.helpTabs.Controls.Add(this.tabAbout);
            this.helpTabs.Location = new System.Drawing.Point(0, 0);
            this.helpTabs.Name = "helpTabs";
            this.helpTabs.SelectedIndex = 0;
            this.helpTabs.Size = new System.Drawing.Size(371, 352);
            this.helpTabs.TabIndex = 0;
            // 
            // tabHowToPlay
            // 
            this.tabHowToPlay.Controls.Add(this.label1);
            this.tabHowToPlay.Location = new System.Drawing.Point(4, 22);
            this.tabHowToPlay.Name = "tabHowToPlay";
            this.tabHowToPlay.Padding = new System.Windows.Forms.Padding(3);
            this.tabHowToPlay.Size = new System.Drawing.Size(363, 326);
            this.tabHowToPlay.TabIndex = 0;
            this.tabHowToPlay.Text = "How To Play Sudoku";
            this.tabHowToPlay.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(7, 8);
            this.label1.MaximumSize = new System.Drawing.Size(350, 350);
            this.label1.MinimumSize = new System.Drawing.Size(350, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(350, 299);
            this.label1.TabIndex = 0;
            this.label1.Text = resources.GetString("label1.Text");
            // 
            // tabSolvingTips
            // 
            this.tabSolvingTips.Controls.Add(this.sudokuLink);
            this.tabSolvingTips.Controls.Add(this.lblSolvingTips);
            this.tabSolvingTips.Location = new System.Drawing.Point(4, 22);
            this.tabSolvingTips.Name = "tabSolvingTips";
            this.tabSolvingTips.Padding = new System.Windows.Forms.Padding(3);
            this.tabSolvingTips.Size = new System.Drawing.Size(363, 326);
            this.tabSolvingTips.TabIndex = 1;
            this.tabSolvingTips.Text = "Solving Tips";
            this.tabSolvingTips.UseVisualStyleBackColor = true;
            // 
            // sudokuLink
            // 
            this.sudokuLink.AutoSize = true;
            this.sudokuLink.Cursor = System.Windows.Forms.Cursors.Hand;
            this.sudokuLink.LinkArea = new System.Windows.Forms.LinkArea(28, 26);
            this.sudokuLink.Location = new System.Drawing.Point(7, 150);
            this.sudokuLink.Name = "sudokuLink";
            this.sudokuLink.Size = new System.Drawing.Size(284, 17);
            this.sudokuLink.TabIndex = 5;
            this.sudokuLink.TabStop = true;
            this.sudokuLink.Text = "For more information, visit Wikipedia\'s page on Sudoku.";
            this.sudokuLink.UseCompatibleTextRendering = true;
            // 
            // lblSolvingTips
            // 
            this.lblSolvingTips.AutoEllipsis = true;
            this.lblSolvingTips.AutoSize = true;
            this.lblSolvingTips.Location = new System.Drawing.Point(5, 8);
            this.lblSolvingTips.MaximumSize = new System.Drawing.Size(355, 355);
            this.lblSolvingTips.Name = "lblSolvingTips";
            this.lblSolvingTips.Size = new System.Drawing.Size(354, 130);
            this.lblSolvingTips.TabIndex = 4;
            this.lblSolvingTips.Text = resources.GetString("lblSolvingTips.Text");
            // 
            // tabAbout
            // 
            this.tabAbout.Controls.Add(this.tableLayoutPanel);
            this.tabAbout.Location = new System.Drawing.Point(4, 22);
            this.tabAbout.Name = "tabAbout";
            this.tabAbout.Padding = new System.Windows.Forms.Padding(3);
            this.tabAbout.Size = new System.Drawing.Size(363, 326);
            this.tabAbout.TabIndex = 2;
            this.tabAbout.Text = "About Sudoku";
            this.tabAbout.UseVisualStyleBackColor = true;
            // 
            // tableLayoutPanel
            // 
            this.tableLayoutPanel.ColumnCount = 1;
            this.tableLayoutPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel.Controls.Add(this.labelProductName, 0, 0);
            this.tableLayoutPanel.Controls.Add(this.labelVersion, 0, 1);
            this.tableLayoutPanel.Controls.Add(this.labelCopyright, 0, 2);
            this.tableLayoutPanel.Controls.Add(this.labelCompanyName, 0, 3);
            this.tableLayoutPanel.Controls.Add(this.textBoxDescription, 0, 4);
            this.tableLayoutPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel.Location = new System.Drawing.Point(3, 3);
            this.tableLayoutPanel.Name = "tableLayoutPanel";
            this.tableLayoutPanel.RowCount = 5;
            this.tableLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 4.746835F));
            this.tableLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 5.063291F));
            this.tableLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 4.43038F));
            this.tableLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.39241F));
            this.tableLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 74.36709F));
            this.tableLayoutPanel.Size = new System.Drawing.Size(357, 320);
            this.tableLayoutPanel.TabIndex = 1;
            // 
            // labelProductName
            // 
            this.labelProductName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.labelProductName.Location = new System.Drawing.Point(6, 0);
            this.labelProductName.Margin = new System.Windows.Forms.Padding(6, 0, 3, 0);
            this.labelProductName.MaximumSize = new System.Drawing.Size(0, 17);
            this.labelProductName.Name = "labelProductName";
            this.labelProductName.Size = new System.Drawing.Size(348, 15);
            this.labelProductName.TabIndex = 19;
            this.labelProductName.Text = "Bo\'s Sudoku Game";
            this.labelProductName.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // labelVersion
            // 
            this.labelVersion.Dock = System.Windows.Forms.DockStyle.Fill;
            this.labelVersion.Location = new System.Drawing.Point(6, 15);
            this.labelVersion.Margin = new System.Windows.Forms.Padding(6, 0, 3, 0);
            this.labelVersion.MaximumSize = new System.Drawing.Size(0, 17);
            this.labelVersion.Name = "labelVersion";
            this.labelVersion.Size = new System.Drawing.Size(348, 16);
            this.labelVersion.TabIndex = 0;
            this.labelVersion.Text = "Version 1.0";
            this.labelVersion.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // labelCopyright
            // 
            this.labelCopyright.Dock = System.Windows.Forms.DockStyle.Fill;
            this.labelCopyright.Location = new System.Drawing.Point(6, 31);
            this.labelCopyright.Margin = new System.Windows.Forms.Padding(6, 0, 3, 0);
            this.labelCopyright.MaximumSize = new System.Drawing.Size(0, 17);
            this.labelCopyright.Name = "labelCopyright";
            this.labelCopyright.Size = new System.Drawing.Size(348, 14);
            this.labelCopyright.TabIndex = 21;
            this.labelCopyright.Text = "Copyright © Bodaniel Jeanes, 2006";
            this.labelCopyright.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // labelCompanyName
            // 
            this.labelCompanyName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.labelCompanyName.Location = new System.Drawing.Point(6, 45);
            this.labelCompanyName.Margin = new System.Windows.Forms.Padding(6, 0, 3, 0);
            this.labelCompanyName.MaximumSize = new System.Drawing.Size(0, 17);
            this.labelCompanyName.Name = "labelCompanyName";
            this.labelCompanyName.Size = new System.Drawing.Size(348, 17);
            this.labelCompanyName.TabIndex = 22;
            this.labelCompanyName.Text = "bjeanes.com";
            this.labelCompanyName.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // textBoxDescription
            // 
            this.textBoxDescription.Dock = System.Windows.Forms.DockStyle.Fill;
            this.textBoxDescription.Location = new System.Drawing.Point(3, 84);
            this.textBoxDescription.Multiline = true;
            this.textBoxDescription.Name = "textBoxDescription";
            this.textBoxDescription.ReadOnly = true;
            this.textBoxDescription.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.textBoxDescription.Size = new System.Drawing.Size(351, 233);
            this.textBoxDescription.TabIndex = 23;
            this.textBoxDescription.TabStop = false;
            this.textBoxDescription.Text = resources.GetString("textBoxDescription.Text");
            // 
            // Help
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(367, 348);
            this.Controls.Add(this.helpTabs);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Help";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Help";
            this.Load += new System.EventHandler(this.Help_Load);
            this.helpTabs.ResumeLayout(false);
            this.tabHowToPlay.ResumeLayout(false);
            this.tabHowToPlay.PerformLayout();
            this.tabSolvingTips.ResumeLayout(false);
            this.tabSolvingTips.PerformLayout();
            this.tabAbout.ResumeLayout(false);
            this.tableLayoutPanel.ResumeLayout(false);
            this.tableLayoutPanel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        public System.Windows.Forms.TabControl helpTabs;
        private System.Windows.Forms.TabPage tabHowToPlay;
        private System.Windows.Forms.TabPage tabSolvingTips;
        private System.Windows.Forms.TabPage tabAbout;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel;
        private System.Windows.Forms.Label labelProductName;
        private System.Windows.Forms.Label labelVersion;
        private System.Windows.Forms.Label labelCopyright;
        private System.Windows.Forms.Label labelCompanyName;
        private System.Windows.Forms.TextBox textBoxDescription;
        private System.Windows.Forms.LinkLabel sudokuLink;
        private System.Windows.Forms.Label lblSolvingTips;
        private System.Windows.Forms.Label label1;
    }
}