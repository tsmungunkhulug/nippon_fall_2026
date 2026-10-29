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


/* 1 */
int is_sixty(int s) {
    if (s == 60) {
        return 1;
    }
    return 0;
}
/* check_int(is_sixty(50), 0); */

/* 2 */
int sum_to(int n) {
    int sum = 0;
    for (int i = 1; i <= n; i++) {
        sum = sum + i;
    }
    return sum;
}
/* check_int(sum_to(4), 10); */

/* 3 */
double average2(int a, int b) {
    return (a + b) / 2.0;
}
/* check_double(average2(7, 8), 7.5); */

/* 4 */
int digit_sum(int n) {
    int s = 0;
    while (n > 0) {
        s = s + n % 10;
        n = n / 10;
    }
    return s;
}
/* check_int(digit_sum(12), 3); */

int main(void) {
    check_int(is_sixty(50), 0);
    check_int(sum_to(4), 10);
    check_double(average2(7, 8), 7.5);
    check_int(digit_sum(12), 3);
}
