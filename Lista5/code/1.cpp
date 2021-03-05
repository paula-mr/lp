#include <stdio.h>

int x =0;

void p (int, int);

void main () {
    int x = 1;
    p (x , x ) ;
}

void p (int y , int z ) {
    x = x +1;
    y = y +1;
    z = z +1;
    printf ("%d\n",x + y + z ) ;
}