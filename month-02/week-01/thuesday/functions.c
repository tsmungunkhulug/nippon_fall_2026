#include <stdio.h>

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

int cube(int x){
    return x * x * x;
}
int lastdigit(int x){
    return x % 10;
}
double final(int x , int y) {
    return x * 0.4 + y * 0.6 ;

}
double temp(double x){
    return x * 1.8 + 32;
}

int main(void) {
    check_int(cube(2), 8);
    check_int(cube(-2), -8);
    check_int(lastdigit(1234), 4);
    check_int(lastdigit(7), 7);
    check_int(final(80, 90), 86.0);
    check_int(final(60, 60), 60.0);
    check_int(final(95 , 91), 92.6);
    check_double(temp(20), 68.0) ;
    check_double(temp(32), 89.6) ;
    check_double(temp(37.0), 98.6) ;
    check_double(temp(-17.8), -0.04) ;
    return 0;
}

