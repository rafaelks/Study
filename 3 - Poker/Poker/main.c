//
//  main.c
//  Poker
//
//  Created by Rafael Kellermann Streit on 12/2/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#include <stdio.h>
#include <string.h>

FILE *file;
char path[] = "/Users/rafaelks/Projects/BEPiD/3 - Poker/Poker/poker.txt";
char line[30];


int getWinner(char *player1[5], char *player2[5]) {
	int i;
	int j;
	
	printf("PLAYER 1\n");
	for (i = 0; i < 5; i++) {
		printf("%s", player1[i]);
	}
	
	
	printf("\n\nPLAYER 2\n");
	for (j = 0; j < 5; j++) {
		printf("%s", player2[j]);
	}
	
	printf("\n");

	return 1;
}


int main(int argc, const char * argv[])
{
    file = fopen(path, "r");
    
	// RKS NOTE: Get file line by line
    while(fgets(line, 30, file) != NULL) {
        char *cards = strtok(line, " ");
		char *player1[5];
		char *player2[5];
		int counter = 1;
		int cardCounter = 0;

		// RKS NOTE: Start reading first card
		player1[cardCounter] = cards;
		printf("Player 1: %s\n", cards);
		
		// RKS NOTE: Let's separate who plays WTF
		while (cards != NULL) {
			cards = strtok(NULL, " ");
			
			if (cards != NULL) {
				if ((counter % 2) == 0) {
					printf("Player 1: %s\n", cards);
					player1[cardCounter] = cards;
				} else {
					printf("Player 2: %s\n", cards);
					player2[cardCounter] = cards;
				
					// RKS NOTE: Whe change user, we must increase
					// cardCounter value
					cardCounter++;
				}
			}
			
			counter++;
		}
		
		// RKS NOTE: Calculate who wins!
		printf("Player %i wins!\n\n\n", getWinner(player1, player2));
    }
}

