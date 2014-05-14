#include <stdio.h>


int main(int argc, char *argv[])
{
    int sum = 0;
    int fib_old = 1;
    int fib_new = 1;
    while (fib_new < 4000000) {
        int tmp;
        tmp = fib_new;
        fib_new = fib_old + fib_new;
        fib_old = tmp;
        if ( fib_new % 2 == 0 ) {
            sum += fib_new;
        }
    }

    printf("%d\n", sum);

    /* return 0; */
}
