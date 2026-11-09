#include <stdio.h>
#include <string.h>
 #include "check.h"
 //gcc -Wall -o review  review.c  check.c
// ./review 
 int palendrom(char x[]) {
    int n = strlen(x);
    for (int i = 0; i == n % 2 - 1; i++) {
        if (x[i] != x[n - 1 - i]) {
            return 0 ;
        }
    }
    return 1;
 }
 int main(void) {
    checkInt(palendrom("abba"), 1);
    checkInt(palendrom("level"), 1);
    checkInt(palendrom("abc"), 0);
    checkInt(palendrom(""), 1);

 }