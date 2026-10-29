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

// 1. is_passing
int is_passing(double x) {
    if (x >= 60.0) {
        return 1;
    } else {
        return 0;
    }
}

// 2. letter_grade
int letter_grade(double x) {
    if (x >= 90.0) {
        return 'A';
    } else if (x >= 80.0) {
        return 'B';
    } else if (x >= 70.0) {
        return 'C';
    } else if (x >= 60.0) {
        return 'D';
    } else {
        return 'F';
    }
}

// 3. in_range
int in_range(int x, int y, int z) {
    if (x >= y && x <= z) {
        return 1;
    } else {
        return 0;
    }
}
int count_divisors(int x) {
    int c = 0, i = 0;
    for (i = 1; i <= x; i++) {
        if (x % i == 0) {
            c = c + 1;
        }
    }
    return c;  
}

int digit_sum(int x) {
    int s = 0;
    while (x > 0) {
        s = s + x % 10;
        x = x / 10;
    }
    return s;
}

int is_prime(int x) {
    if (x < 2) {
        return 0;
    }
    int d = 2;
    while (d * d <= x) {
        if (x % d == 0) {
            return 0;
        }
        d = d + 1;
    }
    return 1;
}

int power_loop(int x, int y) {
    int r = 1, i = 0;
    for (i = 0; i < y; i++) {
        r = r * x;
    }
    return r;
}

int power_rec(int x, int y) {
    if (y == 0) {
        return 1;
    }
    else {
        return x * power_rec(x, y - 1);
    }
}

void print_bar(int n) {
    for (int i = 1; i <= n; i++) {
        printf("*");
    }
    printf("\n");
}

void print_triangle(int n) {
    for (int row = 1; row <= n; row++) {
        print_bar(row);
    }
}



int main() {
    printf("--- 1. is_passing шалгах ---\n");
    check_int(is_passing(60.0), 1); 
    check_int(is_passing(59.8), 0); 

    printf("\n--- 2. letter_grade шалгах ---\n");
    check_int(letter_grade(92.6), 'A');
    check_int(letter_grade(86.0), 'B');
    check_int(letter_grade(90.0), 'A');
    check_int(letter_grade(60.0), 'D');
    check_int(letter_grade(51.0), 'F');

    printf("\n--- 3. in_range шалгах ---\n");
    check_int(in_range(5, 1, 10), 1);
    check_int(in_range(10, 1, 10), 1);
    check_int(in_range(11, 1, 10), 0);

    printf("\n--- 4. divisors шалгах ---\n");
    check_int(count_divisors(12), 6);
    check_int(count_divisors(28), 6);
    check_int(count_divisors(1), 1);

    printf("\n--- 5. digit_sum шалгах ---\n");
    check_int(digit_sum(9075), 21);
    check_int(digit_sum(7), 7);
    check_int(digit_sum(0), 0);

    printf("\n--- 6. is_prime шалгах ---\n");
    check_int(is_prime(1), 0);
    check_int(is_prime(2), 1);
    check_int(is_prime(21), 0);
    check_int(is_prime(23), 1);

    print_bar(5);
    print_triangle(3);

    return 0;
}

