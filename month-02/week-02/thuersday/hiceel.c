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

int find_index(int a[], int n, int key) { 
    for (int i = 0; i < n; i++) {
         if (a[i] == key) { 
            return i; 
        } 
        } 
    return 0; 
}

int count_passing(int a[], int n) {
    int cnt = 0;
    for (int i = 0; i < n; i++) {
        if (a[i] >= 60) {
            cnt = cnt + 1;
        }
    }
    return cnt ;
}

int count_failing(int a[], int n) {
    int cnt = 0;
    for (int i = 0; i < n; i++) {
        if (a[i] < 60) {
            cnt = cnt + 1;
        }
    }
    return cnt ;
}

void print_bar(int n) {
    for (int i = 1; i <= n; i++) {
        printf("*");
    }
    printf("\n");
}

void print_bars(int a[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%3d ", a[i]);
        print_bar(a[i] / 10);
    }
}



int main(void) {
    int scores[5] = {70,82,95,63,88};
    int mixed[5] = {40,60,72,58,100};
    printf("total\n");
    int total = 0, total1 = 0;
    for(int i = 0; i < 5; i++){
        total = total + scores[i];
        total1 = total1 + mixed[i];
    }
    printf("%d\n", total);
    printf("%d\n", total1);

    printf("count pasiing\n");
    int s = 0, q = 0;
    for(int i = 0; i < 5; i++) {
        if (scores[i] >= 60) {
            s = s + 1;
        }
        if (mixed[i] >= 60) {
            q = q + 1;
        }
    }
    printf("%d\n", s);
    printf("%d\n", q);

    printf("max score\n");
    int max1 = scores[0] , max2 = mixed[0] ;
    for (int i = 1; i <= 4; i++) {
        if (max1 < scores[i]){
            max1 = scores[i];
        }
        if (max2 < mixed[i]){
            max2 = mixed[i];
        }
    }
    printf("%d\n", max1);
    printf("%d\n", max2);

    printf("average\n");
    
    double average, average1, size = 5.0;

    average = total / size;
    average1 = total1 / size;

    printf("%f\n", average);
    printf("%f\n", average1);
    check_int(find_index(scores, 5, 95), 2);
    check_int(find_index(scores, 5, 50), 0);

    printf("passing students\n");

    check_int(count_passing(scores, 5), 5);

    printf("failing students\n");
    check_int(count_failing(mixed, 5), 2);

    print_bars(scores, 5);

}