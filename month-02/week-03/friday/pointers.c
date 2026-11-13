#include <stdio.h>
#include <string.h> 
#include "check.h"


void simpleSwap (int a , int b) {
    int s = a;
    a = b;
    b = s;
}

void swap(int *a, int *b) {
    int c = *a;
    *a = *b;
    *b = c;
}

int main(void) {
    printf("---- swap ---- \n");
    int x = 2, y = 1;
    swap(&x, &y);
    printf("%d\n ", x);
    printf("%d\n ", y);

    checkInt(x, 1);
    checkInt(y, 2);

    return 0 ;
}