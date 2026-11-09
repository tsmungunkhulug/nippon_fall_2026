#include <stdio.h>
#include <unistd.h> 

int main(void) {
    printf("би process %d\n", (int)getpid());
    fflush(stdout);
    sleep(30);
    printf("дууслаа");
    return 0;
}