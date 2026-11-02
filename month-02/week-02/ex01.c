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



bool checkIsDigitChar(char x) {
    if (x >= 0 && x <= 9) {
        printf("yes\n");
    }
    return 0;
}

double temp(double x) {
    if (x >= 30) {
        printf("H\n");
    }
    else if( x >= 0) {
        printf("N\n");
    }
    else {
        printf("C\n");
    }
    return 0;
}

int grade(int x) {
    if (x >= 90) {
        printf("A\n");
    }
    else if (x >= 80) {
        printf("B\n");
    }
    else if (x >= 70) {
        printf("C\n");
    }
    else if (x >= 60) {
        printf("d\n");
    }
    else {
        printf("F\n");
    }
}

int leapYear(int x) {
    if (x % 400 == 0) {
        printf("true\n");
    }
    else if (x % 100 == 0) {
         printf("false\n");
    }
    else if (x % 4 == 0) {
         printf("true\n");
    }
    else {
        printf("false\n");
    }
    return 0;
}

int ticket(int x, int y) {
    if (x >= 65) {
        if (y >= 6 && y <= 7) {
            printf("8000\n");
        }
        else {
            printf("6000\n");
        }
    }
    else if (x >= 18) {
        if (y >= 6 && y <= 7) {
            printf("12000\n");
        }
        else {
            printf("10000\n");
        }
    }
    else if (x >= 6) {
        if (y >= 6 && y <= 7) {
            printf("7000\n");
        }
        else {
            printf("5000\n");
        }
    }
    else if (x >= 0) {
        printf("0\n");
    }
    return 0;
}

int count(int x) {
    int i ;
    for (i = x; i >= 1; i--){
        printf("%d ", i);
    }
    printf("start!\n");
    return 0;
}

int range(int x, int y)  {
    int i , s = 0;
    for (i = x; i < y; i++){
        s = s + i;
    }
    return s;
}

int main(void) {
    checkIsDigitChar(8);
    temp(97.5);
    grade(55);
    leapYear(200);
    ticket(70, 5);
    ticket(13, 6);
    count(10);
    printf("%d ", range(10, 15));
    return 0;
}