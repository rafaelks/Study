//
//  main.c
//  Poker
//
//  Created by Rafael Kellermann Streit on 12/2/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *file;
char path[] = "/Users/rafaelks/Projects/BEPiD/3 - Poker/Poker/poker.txt";
char line[30];
int scorePlayer1 = 0;
int scorePlayer2 = 0;
int scoreDraw = 0;


int compareCards(const void *a, const void *b) {
    int int_a = * ((int *) a);
    int int_b = * ((int*) b);
    
    if (int_a == int_b) {
        return 0;
    } else if (int_a < int_b) {
        return -1;
    }
    
    return 1;
}


// RKS NOTE: returns the value of the card in number
int getCardValueInNumber(char cardNumber) {
    switch (cardNumber) {
        case 'A':
            return 1;
            break;
        case '2':
            return 2;
            break;
        case '3':
            return 3;
            break;
        case '4':
            return 4;
            break;
        case '5':
            return 5;
            break;
        case '6':
            return 6;
            break;
        case '7':
            return 7;
            break;
        case '8':
            return 8;
            break;
        case '9':
            return 9;
            break;
        case 'T':
            return 10;
            break;
        case 'J':
            return 11;
            break;
        case 'Q':
            return 12;
            break;
        case 'K':
            return 13;
            break;
        case 'C':
            return 14;
            break;
        case 'S':
            return 15;
            break;
        case 'H':
            return 16;
            break;
        case 'D':
            return 17;
            break;
        default:
            return 0;
            break;
    }

    return 0;
}


int royal(char cards[]) {
    int check[18];

    for (int a = 0; a < 18; a++) {
        check[a] = 0;
    }

    for (int i = 0; i < 10; i++) {
        check[getCardValueInNumber(cards[i])]++;
    }

    if (check[10] == 1 && check[11] == 1 && check[12] == 1 && check[13] == 1 && check[1] == 1 && (check[14] == 5 || check[15] == 5 || check[16] == 5 || check[17] == 5)) {
        return 1;
    } else {
        return 0;
    }
}


int straightf(char cards[]) {
    int check[18];

    for (int a = 0 ; a < 18; a++) {
        check[a] = 0;
    }

    for (int i = 0; i < 10; i++) {
        check[getCardValueInNumber(cards[i])]++;
    }

    for (int i = 0; i + 4 <= 13; i++) {
        if (check[i] == 1 && check[i + 1] == 1 && check[i + 2] == 1 && check[i + 3] == 1 && check[i + 4] == 1 && (check[14] == 5 || check[15] == 5 || check[16] == 5 || check[17] == 5)) {
            return i + 4;
        }
    }

    return 0;
}


int fourkind(char cards[]){
    int check[18];

    for (int a = 0; a < 18; a++) {
        check[a] = 0;
    }

    for (int i = 0; i < 10; i += 2) {
        check[getCardValueInNumber(cards[i])]++;
    }

    for (int i = 0; i <= 13; i++) {
        if (check[i] == 4) {
            return i;
        }
    }

    return 0;
}


int threekind(char cards[]) {
    int check[18];

    for (int a = 0; a < 18; a++) {
        check[a] = 0;
    }

    for (int i = 0; i < 10; i += 2) {
        check[getCardValueInNumber(cards[i])]++;
    }

    for (int i = 0; i <= 13; i++) {
        if (check[i] == 3) {
            return i;
        }
    }

    return 0;
}


int flush(char cards[]){
    int check[18];

    for (int a = 0; a < 18; a++) {
        check[a] = 0;
    }

    for (int i = 1; i < 10; i += 2) {
        check[getCardValueInNumber(cards[i])]++;
    }

    if (check[14] == 5 || check[15] == 5 || check[16] == 5 || check[17] == 5) {
        return 1;
    } else {
        return 0;
    }
}


int twopair(char cards[]){
    int check[18];
    int pairs[20];
    int count = 0;
    int a = 0;

    for (int a = 0; a < 18; a++) {
        check[a] = 0;
    }

    for (int i = 0; i < 10; i += 2) {
        check[getCardValueInNumber(cards[i])]++;
    }
    
    for (int i = 0; i <= 13; i++) {
        if (check[i] == 2) {
            count++;
            pairs[a] = i;
            a++;
        }

        if (a == 2) {
            if (pairs[0] > pairs[1]) {
                return pairs[0];
            } else {
                return pairs[1];
            }
        }
    }

    return 0;
}


int onepair(char cards[]){
    int check[18];

    for (int a = 0; a < 18; a++) {
        check[a] = 0;
    }

    for (int i = 0; i < 10; i += 2) {
        check[getCardValueInNumber(cards[i])]++;
    }

    for (int i = 0; i <= 13; i++) {
        if (check[i] == 2) {
            return i;
        }
    }

    return 0;
}


int straight(char cards[]) {
    int check[18];

    for (int a = 0; a < 18; a++) {
        check[a] = 0;
    }

    for (int i = 0; i < 10; i += 2) {
        check[getCardValueInNumber(cards[i])]++;
    }

    for (int i = 0; i + 4 <= 13; i++) {
        if (check[i] == 1 && check[i + 1] == 1 && check[i + 2] == 1 && check[i + 3] == 1 && check[i + 4] == 1) {
            return i + 4;
        }
    }

    return 0;
}


int fullh(char cards[]) {
    if (onepair(cards) != 0 && threekind(cards) > 0) {
        return threekind(cards);
    }

    return 0;
}


int high(char cards[], int rank) {
    int vet[50];
    int a = 0;

    for (int i = 0; i < 9; i += 2) {
        if (getCardValueInNumber(cards[i]) == 1) {
            vet[a] = 14;
            a++;
        } else {
            vet[a] = getCardValueInNumber(cards[i]);
            a++;
        }
    }

    qsort(vet, 10 , sizeof(int), compareCards);
    return vet[10 - rank];
}



int todeath(char player1[10], char player2[10]){
    for (int i = 1; i < 10; i++) {
        if (high(player1, i) > high(player2, i)) {
            return 0;
        } else if (high(player1, i) < high(player2, i)) {
            return 1;
        }
    }

    return -1;
}


int getWinner(char player1[10], char player2[10]) {
    // Different hands ranked from 0 to 9
    int rank1;
    int rank2;
    
    // RKS NOTE: Ranking Player 1
    if (royal(player1)) {
        rank1 = 9;
    } else if (straightf(player1) > 0) {
        rank1 = 8;
    } else if (fourkind(player1) > 0) {
        rank1 = 7;
    } else if (fullh(player1) > 0) {
        rank1 = 6;
    } else if (flush(player1) > 0) {
        rank1 = 5;
    } else if (straight(player1) > 0) {
        rank1 = 4;
    } else if (threekind(player1) > 0) {
        rank1 = 3;
    } else if (twopair(player1) > 0) {
        rank1 = 2;
    } else if (onepair(player1) > 0) {
        rank1 = 1;
    } else {
        rank1 = 0;
    }
    

    // RKS NOTE: Ranking Player 2
    if (royal(player2)) {
        rank2 = 9;
    } else if (straightf(player2) > 0) {
        rank2 = 8;
    } else if (fourkind(player2) > 0) {
        rank2 = 7;
    } else if (fullh(player2) > 0) {
        rank2 = 6;
    } else if (flush(player2) > 0) {
        rank2 = 5;
    } else if (straight(player2) > 0) {
        rank2 = 4;
    } else if (threekind(player2) > 0) {
        rank2 = 3;
    } else if (twopair(player2) > 0) {
        rank2 = 2;
    } else if (onepair(player2) > 0) {
        rank2 = 1;
    } else {
        rank2 = 0;
    }

    if (rank1 > rank2) {
        return 0;
    } else if (rank2 > rank1) {
        return 1;
    } else if (rank1 == rank2) {
        if (rank1 == 8) {
            if (straightf(player1) > straightf(player2)) {
                return 0;
            } else if (straightf(player1) < straightf(player2)) {
                return 1;
            } else {
                return todeath(player1, player2);
            }
        } else if (rank1 == 7)  {
            if (fourkind(player1) > fourkind(player2)) {
                return 0;
            } else if (fourkind(player2)>fourkind(player1)) {
                return 1;
            } else {
                return todeath(player1, player2);
            }
        } else if (rank1 == 6) {
            if (fullh(player1) > fullh(player2)) {
                return 0;
            } else if (fullh(player1)>fullh(player2))
                return 1;
            } else {
                return todeath(player1, player2);
            }
        } else if (rank1 == 5) {
            return todeath(player1, player2);
        } else if (rank1 == 4) {
            if (straight(player1) > straight(player2)) {
                return 0;
            } else if (straight(player1) < straight(player2)) {
                return 1;
            } else {
                return todeath(player1, player2);
            }
        } else if (rank1 == 3) {
            if (threekind(player1) > threekind(player2)) {
                return 0;
            } else if (threekind(player1) < threekind(player2)) {
                return 1;
            } else {
                return todeath(player1, player2);
            }
        } else if (rank1 == 2) {
            if (twopair(player1) > twopair(player2)) {
                return 0;
            } else if (twopair(player1) < twopair(player2)) {
                return 1;
            } else {
                return todeath(player1, player2);
            }
        } else if (rank1 == 1) {
            if (onepair(player1)>onepair(player2)) {
                return 0;
            } else if (onepair(player1)<onepair(player2)) {
                return 1;
            } else {
                return todeath(player1, player2);
            }
        } else if (rank1 == 0) {
            return todeath(player1, player2);
        }
    
    return -1;
}


int main(int argc, const char * argv[]) {
    file = fopen(path, "r");
    
	// RKS NOTE: Get file line by line
    while(fgets(line, 30, file) > 0) {
        char *cards = strtok(line, " ");

		char player1[10];
		char player2[10];

		int counter = 1;

		int cardCounterPlayer1 = 0;
        int cardCounterPlayer2 = 0;

		// RKS NOTE: Start reading first card
		player1[cardCounterPlayer1++] = cards[0];
        player1[cardCounterPlayer1++] = cards[1];
		
		// RKS NOTE: Let's separate who plays WTF
		while (cards != NULL) {
			cards = strtok(NULL, " ");
			
			if (cards != NULL) {
				if (counter < 5) {
					player1[cardCounterPlayer1++] = cards[0];
                    player1[cardCounterPlayer1++] = cards[1];
				} else {
					player2[cardCounterPlayer2++] = cards[0];
                    player2[cardCounterPlayer2++] = cards[1];
				}
			}
			
			counter++;
		}
        
        // RKS NOTE: Calculate who wins!
        if (counter > 2) {
            int winner = getWinner(player1, player2);

            if (winner == 0) {
                scorePlayer1++;
            } else if (winner == 1) {
                scorePlayer2++;
            } else {
                scoreDraw++;
            }
        }
    }
    
    fclose(file);
    
    printf("SCORE Player 1: %i\n", scorePlayer1);
    printf("SCORE Player 2: %i\n", scorePlayer2);
    printf("SCORE Empates: %i\n", scoreDraw);
}

