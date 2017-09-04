#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>

void insert_sort(long *first, long *last);

int main(int argc, char **argv) {

	if (argc < 2) {
		return EXIT_FAILURE;
	}

	long arr[10000];
	for (int i = 1; i < argc; i++)
		arr[i - 1] = strtol(argv[i], NULL, 10);
		
	insert_sort(arr, arr + argc - 2);
	
	for (int i = 1; i < argc; i++)
		printf("%ld ", arr[i - 1]);

	printf("\n");
	
	return EXIT_SUCCESS;
}
