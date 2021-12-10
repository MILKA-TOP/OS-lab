#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <string.h>
#include <time.h>
#include <stdbool.h>
#include <signal.h>
#include <sys/types.h>


int size_array=8;
long int time_prog = 10;
volatile sig_atomic_t usr_check = 0;

void synch_signal (int sig) {
     usr_check = 1;
}


void child_function(long* mem) {

    long *now_array=mem;
    int rand_num = rand();
    now_array[rand_num % size_array]++;
    memcpy(mem, now_array, sizeof(now_array));
    kill(getppid(), SIGUSR1);

    exit(0);
}

int main()
{
    long *mem = mmap(NULL,size_array*sizeof(long), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, 0, 0);
    long int start_time = time(NULL);

    struct sigaction usr_action;
    sigset_t block_mask;
    sigfillset(&block_mask);
    usr_action.sa_handler = synch_signal;
    usr_action.sa_flags = 0;
    sigaction(SIGUSR1, &usr_action, NULL);

    while (1) {
	long *now_array = mem;
	int rand_num = rand();
	int pid = fork();
	if (pid == 0)
	    child_function(mem);
	while (!usr_check) ;

	now_array[(rand_num/size_array)%size_array]--;
	memcpy(mem, now_array, sizeof(now_array));
	usr_check=0;

	if ((time(NULL) - start_time) >= time_prog) break;
    }

    for (int i = 0; i < size_array; i++) {
	printf("[%d] ", mem[i]);
    }

    printf("\n");
    return 0;
}
