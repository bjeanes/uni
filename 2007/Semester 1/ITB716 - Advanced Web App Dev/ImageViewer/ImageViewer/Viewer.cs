using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ImageViewer
{
    public partial class Viewer : Form
    {
        public Viewer()
        {
            InitializeComponent();
            pictureBox1.Image = new Bitmap(pictureBox1.Width, pictureBox1.Height);
        }

        private void ReDraw(object sender, EventArgs e)
        {
            Cursor oldCursor = this.Cursor;
            this.Cursor = Cursors.WaitCursor;

            Bitmap bitmap = (Bitmap)pictureBox1.Image;

            for (int x=0; x<pictureBox1.Width; x++)
                for (int y=0; y<pictureBox1.Height; y++)
                    bitmap.SetPixel(x, y, Color.Black);

            pictureBox1.Refresh();

            for (int x=0; x<pictureBox1.Width; x++) {
                for (int y=0; y<pictureBox1.Height; y++)
                    bitmap.SetPixel(x, y, ImageColor(x, y));
                pictureBox1.Refresh();
            }

            this.Cursor = oldCursor;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            FileDialog file = new SaveFileDialog();
            file.Title = "Save Image As";
            file.DefaultExt = ".gif";
            file.AddExtension = true;
            file.Filter = "Image Files (*.gif,*.jpg,*.bmp)|*.gif;*.jpg;*.bmp";
            if (file.ShowDialog(this) == DialogResult.OK)
                pictureBox1.Image.Save(file.FileName);

        }
   
        // to be overridden in derived classes
        protected virtual Color ImageColor(int x, int y) 
        {
            return Color.Yellow;
        }

        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
                ZoomIn(e.X, e.Y);
            if (e.Button == MouseButtons.Right)
                ZoomOut(e.X, e.Y);

            ReDraw(null, null);
        }

        // to be overridden in derived classes
        protected virtual void ZoomIn(int x, int y)
        {
            System.Windows.Forms.MessageBox.Show("ZoomIn(" + x + ", " + y + ")");
        }

        // to be overridden in derived classes
        protected virtual void ZoomOut(int x, int y)
        {
            System.Windows.Forms.MessageBox.Show("ZoomOut(" + x + ", " + y + ")");
        }

    }

    

}