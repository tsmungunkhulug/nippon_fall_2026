#include <stdio.h>
#include "check.h"
#include <string.h> 

void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %d гарсан, %d хүлээсэн\n", actual, expected);
    }
}

void check_double(double actual, double expected) {
    double diff = actual - expected;
    if (diff < 0.001 && diff > -0.001) {
        printf("PASS\n");
    } else {
        printf("FAIL: %f гарсан, %f хүлээсэн\n", actual, expected);
    }
}

void ex1() {
    int x = 5;
    int *p = &x;
    *p = 10;
    printf("%d\n", x);
}

int countSpace(char characters []) {
    int charLenght = strlen(characters), cnt = 0;
    for (int i = 0; i < charLenght; i++){
        if(characters[i] == ' ') {
            cnt++;
        }
    }

    return cnt ;
}

int clamp(int *a, int x , int y) {
    if(*a < x) {
        *a = x;
    }
    if ( *a > y) {
        *a = y;
    }
    return 0;
}

int order(int *a, int *b) {
    int c;
    c = *a;
    *a = *b;
    *b = c;
    return 0;
}

int main(void) {
    ex1();
    check_int(countSpace("GET / HTTP/1.1"), 2);
    check_int(countSpace("abc"), 0);
    check_int(countSpace("a b c d"), 3);

    int v = 120;
    clamp(&v, 0, 100);
    checkInt(v,100);

    int a = 5, b = 3;
    order(&a, &b);
    checkInt(a, 3);
    checkInt(b,5);
}