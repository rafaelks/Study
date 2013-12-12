//
//  CRPASection.m
//  CRPA
//
//  Created by Gabriel Tondin on 11/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPSection.h"

@implementation CRPSection

-(id)initWithAirline:(CRPAirline *)airline andFlight:(CRPFlight *)flID andRows:(NSInteger)rows andCols:(NSInteger)cols
{
    self = [ super init];
    
    NSString *columns = @"ABCDEF";

    _seats = [[ NSMutableArray alloc] init];

    for (int i=0; i < rows; i++) {
        for (int j = 0 ; j < cols; j++) {
            NSString *seatName = [NSString stringWithFormat:@"%d%hu", i, [columns characterAtIndex:j]];
            CRPSeat *seat = [[CRPSeat alloc] initWithId:seatName];
            
            [_seats addObject:seat];
        }
    }
    
    NSLog(@"%@", _seats);
    
    return self;
}


@end
