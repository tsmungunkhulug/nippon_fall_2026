#include <stdio.h>
#include "check.h"
#include <ctype.h>

int countUpper(char s[]){
    int cnt = 0;
    for (int i = 0; s[i] != '\0'; i++){
        if (s[i] >= 'A' && s[i] <= 'Z'){
            cnt++;
        }
    }
    return cnt;
}

int indexOfChar (char s[], char c){
    for (int i =0; s[i] != '\0'; i++){
        if (s[i] == c) {
            return i;
        }
    }
    return -1;
}

void toLower (char s[]) {
    for (int i = 0; s[i] != '\0'; i++) {
        s[i] = tolower(s[i]);
    }
}

int isSorted(int a[], int n) {
    for (int i = 0; i < n - 1; i++) {
        if (a[i] > a[i + 1]) {
            return 0;
        }
    }
    return 1;
}

int bubbleSort(int a[], int n) {
    int swaps = 0, t;

    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (a[j] > a[j + 1]) {
                t = a[j];
                a[j] = a[j + 1];
                a[j + 1] = t;
                swaps++;
            }
        }
    }
    return swaps;
}

int selectionSort(int a[], int n) {
    int swaps = 0, t, minIndex;

    for (int i = 0; i < n - 1; i++) {
        minIndex = i;

        for (int j = i + 1; j < n; j++) {
            if (a[j] < a[minIndex]) {
                minIndex = j;
            }
        }

        if (minIndex != i) {
            t = a[i];
            a[i] = a[minIndex];
            a[minIndex] = t;
            swaps++;
        }
    }
    return swaps;
}

void printBars(int a[] , int n) {
    for (int i = 0; i < n ; i++) {
        printf("%d: ", a[i]);
        for(int j = 9; j < a[i]; j +=10) {
            printf("*");
        }
        printf("\n");
    }
}
    

int main (void) {
    printf("--- countUpper ---\n");
    checkInt(countUpper("Hello World"), 2);
    checkInt(countUpper("abc"), 0);
    checkInt(countUpper("ABC"), 3);

    printf("--- indexOfChar ---\n");
    checkInt(indexOfChar("banana", 'n'), 2);
    checkInt(indexOfChar("abc", 'z'), -1);
    checkInt(indexOfChar("", 'a'), -1);

    printf("--- toLower ---\n");
    char a[] = "HeLLo";
    toLower(a);
    checkString(a, "hello");
    char b[] = "ABC";
    toLower(b);
    checkString(b, "abc");

    printf("--- isSorted ---\n");
    int s[3] = {1,2,3};
    int u[3] = {3,1,2};
    checkInt(isSorted(s, 3), 1);
    checkInt(isSorted(u, 3), 0);

    printf("--- bubbleSort ---\n");
    int w[6] = {5,2,8,1,9,3};
    checkInt(bubbleSort(w, 6), 7);
    checkInt(isSorted(w, 6), 1);
    checkInt(w[0], 1);
    checkInt(w[5], 9);

    printf("--- selectionSort ---\n");
    int q[6] = {5,2,8,1,9,3};
    checkInt(selectionSort(q, 6), 3);
    checkInt(isSorted(q, 6), 1);
    int r[4] = {4,3,2,1};
    checkInt(selectionSort(r,4),2);

    printf("--- 3B: Scores ---\n");
    int scores[5] = {70,82,95,63,88};
    bubbleSort(scores, 5);
    printBars(scores, 5);

    return 0;
}
