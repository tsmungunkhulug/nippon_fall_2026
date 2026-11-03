#include <stdio.h>
#include <stdbool.h> 
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

void greetings(int x) {
    for (int i = 1; i <= x; i++)
    {
        printf("Saina uu\n");
    }
}

void evenNumber(int x) {
    for (int i = 1; i <= x; i++)
    {
        if (i % 2 == 0)
        {
            printf("%d\n", i);
        }
    }
}

void letters(char x, char y) {
    for (char c = x; c <= y; c++) {
        printf("%c ", c);
    }
    printf("\n");
}

int star(int x) {
    for (int i = 1; i <= x; i++ ){
        printf("*");
    }
}

int countdown(int x, int y){
    printf("\n");
    for (int i = x; i > 0; i -= y){
        printf("%d\n", i);
    }
}

void triangle(int x){
    for (int i = 1; i <= x; i++){
        for (int q = 1; q <= i; q++) {
            printf("*");
        }
        printf("\n");
    }
}

void FizzBuzz(int x) {
    for (int i = 1; i <= x; i++) {
        if (i % 15 == 0) {
            printf("FizzBuzz\n");
        }
        else if (i % 5 == 0) {
            printf("Buzz\n");
        }
        else if (i % 3 == 0) {
            printf("Fizz\n");
        }
        else {
            printf("%d\n", i);
        }
    }
}

void Hours(int x, int y ) {
    for (int i = 0; i <= y - 1; i++){
         if (x == 24) {
            x = 0;
        }
        printf("%d\n", x);
        x = x + 1;
    }
}
int spaces(int x) {
    for ( int i = 0; i <= x; i++){
        printf(" ");
    }
    printf("\n");
}

void pyramid(int x) {
    for (int i = 1; i <= x; i++) {
        for (int q = 1; q <= x - i; q++) {
            printf(" ");
        }

        for (int w = 1; w <= 2 * i - 1; w++) {
            printf("*");
        }

        printf("\n");
    }
}

int main(void) {
    greetings(3);
    evenNumber(10);
    letters('a', 'd');
    star(3);
    countdown(20, 5);
    triangle(4);
    FizzBuzz(15);
    Hours(22, 5);
    spaces(5);
    pyramid(5);
    return 0;
}


