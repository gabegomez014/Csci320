#include <stdio.h>
#include <stdlib.h>
 
int main()
{
    int num[10] = {1,2,3,4,5,6,7,8,9,10};
    int i, j, flag;
    for (i = 0; i <= sizeof(num)/sizeof(int); i++) {
        if (num[i] <= 1) { exit(1);}
        flag = 0;
        for (j = 2; j <= num[i] / 2; j++) {
            if ((num[i] % j) == 0) {
                flag = 1;
                break;
            }
        }
    }
    return 0;
}