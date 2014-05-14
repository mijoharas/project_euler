#include <stdio.h>
#include <math.h>
#include <string>
#include <iostream>
#include <algorithm>

using namespace std;

int isDivisible(long long num){
    // checks if no can be divided by every number up to 20
    for (int i = 1; i <= 20; i++) {
        if (num % i != 0)
            return false;
    }
    return true;

}

int main(int argc, char *argv[])
{
    long long number = 1;
    while (!isDivisible(number)) {
        number +=1;
    }
    cout << number << "\n";
    return 0;
}
