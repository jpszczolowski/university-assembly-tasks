#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>

unsigned long fibonacci(unsigned long n);

int main(int argc, char **argv) {
	
	if (argc < 2) {
		return EXIT_FAILURE;
	}

	unsigned long x = strtol(argv[1], NULL, 10);
	
	printf("%lu\n", fibonacci(x));

	return EXIT_SUCCESS;
}
