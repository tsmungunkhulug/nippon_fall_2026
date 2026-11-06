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

int passing(struct student students[], int number) {
    int cnt = 0;
    for (int i = 0; i < number; i ++) {
        double finalScore = final_score(students[i]);
        if (finalScore >= 60) {
            cnt = cnt + 1;
        }
    }

    return cnt;
}

int best_index(struct student students[], int size) {
    int max ;
    for ( int i = 0; i <= size; i++) {
        if ((final_score(students[i])) > (final_score(students[0]))) {
            max = i;
        }
    }
    return max;
}

double average_final (struct student students[], int size) {
    int s = 0, cnt = 0, final;
    for (int i = 0; i < size; i++) {
        s = s + (final_score(students[i]));
        cnt = cnt + 1;
    }
    return s / size;
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

void print_student(struct student s) {
    printf("%s %.1f %c\n", s.name, final_score(s), letter_grade(final_score(s)));
}

int main(void) {
    check_double(final_score(group[0]), 86.0);
    check_double(final_score(group[2]), 92.6);
    check_int(passing(group, 4),4);
    check_int(best_index(group, 4), 2);
    check_double(average_final(group, 4), 77.0);
    

}