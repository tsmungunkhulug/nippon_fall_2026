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

int count_multiples(int x, int y) {
    int s = 0;
    while (x >= 0) {
        x = x - y;
        s = s + 1;
    }
    return s - 1;
}

int reverse_number(int x) {
    int s = 0;
    while (x > 0) {
        s = s * 10 + x % 10;
        x = x / 10;
    }
    return s;
}

int max3(int x, int y, int z) {
    if (x >= y && x >= z) {
        return x;
    }
    else if (y >= x && y >= z) {
        return y;
    }
    else {
        return z;
    }
}
int count_digits(int x) {
    int s = 0;
    if (x == 0) {
        return 1;
    }
    while (x > 0) {
        x = x / 10;
        s = s + 1;
    }
    return s;
}

int gcd(int x, int y) {
    int i;
    if (x > y) {
        for (i = y; i >= 1; i--) {
            if (x % i == 0 && y % i == 0) {
                return i;
            }
        }
    }
    else {
        for (i = x; i >= 1; i--) {
            if (x % i == 0 && y % i == 0) {
                return i;
            }
        }
    }
    return 0;
}

int is_perfect(int x) {
    int s = 0, i;
    for (i = 1; i < x; i++) {
        if (x % i == 0) {
            s = s + i;
        }
    }
    if (s == x) {
        return 1;
    }
    else {
        return 0;
    }
}


int main(void) {
    check_int(count_multiples(10, 3), 3);
    check_int(count_multiples(12, 4), 3);
    check_int(count_multiples(5, 7), 0);

    check_int(reverse_number(1234), 4321);
    check_int(reverse_number(120), 21);
    check_int(reverse_number(7), 7);

    check_int(max3(1, 5, 3), 5);
    check_int(max3(9, 2, 9), 9);
    check_int(max3(-1, -5, -3), -1);

    check_int(count_digits(90210), 5);
    check_int(count_digits(7), 1);
    check_int(count_digits(0), 1);

    check_int(gcd(48, 18), 6);
    check_int(gcd(84, 36), 12);
    check_int(gcd(7, 5), 1);

    check_int(is_perfect(6), 1);
    check_int(is_perfect(28), 1);
    check_int(is_perfect(12), 0);
}