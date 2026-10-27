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

double discount(double x , double y){
    return x - (x * y);
}

int hour(int x){
    return x / 60;
}
char upper(char x){
    return x - 32;
}
bool negative(int x){
    return x < 0;
}
bool p_and_e(int x){
    return x > 0 && x % 2 == 0;
}
double temp2(double x){
    return (x - 32) * 4 / 9;
}
int zero(int x){
    return x / 10 * 10;
}
int two(int x , int y, int z){
    return (x > 0 && y > 0) || (x > 0 && z > 0) || (y > 0 && z > 0) ;
    
}

int main(void){
    check_double(discount(100 , 0.15), 85.0);
    check_int(hour(135), 2) ;
    check_int(negative(-5), 1);
    check_int(p_and_e(-3), 0);
    check_int(p_and_e(4), 1);
    printf("%d\n", p_and_e(4));
    printf("%c\n", upper('a'));
    check_int(zero(129), 120);
    check_double(temp2(32),0);
    check_int(two(1 ,3, -6), 1);
    return 0;
}