//
//  main.c
//  Anagrams
//
//  Created by Rafael Kellermann Streit on 12/2/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE * mainFile;
FILE * file;
char mainWord[256];
char word[256];
char path[] = "~/Projects/BEPiD/1 - Anagrams/Anagrams/words.txt";

int charCompare (const void * a, const void * b) {
    
    return *(const char *)a - *(const char *)b;
}

int compareWords(char *mainWord, char *word) {
    
    char sortedMainWord[256];
    char sortedWord[256];
    
    strcpy(sortedMainWord, mainWord);
    strcpy(sortedWord, word);
    
    qsort (sortedMainWord, strlen(sortedMainWord), sizeof(char), charCompare);
    qsort (sortedWord, strlen(sortedWord), sizeof(char), charCompare);
    
    if (strcmp(sortedMainWord, sortedWord) == 0) {
        return 1;
    }
    return 0;
}


int main(int argc, const char * argv[]) {
    
    mainFile = fopen( path, "r");
    file = fopen( path, "r");
    
    if (file == NULL) {
        return 1;
    }
    
    
    if (mainFile == NULL) {
        return 1;
    }
    
    
    int printedMainWord;
    int matchs;

    while(fgets(mainWord, sizeof(mainWord), mainFile) > 0) {
        printedMainWord = 0;
        
        long mainWordLength = strlen(mainWord);
        
        if( mainWord[mainWordLength-1] == '\n' ) {
            mainWord[mainWordLength-1] = 0;
        }
        
        
        matchs = 0;
        while(fgets(word, sizeof(word), file) > 0) {
            long wordLength = strlen(word);
            if( word[wordLength-1] == '\n' ) {
                word[wordLength-1] = 0;
            }
            
            if (mainWordLength == wordLength && strcmp(mainWord, word) != 0) {
                if (compareWords(mainWord, word) == 1) {
                    matchs++;
                    if (printedMainWord == 0) {
                        printedMainWord = 1;
                        printf("%s -> ", mainWord);
                    }
                    if(matchs == 1) {
                        printf("%s", word);
                    } else {
                        printf(", %s", word);
                    }
                }
            }
        }
        if (printedMainWord == 1) {
            printf("\n");
        }
        
        rewind(file);
    }
    
    fclose(file);
    fclose(mainFile);
    
    return 0;
}