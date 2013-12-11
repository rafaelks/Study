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
        _seatId = seatId;
        _seatStatus = true;
        
        return self;
    }
    
    return nil;
}


@end
