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
int total(int a[], int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum = sum + a[i];
    }
    return sum;
}
/* check_int(total(scores, 5), 398); */

/* 2 */
double average(int a[], int n) {
    return (double) total(a, n) / n;
}
/* check_double(average(scores, 5), 79.6); */

/* 3 */
int max_score(int a[], int n) {
    int m = a[0];
    for (int i = 0; i < n; i++) {
        if (a[i] > m) {
            m = a[i];
        }
    }
    return m;
}
/* int temps[3] = {-5, -2, -9};  check_int(max_score(temps, 3), -2); */

/* 4 */
int find_index(int a[], int n, int key) {
    for (int i = 0; i < n; i++) {
        if (a[i] == key) {
            return i;
        }
    }
    return -1;
}
/* check_int(find_index(scores, 5, 50), -1); */
 
int main(void) {
    int scores[5] = {70,82,95,63,88};
    int mixed[5] = {40,60,72,58,100};
    check_int(total(scores, 5), 398);
    check_double(average(scores, 5), 79.6);
    check_int(max_score(scores, 5), 95);
    check_int(find_index(scores, 5, 50), -1);
    return 0;
}