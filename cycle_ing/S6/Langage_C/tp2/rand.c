
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include "rand.h"


void RandInit(){
    srand(time(NULL));
}

int RandInt(int min, int max) {
    return (rand()%(max - min + 1) + min);
}


