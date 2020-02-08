#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cassert>
#include <random>
using namespace std;

// exe, filename, seed, t_limit, n_limit, m_limit
int main(int argc, char** argv) {

    if (argc != 6) {
        if (argc != 5) {
            fprintf(stderr, "must provide filename, seed, t_limit, n_limit, m_limit");
            assert(false);
        }
    }

    char* filename = argv[1];

    int seed = atoi(argv[2]);

    int t_limit = atoi(argv[3]);

    int n_limit = atoi(argv[4]);

    int m_limit = atoi(argv[5]);

    FILE *file = fopen(filename, "w+");

    mt19937_64 rng(seed);

    int t = t_limit;

    int n = n_limit;

    int m = m_limit;

    fprintf(file, "%d\n", t);

    for (int cs = 0; cs < t; cs++) {
        fprintf(file, "%d %d\n", m, n);
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                fprintf(file, "%d", (int)(rng() & 1));
            }
            fprintf(file, "\n");
        }
    }

    fclose(file);

    return 0;
}
