//
//  main.c
//  Binary Combinations
//
//  Created by Rafael Kellermann Streit on 12/2/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

void convertBaseVersion(int input, int base, char *output, int digits) {
    int i, remainder;
    char digitsArray[17] = "0123456789ABCDEF";
    
    for (i = digits; i > 0; i--) {
        remainder = input % base;
        input = input / base;
        output[i - 1] = digitsArray[remainder];
    }
    output[digits] = '\0';
}


int main(int argc, const char * argv[]) {
    int digits = 15;
    char binary[digits];
    
    for (int i = 0; i < exp2(digits); i++) {
        convertBaseVersion(i, 2, binary, digits);
        
        if (strnstr(binary, "11", digits) == NULL) {
            printf("%d -> %s\n", i, binary);
        }
    }
    
    return 0;
}
