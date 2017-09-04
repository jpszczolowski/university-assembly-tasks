#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int clz(long);

int main(int argc, char **argv) {
	if (argc < 2) {
		return EXIT_FAILURE;
	}
	
	long x = strtol(argv[1], NULL, 10);
	printf("%d\n", clz(x));
	
	return EXIT_SUCCESS;
}
