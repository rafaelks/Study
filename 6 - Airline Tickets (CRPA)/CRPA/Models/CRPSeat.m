//
//  CRPSeat.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPSeat.h"

@implementation CRPSeat

- (id)initWithId:(NSString *)seatId
{
    self = [super init];

    if (self) {
        
        if (seatId.length > 4) {
            NSLog(@"O tamanho %i é inválido para identificador de assento, o tamanho deve ser de até 4 caracters.", (int) [seatId length]);
            return nil;
        }
        
        _seatId = seatId;
        _seatStatus = true;
        
        return self;
    }
    
    return nil;
}


@end
