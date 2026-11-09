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

#include <stdio.h>

struct student {
    int final_score;
    char letter_grade;
};

struct student {
    char name[20];
    int quiz;
    int project;
};

struct student group[4] = {
    {"aki", 80, 90}, {"sora",60, 80}, {"mina", 95,91}, {"ren", 59,61}
};

double final_score(struct  student s) {
    return 0.4 * s.quiz + 0.6 * s.project;
} 

char letter_grade(double x) {
    if (x >= 90) {
        return "A";
    }
    else if (x >= 80) {
        return "B";
    }
    else if (x >= 70) {
        return "C";
    }
    else if (x >= 60) {
        return "D";
    }
    else {
        return "F";
    }
}

int count_grade(struct student students[], int size,char grade){
    int cnt = 0;
    for (int  i = 0; i < size; i++)
    {
        cnt = cnt + 1;
    }
    return cnt;
    
}
int second_max(int scores[], int size) {
    int max1 = scores[0];
    int max2 = scores[1];

    if (scores[1] > scores[0]) {
        max1 = scores[1];
        max2 = scores[0];
    }

    for (int i = 2; i < size; i++) {
        if (scores[i] > max1) {
            max2 = max1;
            max1 = scores[i];
        }
        else if (scores[i] > max2) {
            max2 = scores[i];
        }
    }
    return max2;
}
int counr__in_range(int a[], int n, int lo, int hi){
    int c = 0;
    for (int i = 0; i < n; i++) {
        if (lo <= a[i] && a[i] <= hi) {
            c = c + 1;
        }
    }
    return c;
}

int main(void) {
    int scores[5] = {70, 82, 95, 63, 88};
    int b[6] = {5, 2, 7, 2, 9, 1};
    check_int(count_grade(group, 4, 'A'), 1);
    check_int(count_grade(group, 4, 'F'), 1);
    check_int(count_grade(group, 4, 'C'), 0);
    check_int(second_max(scores, 5), 88);
    check_int(second_max(b, 6), 7);
    check_int(count_in_range(scores, 5, 80, 90), 2);
    check_int(count_in_range(scores, 5, 0, 100), 5);
    return 0;
}