#include <stdio.h>
#include <math.h>
#include <string>
#include <iostream>
#include <algorithm>

using namespace std;

int isPalindome(int num){
    string tmp = to_string(num);
    string tmp2 = tmp;
    reverse(tmp2.begin(), tmp2.end());
    return tmp == tmp2;
}

int main(int argc, char *argv[])
{
    int max_palindrome = 0;
    int test;
    for (int i = 1; i < 1000; i++) {
        for (int j = 1; j < 1000; j++) {
            test = i*j;
            if (isPalindome(test)) {
                if (test > max_palindrome)
                    max_palindrome = test;
            }

        }
    }

    cout << max_palindrome << "\n";
    return 0;
}
