public class GridArray
{
    private int xSize = 10;
    private int ySize = 10;
    private int[,] grid = new Array[xSize,ySize];
    
    public GridArray()
    {
    }
    
    public void PopulateArray()
    {
        for(int x = 0; x < this.xSize; x++)
        {
            for(int y = 0; y < this.ySize; y++)
            {
                // this can be changed to assign whatever you like:
                this.grid[x,y] = x*y;
            }
        }
    }
    
    public override string ToString()
    {
        int returnStr = "";
        
        for(int x = 0; x < this.xSize; x++)
        {
            for(int y = 0; y < this.ySize; y++)
            {
                returnStr += this.grid[x,y].ToString() + "\t";
            }
            returnStr+="\r\n";
        }
        
        return returnStr;
    }
}