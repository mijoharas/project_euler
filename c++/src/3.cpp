#include <stdio.h>
#include <math.h>

int isPrime(int n){
    int i;
    if (n == 2)
        return true;

    if (n % 2 == 0)
        return false;

    for (i = 3; i < sqrt(n); i += 2) {
       if (n % i == 0)
           return false;
    }

    return true;

}

int main(int argc, char *argv[])
{
    long long n = 600851475143;
    // this is root n ish
    int i = 775147;
    while (i > 0) {
        if (isPrime(i))
            if (n % i == 0) {
                printf("%d\n", i);
                return 0;
            }
        i -= 2;
    }
}
