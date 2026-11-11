#include <stdio.h>
#include "check.h"



int index_of_max(int array[], int size) {
    int max = 0;
    for (int i = 0; i < size; i++) {
        if (array[i] > array[max]) {
            max = i;
        }
    }
    return max;
}

int countEven (int array[], int size) {
    int c = 0;
    for (int i = 0; i < size; i++) {
        if (array[i] % 2 == 0) {
            c = c + 1;
        }
    }
    return c;
}

int digit_sum(int x) {
    int s = 0 ;
    if (x < 0) {
        x = -x;

    }
    for (; x > 0; x = x / 10) {
        s = s + x % 10;
    }
    return s;
}

int sumDigitArray(int array[], int size) {
    int s = 0;
    for (int i = 0; i < size; i++) {
        int temp = digit_sum(array[i]);
        s = s + temp;
    }
    return s;
}

int main(void) {
    int scores[5] = {70, 82, 95, 63, 88};
    int tie[4] = {9, 9, 1, 2};
    checkInt(index_of_max(scores, 5), 2);
    checkInt(index_of_max(tie, 4), 0);
    checkInt(countEven(scores, 5), 3);
    checkInt(countEven(tie, 4), 1);
    checkInt(sumDigitArray(scores, 5), 56);
    checkInt(sumDigitArray(tie, 4) , 21);
    return 0;
}

//gcc -Wall -o review  review.c  check.c
// ./review 