#include <stdio.h>	// including headers
#include <stdlib.h>	// including headers
#include <stdint.h>	// including headers

int clz(long);		 
// this is main function
int main(int argc, char **argv) {
	if (argc < 2) {
		return EXIT_FAILURE;
	}
	
	long x = strtol(argv[1], NULL, 10);
	printf("%d\n", clz(x));
	
	return EXIT_SUCCESS;
}
