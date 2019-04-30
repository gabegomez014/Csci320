#include <stdio.h>
#include <string.h>
int main(int argc, char const *argv[]) {
	char dna[1000] = "AGTCGTGAATTCCAAATTTTGGGCGATATAGCTAGGATATCGCGGGATTATCGAGACGAGGGGAGAATTTTTTTTTCCCCCCAAGG";
	int length = strlen(dna);
	int i = 0;
	int a = 0;
	int c = 0;
	while (i < length - 1) {
		if (dna[i] == 'A') {a++;}
		else if (dna[i] == 'C') {c++;}
		i++;
	}
	return 0;}