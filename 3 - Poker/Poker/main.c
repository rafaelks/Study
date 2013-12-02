//
//  main.c
//  Poker
//
//  Created by Rafael Kellermann Streit on 12/2/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#include <stdio.h>

FILE *file;
char path[] = "/Users/rafaelks/Projects/BEPiD/3 - Poker/Poker/poker.txt";
int counter1 = 0;
int counter2 = 0;

char line[30];
char *cards[1000][2];

char *caracter;

int main(int argc, const char * argv[])
{
    file = fopen(path, "r");
    
    while(fgets(line, 29, file) != NULL) {
        for (int i = 0; i < 15; i++) {
            
        }
    }
}

