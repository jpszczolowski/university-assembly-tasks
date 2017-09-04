#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>

double approx_sqrt(double x, double epsilon);

int main(int argc, char **argv) {
	
	if (argc < 3) {
		return EXIT_FAILURE;
	}

	double x = strtod(argv[1], NULL);
	double eps = strtod(argv[2], NULL);
	
	printf("%lf\n", approx_sqrt(x, eps));

	return EXIT_SUCCESS;
}
