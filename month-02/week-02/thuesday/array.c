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

int sumOdd(int x) {
    int s = 0;
    for (int i = 0; i <= x; i++){
        if (i % 2 == 1) {
            s = s + i;
        }
    }
      printf("%d\n", s);
}

int main (void) {
    int numbers [4] = {1, 2, 3, 5};
    int scores [5] = {70, 82, 95, 63, 88};
    printf("%d %d %d\n", scores[4], scores[2], scores[0]);
    // array value change
      
    printf("%d\n", scores[3]);
    scores[3] = 85;
    printf("%d\n", scores[3]);

    scores[0] = 95;
    printf("%d\n", scores[0]);
    // print all value of arrays
    char englishAlphaBet[26] = { 'A', 'B', 'C', 'D', 'E', 'F', 'G',
  'H', 'I', 'J', 'K', 'L', 'M', 'N',
  'O', 'P', 'Q', 'R', 'S', 'T', 'U',
  'V', 'W', 'X', 'Y', 'Z'};
 
  printf("\n");
    for (int i = 1; i <= 26; i++){
      printf("%d %c\n", i , englishAlphaBet[i]);
    }
    for (int i = 1; i <= 26; i++) {
        if (i == 1) {
            printf("1-st letter: %c\n", englishAlphaBet[0]);
        }
        else if (i == 2) {
            printf("2-nd letter: %c\n", englishAlphaBet[1]);
        }
        else if (i == 1) {
            printf("3-rd letter: %c\n", englishAlphaBet[2]);
        }
        else {
            printf("%d-th letter: %c\n", i , englishAlphaBet[i - 1]);
        }
    }

    //size of array
    int size = sizeof(englishAlphaBet);
    printf("%d\n", size);
    int ten[10] = {1,2,3,4,5,6,7,8,9,10};
    int size1 = sizeof(ten) / sizeof(ten[0]);
    for(int i = 0; i <= size1; i++){
        if (ten[i] % 2 == 0) {
            printf("%d \n", ten[i]);
        }
    }
    for (int i = 1; i <= size1; i++){
        ten[i - 1] = i * 2;
    }
    for (int i = 0; i < size1; i++) {
        printf("%d \n", ten[i]);
    }

    sumOdd(5);

    return 0;
}