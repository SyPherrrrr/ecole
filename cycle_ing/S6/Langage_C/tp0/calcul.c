#include <stdio.h>
#include <stdlib.h>

void main() {
    int x1 = 0;
    int y1 = 0;
    int x2 = 20;
    int y2 = 30;

    float l = abs(x2 - x1);
    float h = abs(y2 - y1);
    double dist = sqrt(l*l + h*h);
    printf("La distance est %.2f\n", dist);
    return void;
}