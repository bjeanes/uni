namespace Sudoku
{
    partial class Sudoku
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Sudoku));
            this.btnClearSquare = new System.Windows.Forms.Button();
            this.btnClearNumber = new System.Windows.Forms.Button();
            this.btnCheckValues = new System.Windows.Forms.Button();
            this.btnCheckFinished = new System.Windows.Forms.Button();
            this.btnHint = new System.Windows.Forms.Button();
            this.btnShowSolution = new System.Windows.Forms.Button();
            this.btnNum3 = new System.Windows.Forms.Button();
            this.btnNum6 = new System.Windows.Forms.Button();
            this.btnNum7 = new System.Windows.Forms.Button();
            this.btnNum8 = new System.Windows.Forms.Button();
            this.btnNum9 = new System.Windows.Forms.Button();
            this.grpBoxPuzzle = new System.Windows.Forms.GroupBox();
            this.LblDifficultyLevel = new System.Windows.Forms.Label();
            this.mainMenu = new System.Windows.Forms.MenuStrip();
            this.puzzleToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.newToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.loadToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.saveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.addToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.addMorePuzzlesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.levelToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.easyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mediumToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.hardToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.geniusToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.quitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.howToPlaySudokuToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.solvingTipsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.aboutSudokuToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.shortcutsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem3 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem4 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem5 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem6 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem7 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem8 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem9 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem10 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.clearButtonToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.subtractNumberToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.btnNum1 = new System.Windows.Forms.Button();
            this.btnNum2 = new System.Windows.Forms.Button();
            this.btnNum4 = new System.Windows.Forms.Button();
            this.btnNum5 = new System.Windows.Forms.Button();
            this.statusMain = new System.Windows.Forms.StatusStrip();
            this.lblStatusMain = new System.Windows.Forms.ToolStripStatusLabel();
            this.openAddNewPuzzles = new System.Windows.Forms.OpenFileDialog();
            this.picDifficultyLevel = new System.Windows.Forms.PictureBox();
            this.mainMenu.SuspendLayout();
            this.statusMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picDifficultyLevel)).BeginInit();
            this.SuspendLayout();
            // 
            // btnClearSquare
            // 
            this.btnClearSquare.Enabled = false;
            this.btnClearSquare.Location = new System.Drawing.Point(465, 292);
            this.btnClearSquare.Name = "btnClearSquare";
            this.btnClearSquare.Size = new System.Drawing.Size(111, 23);
            this.btnClearSquare.TabIndex = 0;
            this.btnClearSquare.Text = "Clear Square (&/)";
            this.btnClearSquare.UseVisualStyleBackColor = true;
            this.btnClearSquare.Click += new System.EventHandler(this.btnClearSquare_Click);
            // 
            // btnClearNumber
            // 
            this.btnClearNumber.Enabled = false;
            this.btnClearNumber.Location = new System.Drawing.Point(465, 321);
            this.btnClearNumber.Name = "btnClearNumber";
            this.btnClearNumber.Size = new System.Drawing.Size(111, 23);
            this.btnClearNumber.TabIndex = 0;
            this.btnClearNumber.Tag = "";
            this.btnClearNumber.Text = "Clear Number (&-)";
            this.btnClearNumber.UseVisualStyleBackColor = true;
            this.btnClearNumber.Click += new System.EventHandler(this.btnClearNumber_Click);
            // 
            // btnCheckValues
            // 
            this.btnCheckValues.Enabled = false;
            this.btnCheckValues.Location = new System.Drawing.Point(465, 350);
            this.btnCheckValues.Name = "btnCheckValues";
            this.btnCheckValues.Size = new System.Drawing.Size(111, 23);
            this.btnCheckValues.TabIndex = 0;
            this.btnCheckValues.Text = "Check Values (&V)";
            this.btnCheckValues.UseVisualStyleBackColor = true;
            this.btnCheckValues.Click += new System.EventHandler(this.btnCheckValues_Click);
            // 
            // btnCheckFinished
            // 
            this.btnCheckFinished.Enabled = false;
            this.btnCheckFinished.Location = new System.Drawing.Point(465, 379);
            this.btnCheckFinished.Name = "btnCheckFinished";
            this.btnCheckFinished.Size = new System.Drawing.Size(111, 23);
            this.btnCheckFinished.TabIndex = 0;
            this.btnCheckFinished.Text = "Check Finished (&F)";
            this.btnCheckFinished.UseVisualStyleBackColor = true;
            this.btnCheckFinished.Click += new System.EventHandler(this.btnCheckFinished_Click);
            // 
            // btnHint
            // 
            this.btnHint.Enabled = false;
            this.btnHint.Location = new System.Drawing.Point(465, 408);
            this.btnHint.Name = "btnHint";
            this.btnHint.Size = new System.Drawing.Size(111, 23);
            this.btnHint.TabIndex = 0;
            this.btnHint.Text = "Hint (&H)";
            this.btnHint.UseVisualStyleBackColor = true;
            this.btnHint.Click += new System.EventHandler(this.btnHint_Click);
            // 
            // btnShowSolution
            // 
            this.btnShowSolution.Enabled = false;
            this.btnShowSolution.Location = new System.Drawing.Point(465, 437);
            this.btnShowSolution.Name = "btnShowSolution";
            this.btnShowSolution.Size = new System.Drawing.Size(111, 23);
            this.btnShowSolution.TabIndex = 0;
            this.btnShowSolution.Text = "Show Solution (&O)";
            this.btnShowSolution.UseVisualStyleBackColor = true;
            this.btnShowSolution.Click += new System.EventHandler(this.btnShowSolution_Click);
            // 
            // btnNum3
            // 
            this.btnNum3.Enabled = false;
            this.btnNum3.Location = new System.Drawing.Point(543, 158);
            this.btnNum3.Name = "btnNum3";
            this.btnNum3.Size = new System.Drawing.Size(33, 30);
            this.btnNum3.TabIndex = 1;
            this.btnNum3.Text = "&3";
            this.btnNum3.UseVisualStyleBackColor = true;
            this.btnNum3.Click += new System.EventHandler(this.btnNum_Click);
            // 
            // btnNum6
            // 
            this.btnNum6.Enabled = false;
            this.btnNum6.Location = new System.Drawing.Point(543, 194);
            this.btnNum6.Name = "btnNum6";
            this.btnNum6.Size = new System.Drawing.Size(33, 30);
            this.btnNum6.TabIndex = 1;
            this.btnNum6.Text = "&6";
            this.btnNum6.UseVisualStyleBackColor = true;
            this.btnNum6.Click += new System.EventHandler(this.btnNum_Click);
            // 
            // btnNum7
            // 
            this.btnNum7.Enabled = false;
            this.btnNum7.Location = new System.Drawing.Point(465, 230);
            this.btnNum7.Name = "btnNum7";
            this.btnNum7.Size = new System.Drawing.Size(33, 30);
            this.btnNum7.TabIndex = 1;
            this.btnNum7.Tag = "";
            this.btnNum7.Text = "&7";
            this.btnNum7.UseVisualStyleBackColor = true;
            this.btnNum7.Click += new System.EventHandler(this.btnNum_Click);
            // 
            // btnNum8
            // 
            this.btnNum8.Enabled = false;
            this.btnNum8.Location = new System.Drawing.Point(504, 230);
            this.btnNum8.Name = "btnNum8";
            this.btnNum8.Size = new System.Drawing.Size(33, 30);
            this.btnNum8.TabIndex = 1;
            this.btnNum8.Tag = "";
            this.btnNum8.Text = "&8";
            this.btnNum8.UseVisualStyleBackColor = true;
            this.btnNum8.Click += new System.EventHandler(this.btnNum_Click);
            // 
            // btnNum9
            // 
            this.btnNum9.Enabled = false;
            this.btnNum9.Location = new System.Drawing.Point(543, 230);
            this.btnNum9.Name = "btnNum9";
            this.btnNum9.Size = new System.Drawing.Size(33, 30);
            this.btnNum9.TabIndex = 1;
            this.btnNum9.Tag = "";
            this.btnNum9.Text = "&9";
            this.btnNum9.UseVisualStyleBackColor = true;
            this.btnNum9.Click += new System.EventHandler(this.btnNum_Click);
            // 
            // grpBoxPuzzle
            // 
            this.grpBoxPuzzle.BackColor = System.Drawing.SystemColors.ControlLight;
            this.grpBoxPuzzle.Location = new System.Drawing.Point(12, 33);
            this.grpBoxPuzzle.Name = "grpBoxPuzzle";
            this.grpBoxPuzzle.Size = new System.Drawing.Size(440, 443);
            this.grpBoxPuzzle.TabIndex = 2;
            this.grpBoxPuzzle.TabStop = false;
            this.grpBoxPuzzle.Text = "Puzzle";
            // 
            // LblDifficultyLevel
            // 
            this.LblDifficultyLevel.AutoSize = true;
            this.LblDifficultyLevel.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold);
            this.LblDifficultyLevel.Location = new System.Drawing.Point(473, 49);
            this.LblDifficultyLevel.Name = "LblDifficultyLevel";
            this.LblDifficultyLevel.Size = new System.Drawing.Size(96, 13);
            this.LblDifficultyLevel.TabIndex = 3;
            this.LblDifficultyLevel.Text = "Difficulty Level:";
            this.LblDifficultyLevel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // mainMenu
            // 
            this.mainMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.puzzleToolStripMenuItem,
            this.addToolStripMenuItem,
            this.levelToolStripMenuItem,
            this.quitToolStripMenuItem,
            this.helpToolStripMenuItem,
            this.shortcutsToolStripMenuItem});
            this.mainMenu.Location = new System.Drawing.Point(0, 0);
            this.mainMenu.Name = "mainMenu";
            this.mainMenu.Padding = new System.Windows.Forms.Padding(0);
            this.mainMenu.Size = new System.Drawing.Size(589, 24);
            this.mainMenu.TabIndex = 4;
            // 
            // puzzleToolStripMenuItem
            // 
            this.puzzleToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.newToolStripMenuItem,
            this.loadToolStripMenuItem,
            this.saveToolStripMenuItem});
            this.puzzleToolStripMenuItem.Name = "puzzleToolStripMenuItem";
            this.puzzleToolStripMenuItem.Size = new System.Drawing.Size(49, 24);
            this.puzzleToolStripMenuItem.Text = "&Puzzle";
            // 
            // newToolStripMenuItem
            // 
            this.newToolStripMenuItem.Image = global::Sudoku.Properties.Resources._new;
            this.newToolStripMenuItem.Name = "newToolStripMenuItem";
            this.newToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.N)));
            this.newToolStripMenuItem.Size = new System.Drawing.Size(211, 22);
            this.newToolStripMenuItem.Text = "&New Game";
            this.newToolStripMenuItem.Click += new System.EventHandler(this.newToolStripMenuItem_Click);
            // 
            // loadToolStripMenuItem
            // 
            this.loadToolStripMenuItem.Image = global::Sudoku.Properties.Resources.open;
            this.loadToolStripMenuItem.Name = "loadToolStripMenuItem";
            this.loadToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.O)));
            this.loadToolStripMenuItem.Size = new System.Drawing.Size(211, 22);
            this.loadToolStripMenuItem.Text = "L&oad Saved Game";
            this.loadToolStripMenuItem.Click += new System.EventHandler(this.loadToolStripMenuItem_Click);
            // 
            // saveToolStripMenuItem
            // 
            this.saveToolStripMenuItem.Image = global::Sudoku.Properties.Resources.save;
            this.saveToolStripMenuItem.Name = "saveToolStripMenuItem";
            this.saveToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.S)));
            this.saveToolStripMenuItem.Size = new System.Drawing.Size(211, 22);
            this.saveToolStripMenuItem.Text = "&Save Game";
            this.saveToolStripMenuItem.Click += new System.EventHandler(this.saveToolStripMenuItem_Click);
            // 
            // addToolStripMenuItem
            // 
            this.addToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.addMorePuzzlesToolStripMenuItem});
            this.addToolStripMenuItem.Name = "addToolStripMenuItem";
            this.addToolStripMenuItem.Size = new System.Drawing.Size(38, 24);
            this.addToolStripMenuItem.Text = "&Add";
            // 
            // addMorePuzzlesToolStripMenuItem
            // 
            this.addMorePuzzlesToolStripMenuItem.Name = "addMorePuzzlesToolStripMenuItem";
            this.addMorePuzzlesToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)(((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Shift)
                        | System.Windows.Forms.Keys.A)));
            this.addMorePuzzlesToolStripMenuItem.Size = new System.Drawing.Size(238, 22);
            this.addMorePuzzlesToolStripMenuItem.Text = "&Add More Puzzles";
            this.addMorePuzzlesToolStripMenuItem.Click += new System.EventHandler(this.addMorePuzzlesToolStripMenuItem_Click);
            // 
            // levelToolStripMenuItem
            // 
            this.levelToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.easyToolStripMenuItem,
            this.mediumToolStripMenuItem,
            this.hardToolStripMenuItem,
            this.geniusToolStripMenuItem});
            this.levelToolStripMenuItem.Name = "levelToolStripMenuItem";
            this.levelToolStripMenuItem.ShortcutKeyDisplayString = "";
            this.levelToolStripMenuItem.Size = new System.Drawing.Size(44, 24);
            this.levelToolStripMenuItem.Text = "&Level";
            // 
            // easyToolStripMenuItem
            // 
            this.easyToolStripMenuItem.Checked = true;
            this.easyToolStripMenuItem.CheckState = System.Windows.Forms.CheckState.Checked;
            this.easyToolStripMenuItem.Image = global::Sudoku.Properties.Resources.difficulty_easy;
            this.easyToolStripMenuItem.Name = "easyToolStripMenuItem";
            this.easyToolStripMenuItem.ShortcutKeyDisplayString = "";
            this.easyToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)(((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Shift)
                        | System.Windows.Forms.Keys.D1)));
            this.easyToolStripMenuItem.Size = new System.Drawing.Size(189, 22);
            this.easyToolStripMenuItem.Text = "&Easy";
            this.easyToolStripMenuItem.Click += new System.EventHandler(this.DifficultyToolStripMenuItem_Click);
            // 
            // mediumToolStripMenuItem
            // 
            this.mediumToolStripMenuItem.Image = global::Sudoku.Properties.Resources.difficulty_med;
            this.mediumToolStripMenuItem.Name = "mediumToolStripMenuItem";
            this.mediumToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)(((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Shift)
                        | System.Windows.Forms.Keys.D2)));
            this.mediumToolStripMenuItem.Size = new System.Drawing.Size(189, 22);
            this.mediumToolStripMenuItem.Text = "&Medium";
            this.mediumToolStripMenuItem.Click += new System.EventHandler(this.DifficultyToolStripMenuItem_Click);
            // 
            // hardToolStripMenuItem
            // 
            this.hardToolStripMenuItem.Image = global::Sudoku.Properties.Resources.difficulty_hard;
            this.hardToolStripMenuItem.Name = "hardToolStripMenuItem";
            this.hardToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)(((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Shift)
                        | System.Windows.Forms.Keys.D3)));
            this.hardToolStripMenuItem.Size = new System.Drawing.Size(189, 22);
            this.hardToolStripMenuItem.Text = "&Hard";
            this.hardToolStripMenuItem.Click += new System.EventHandler(this.DifficultyToolStripMenuItem_Click);
            // 
            // geniusToolStripMenuItem
            // 
            this.geniusToolStripMenuItem.Image = global::Sudoku.Properties.Resources.difficulty_genius;
            this.geniusToolStripMenuItem.Name = "geniusToolStripMenuItem";
            this.geniusToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)(((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Shift)
                        | System.Windows.Forms.Keys.D4)));
            this.geniusToolStripMenuItem.Size = new System.Drawing.Size(189, 22);
            this.geniusToolStripMenuItem.Text = "&Genius";
            this.geniusToolStripMenuItem.Click += new System.EventHandler(this.DifficultyToolStripMenuItem_Click);
            // 
            // quitToolStripMenuItem
            // 
            this.quitToolStripMenuItem.Name = "quitToolStripMenuItem";
            this.quitToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.Q)));
            this.quitToolStripMenuItem.Size = new System.Drawing.Size(39, 24);
            this.quitToolStripMenuItem.Text = "&Quit";
            this.quitToolStripMenuItem.Click += new System.EventHandler(this.quitToolStripMenuItem_Click);
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.howToPlaySudokuToolStripMenuItem,
            this.solvingTipsToolStripMenuItem,
            this.toolStripSeparator1,
            this.aboutSudokuToolStripMenuItem});
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(40, 24);
            this.helpToolStripMenuItem.Text = "&Help";
            // 
            // howToPlaySudokuToolStripMenuItem
            // 
            this.howToPlaySudokuToolStripMenuItem.Name = "howToPlaySudokuToolStripMenuItem";
            this.howToPlaySudokuToolStripMenuItem.ShortcutKeys = System.Windows.Forms.Keys.F1;
            this.howToPlaySudokuToolStripMenuItem.Size = new System.Drawing.Size(201, 22);
            this.howToPlaySudokuToolStripMenuItem.Text = "&How To Play Sudoku";
            this.howToPlaySudokuToolStripMenuItem.Click += new System.EventHandler(this.howToPlaySudokuToolStripMenuItem_Click);
            // 
            // solvingTipsToolStripMenuItem
            // 
            this.solvingTipsToolStripMenuItem.Name = "solvingTipsToolStripMenuItem";
            this.solvingTipsToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Shift | System.Windows.Forms.Keys.F1)));
            this.solvingTipsToolStripMenuItem.Size = new System.Drawing.Size(201, 22);
            this.solvingTipsToolStripMenuItem.Text = "&Solving Tips";
            this.solvingTipsToolStripMenuItem.Click += new System.EventHandler(this.solvingTipsToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(198, 6);
            // 
            // aboutSudokuToolStripMenuItem
            // 
            this.aboutSudokuToolStripMenuItem.Name = "aboutSudokuToolStripMenuItem";
            this.aboutSudokuToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.F1)));
            this.aboutSudokuToolStripMenuItem.Size = new System.Drawing.Size(201, 22);
            this.aboutSudokuToolStripMenuItem.Text = "&About Sudoku";
            this.aboutSudokuToolStripMenuItem.Click += new System.EventHandler(this.aboutSudokuToolStripMenuItem_Click);
            // 
            // shortcutsToolStripMenuItem
            // 
            this.shortcutsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem2,
            this.toolStripMenuItem3,
            this.toolStripMenuItem4,
            this.toolStripMenuItem5,
            this.toolStripMenuItem6,
            this.toolStripMenuItem7,
            this.toolStripMenuItem8,
            this.toolStripMenuItem9,
            this.toolStripMenuItem10,
            this.toolStripSeparator2,
            this.clearButtonToolStripMenuItem,
            this.subtractNumberToolStripMenuItem});
            this.shortcutsToolStripMenuItem.Enabled = false;
            this.shortcutsToolStripMenuItem.Name = "shortcutsToolStripMenuItem";
            this.shortcutsToolStripMenuItem.Size = new System.Drawing.Size(64, 24);
            this.shortcutsToolStripMenuItem.Text = "shortcuts";
            this.shortcutsToolStripMenuItem.Visible = false;
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.D1)));
            this.toolStripMenuItem2.Size = new System.Drawing.Size(198, 22);
            this.toolStripMenuItem2.Text = "1";
            this.toolStripMenuItem2.Click += new System.EventHandler(this.shortcut);
            // 
            // toolStripMenuItem3
            // 
            this.toolStripMenuItem3.Name = "toolStripMenuItem3";
            this.toolStripMenuItem3.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.D2)));
            this.toolStripMenuItem3.Size = new System.Drawing.Size(198, 22);
            this.toolStripMenuItem3.Text = "2";
            this.toolStripMenuItem3.Click += new System.EventHandler(this.shortcut);
            // 
            // toolStripMenuItem4
            // 
            this.toolStripMenuItem4.Name = "toolStripMenuItem4";
            this.toolStripMenuItem4.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.D3)));
            this.toolStripMenuItem4.Size = new System.Drawing.Size(198, 22);
            this.toolStripMenuItem4.Text = "3";
            this.toolStripMenuItem4.Click += new System.EventHandler(this.shortcut);
            // 
            // toolStripMenuItem5
            // 
            this.toolStripMenuItem5.Name = "toolStripMenuItem5";
            this.toolStripMenuItem5.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.D4)));
            this.toolStripMenuItem5.Size = new System.Drawing.Size(198, 22);
            this.toolStripMenuItem5.Text = "4";
            this.toolStripMenuItem5.Click += new System.EventHandler(this.shortcut);
            // 
            // toolStripMenuItem6
            // 
            this.toolStripMenuItem6.Name = "toolStripMenuItem6";
            this.toolStripMenuItem6.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.D5)));
            this.toolStripMenuItem6.Size = new System.Drawing.Size(198, 22);
            this.toolStripMenuItem6.Text = "5";
            this.toolStripMenuItem6.Click += new System.EventHandler(this.shortcut);
            // 
            // toolStripMenuItem7
            // 
            this.toolStripMenuItem7.Name = "toolStripMenuItem7";
            this.toolStripMenuItem7.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.D6)));
            this.toolStripMenuItem7.Size = new System.Drawing.Size(198, 22);
            this.toolStripMenuItem7.Text = "6";
            this.toolStripMenuItem7.Click += 
                new System.EventHandler(this.shortcut);
            // 
            // toolStripMenuItem8
            // 
            this.toolStripMenuItem8.Name = "toolStripMenuItem8";
            this.toolStripMenuItem8.ShortcutKeys = 
                ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | 
                System.Windows.Forms.Keys.D7)));
            this.toolStripMenuItem8.Size = new System.Drawing.Size(198, 22);
            this.toolStripMenuItem8.Text = "7";
            this.toolStripMenuItem8.Click += 
                new System.EventHandler(this.shortcut);
            // 
            // toolStripMenuItem9
            // 
            this.toolStripMenuItem9.Name = "toolStripMenuItem9";
            this.toolStripMenuItem9.ShortcutKeys = 
                ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | 
                System.Windows.Forms.Keys.D8)));
            this.toolStripMenuItem9.Size = new System.Drawing.Size(198, 22);
            this.toolStripMenuItem9.Text = "8";
            this.toolStripMenuItem9.Click += 
                new System.EventHandler(this.shortcut);
            // 
            // toolStripMenuItem10
            // 
            this.toolStripMenuItem10.Name = "toolStripMenuItem10";
            this.toolStripMenuItem10.ShortcutKeys = 
                ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | 
                System.Windows.Forms.Keys.D9)));
            this.toolStripMenuItem10.Size = new System.Drawing.Size(198, 22);
            this.toolStripMenuItem10.Text = "9";
            this.toolStripMenuItem10.Click += 
                new System.EventHandler(this.shortcut);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(195, 6);
            // 
            // clearButtonToolStripMenuItem
            // 
            this.clearButtonToolStripMenuItem.Name = 
                "clearButtonToolStripMenuItem";
            this.clearButtonToolStripMenuItem.ShortcutKeys = 
                ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | 
                System.Windows.Forms.Keys.D0)));
            this.clearButtonToolStripMenuItem.Size = 
                new System.Drawing.Size(198, 22);
            this.clearButtonToolStripMenuItem.Text = "Clear Square";
            this.clearButtonToolStripMenuItem.Click += 
                new System.EventHandler(this.shortcut);
            // 
            // subtractNumberToolStripMenuItem
            // 
            this.subtractNumberToolStripMenuItem.Name = 
                "subtractNumberToolStripMenuItem";
            this.subtractNumberToolStripMenuItem.ShortcutKeyDisplayString = 
                "Alt+-";
            this.subtractNumberToolStripMenuItem.ShortcutKeys = 
                ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | 
                System.Windows.Forms.Keys.OemMinus)));
            this.subtractNumberToolStripMenuItem.Size = 
                new System.Drawing.Size(198, 22);
            this.subtractNumberToolStripMenuItem.Text = "Subtract Number";
            this.subtractNumberToolStripMenuItem.Click += 
                new System.EventHandler(this.shortcut);
            // 
            // btnNum1
            // 
            this.btnNum1.Enabled = false;
            this.btnNum1.Location = new System.Drawing.Point(465, 158);
            this.btnNum1.Name = "btnNum1";
            this.btnNum1.Size = new System.Drawing.Size(33, 30);
            this.btnNum1.TabIndex = 1;
            this.btnNum1.Text = "&1";
            this.btnNum1.UseVisualStyleBackColor = false;
            this.btnNum1.Click += new System.EventHandler(this.btnNum_Click);
            // 
            // btnNum2
            // 
            this.btnNum2.Enabled = false;
            this.btnNum2.Location = new System.Drawing.Point(504, 158);
            this.btnNum2.Name = "btnNum2";
            this.btnNum2.Size = new System.Drawing.Size(33, 30);
            this.btnNum2.TabIndex = 1;
            this.btnNum2.Text = "&2";
            this.btnNum2.UseVisualStyleBackColor = true;
            this.btnNum2.Click += new System.EventHandler(this.btnNum_Click);
            // 
            // btnNum4
            // 
            this.btnNum4.Enabled = false;
            this.btnNum4.Location = new System.Drawing.Point(465, 194);
            this.btnNum4.Name = "btnNum4";
            this.btnNum4.Size = new System.Drawing.Size(33, 30);
            this.btnNum4.TabIndex = 1;
            this.btnNum4.Text = "&4";
            this.btnNum4.UseVisualStyleBackColor = true;
            this.btnNum4.Click += new System.EventHandler(this.btnNum_Click);
            // 
            // btnNum5
            // 
            this.btnNum5.Enabled = false;
            this.btnNum5.Location = new System.Drawing.Point(504, 194);
            this.btnNum5.Name = "btnNum5";
            this.btnNum5.Size = new System.Drawing.Size(33, 30);
            this.btnNum5.TabIndex = 1;
            this.btnNum5.Text = "&5";
            this.btnNum5.UseVisualStyleBackColor = true;
            this.btnNum5.Click += new System.EventHandler(this.btnNum_Click);
            // 
            // statusMain
            // 
            this.statusMain.BackColor = System.Drawing.SystemColors.ControlLight;
            this.statusMain.Items.AddRange(
                new System.Windows.Forms.ToolStripItem[] {this.lblStatusMain});
            this.statusMain.Location = new System.Drawing.Point(0, 490);
            this.statusMain.Name = "statusMain";
            this.statusMain.RenderMode = 
                System.Windows.Forms.ToolStripRenderMode.ManagerRenderMode;
            this.statusMain.Size = new System.Drawing.Size(589, 22);
            this.statusMain.SizingGrip = false;
            this.statusMain.TabIndex = 6;
            // 
            // lblStatusMain
            // 
            this.lblStatusMain.Name = "lblStatusMain";
            this.lblStatusMain.Size = new System.Drawing.Size(42, 17);
            this.lblStatusMain.Text = "Ready.";
            // 
            // openAddNewPuzzles
            // 
            this.openAddNewPuzzles.DefaultExt = "dat";
            this.openAddNewPuzzles.RestoreDirectory = true;
            this.openAddNewPuzzles.Title = "Select puzzle file ...";
            // 
            // picDifficultyLevel
            // 
            this.picDifficultyLevel.Image = 
                ((System.Drawing.Image)(
                    resources.GetObject("picDifficultyLevel.Image")));
            this.picDifficultyLevel.Location = new System.Drawing.Point(465, 77);
            this.picDifficultyLevel.Name = "picDifficultyLevel";
            this.picDifficultyLevel.Size = new System.Drawing.Size(110, 55);
            this.picDifficultyLevel.TabIndex = 5;
            this.picDifficultyLevel.TabStop = false;
            // 
            // Sudoku
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(589, 512);
            this.Controls.Add(this.statusMain);
            this.Controls.Add(this.btnNum9);
            this.Controls.Add(this.btnNum6);
            this.Controls.Add(this.btnNum3);
            this.Controls.Add(this.btnNum8);
            this.Controls.Add(this.btnNum7);
            this.Controls.Add(this.btnNum5);
            this.Controls.Add(this.btnNum4);
            this.Controls.Add(this.btnNum2);
            this.Controls.Add(this.btnNum1);
            this.Controls.Add(this.picDifficultyLevel);
            this.Controls.Add(this.LblDifficultyLevel);
            this.Controls.Add(this.grpBoxPuzzle);
            this.Controls.Add(this.btnShowSolution);
            this.Controls.Add(this.btnHint);
            this.Controls.Add(this.btnCheckFinished);
            this.Controls.Add(this.btnCheckValues);
            this.Controls.Add(this.btnClearNumber);
            this.Controls.Add(this.btnClearSquare);
            this.Controls.Add(this.mainMenu);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.mainMenu;
            this.MaximizeBox = false;
            this.Name = "Sudoku";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Sudoku";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Sudoku_FormClosing);
            this.Load += new System.EventHandler(this.Sudoku_Load);
            this.mainMenu.ResumeLayout(false);
            this.mainMenu.PerformLayout();
            this.statusMain.ResumeLayout(false);
            this.statusMain.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picDifficultyLevel)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnClearSquare;
        private System.Windows.Forms.Button btnClearNumber;
        private System.Windows.Forms.Button btnCheckValues;
        private System.Windows.Forms.Button btnCheckFinished;
        private System.Windows.Forms.Button btnHint;
        private System.Windows.Forms.Button btnShowSolution;
        private System.Windows.Forms.Button btnNum3;
        private System.Windows.Forms.Button btnNum6;
        private System.Windows.Forms.Button btnNum7;
        private System.Windows.Forms.Button btnNum8;
        private System.Windows.Forms.Button btnNum9;
        private System.Windows.Forms.GroupBox grpBoxPuzzle;
        private System.Windows.Forms.Label LblDifficultyLevel;
        private System.Windows.Forms.MenuStrip mainMenu;
        private System.Windows.Forms.ToolStripMenuItem puzzleToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem addToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem levelToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem quitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem newToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem loadToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem saveToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem easyToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem mediumToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem hardToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem geniusToolStripMenuItem;
        public  System.Windows.Forms.PictureBox picDifficultyLevel;
        private System.Windows.Forms.ToolStripMenuItem howToPlaySudokuToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem solvingTipsToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem aboutSudokuToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem addMorePuzzlesToolStripMenuItem;
        private System.Windows.Forms.Button btnNum1;
        private System.Windows.Forms.Button btnNum2;
        private System.Windows.Forms.Button btnNum4;
        private System.Windows.Forms.Button btnNum5;
        private System.Windows.Forms.StatusStrip statusMain;
        private System.Windows.Forms.ToolStripStatusLabel lblStatusMain;
        private System.Windows.Forms.OpenFileDialog openAddNewPuzzles;
        private System.Windows.Forms.ToolStripMenuItem shortcutsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem3;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem4;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem5;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem6;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem7;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem8;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem9;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem10;
        private System.Windows.Forms.ToolStripMenuItem clearButtonToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem subtractNumberToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
    }
}

