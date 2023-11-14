#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/*
1. Parent process forks to a child
2. Child process exits immediately (by checking pid == 0 then exit(0))
3. Parent waits for 300s to not die, and also does not read child's exit status -> The child process becomes zombie
*/
int main(void)
{
    pid_t pid;
    int status;

    if ((pid = fork()) < 0) {
        perror("fork");
        exit(1);
    }

    /* Child process exists directly to create zombie process */
    if (pid == 0)
        exit(0);

    sleep(300);
}