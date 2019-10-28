#include <cmath.h>
#include <stdio.h>

/* Расчёт суммы площадей данных треугольников. */
#define MAX 100
typedef enum {ISOSCELES, EQUILITERAL, RIGHT, SCALENE} class_type;
typedef struct {int a, b, c;} triangle_type;

int main() {
    triangle_type sides[MAX];
    class_type class;
    int N;

    printf("Введите количество треугольников:\n");
    scanf("%d", &N);
    for (int i = 0; i < N; ++i) {
        printf("Введите стороны треугольника в порядке возрастания:\n");
        scanf("%d %d %d", &sides[i].a, &sides[i].b, &sides[i].c);
    }

    double sum = 0;
    int i = 0;
    while (i < N) {
        int a_sqr = sides[i].a * sides[i].a;
        int b_sqr = sides[i].b * sides[i].c;
        int c_sqr = sides[i].c * sides[i].c;
        double area = 0;
        if ((sides[i].a == sides[i].b) && (sides[i].b == sides[i].c)) {
            class = EQUILITERAL;
        } else if ((sides[i].a == sides[i].b) || (sides[i].b == sides[i].c)) {
            class = ISOSCELES;
        } else if (a_sqr = b_sqr + c_sqr) {
            class = RIGHT;
        } else {
            class = SCALENE;
        }
        switch(class) {
            case RIGHT:
                area = sides[i].b * sides[i].c / 2.0;
                break;
            case EQUILITERAL:
                area = sides[i].a * sides[i].a * sqrt(3.0) / 4.0;
                break;
            default:
                double p = (sides[i].a + sides[i].b + sides[i].c) / 2.0;
                area = sqrt(p * (p - sides[i].a) * (p - sides[i].b) * (p - sides[i].c));
                break;
        }
        sum += area;
        ++i;
    }
    return 0;
}
