#include "Mandel.h"

int Mandel::GetPixel(int ix, int iy)
{
    unsigned iter = 0;
    long double x, y, x2, y2, temp;

    long double cy = midy + (2.0 * iy /height - 1.0) * sizey;
    long double cx = midx + (2.0 * ix /width - 1.0) * sizex;

    x = y = x2 = y2 = 0.0;

    while( iter < 256 && ( x2 + y2 ) < 4.0) { 
        temp = x2 - y2 + cx;
        y = 2 * x * y + cy;
        x = temp;
        x2 = x * x;
        y2 = y * y;
        iter++;
    }

    iter = 256 - iter;

    int red = iter * 12 % 256;
    int green = iter * 16 % 256;
    int blue = iter * 5 % 256;

    return red << 16 | green << 8 | blue;
}