class Mandel 
{
public:
    int width, height;                      /* screen size */
	
    long double midx, midy;                 /* image posn */
    long double sizex, sizey;               /* image size */

    int GetPixel(int ix, int iy);
};
