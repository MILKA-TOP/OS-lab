#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <string.h>
#include <time.h>

int size_array=8;
long int time_prog = 5;

int main()
{
    long *mem = mmap(NULL,size_array*sizeof(long), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, 0, 0);
    int pid = fork();
    long int start_time = time(NULL);
    while (1) {
	long *now_array = mem;
	int rand_num = rand();

	if (pid == 0)
	    now_array[rand_num % size_array]++;
	else
	    now_array[(rand_num / size_array) % size_array]--;

	memcpy(mem, now_array, sizeof(now_array));

	if ((time(NULL) - start_time) >= time_prog) break;
	sleep(0.2);
    }

    if (pid == 0) exit(0);

    for (int i = 0; i < size_array; i++) {
	printf("[%d] ", mem[i]);
    }
    printf("\n");
    return 0;
}
