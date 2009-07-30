/* Program:  PassParam.c
 * Author:   Yuefeng Li
 * Purpose:  passing parameters in C
 *=========================================================*/
 

#include<stdio.h>  

int myFunction1(int); 
int myFunction2(int*); 

int main(int argc, char* args[])
{
	int x=2;
    printf("The initial value of x is %d\n", x);
    int y;

    y=myFunction1(x);
    printf("The value of y using myFunction1 is %d\n", y);
    printf("The value of x after myFunction1 is %d\n\n", x);

    x=2;
    printf("Reset x to the initial value %d\n", x);
	y=myFunction2(&x);
    printf("The value of y using myFunction2 is %d\n", y);
    printf("The new value of x after myFunction2 is %d\n", x);
}


int myFunction1(int z)
{   
    return z=z+2;
}

int myFunction2(int* z)
{   
    return *z=*z+2;
}


   
