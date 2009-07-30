/* Filename:  typeSizes.c
 * Author  :  Yuefeng Li
 * Purpose :  This program prints the size of various C variable
 *            types and constructs.
 *===============================================================*/

#include <stdio.h>

int main(void)
{
   char   *char_ptr;
   int    *int_ptr;
   long   *long_ptr;
   short  *short_ptr;
   float  *float_ptr;
   double *double_ptr;
   char   *far_char_ptr;

   struct test_tag {
      char a;
      int  b;
   }test_struct;

   printf( "\n Type             Size " );
   printf( "\n==========================" );
   printf( "\n character         %d ", sizeof( char  ));
   printf( "\n integer           %d ", sizeof( int   ));
   printf( "\n short             %d ", sizeof( short ));
   printf( "\n long              %d ", sizeof( long  ));
   printf( "\n float             %d ", sizeof( float ));
   printf( "\n double            %d ", sizeof( double));
   printf( "\n char pointer      %d ", sizeof( char_ptr  ));
   printf( "\n int pointer       %d ", sizeof( int_ptr   ));
   printf( "\n short pointer     %d ", sizeof( short_ptr ));
   printf( "\n long pointer      %d ", sizeof( long_ptr  ));
   printf( "\n float pointer     %d ", sizeof( float_ptr ));
   printf( "\n double pointer    %d ", sizeof( double_ptr));
   printf( "\n far char pointer  %d ", sizeof( far_char_ptr));
   printf( "\n test_structure    %d ", sizeof( test_struct));
   printf( "\n==========================");
}
