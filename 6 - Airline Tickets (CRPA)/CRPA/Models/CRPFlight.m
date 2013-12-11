//
//  CRPFlight.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPFlight.h"

@implementation CRPFlight;

- (id)initWithSeatClasses:(NSArray *)seatClasses
{
    CRPSeatClass *sharedCRPSeatClass = [CRPSeatClass sharedManager];
    
    self.seatClasses = [[NSMutableArray alloc] init];
    
    for (int i=0; i < [seatClasses count]; i++) {
        NSString *seatClass = [[seatClasses objectAtIndex:i] stringValue];
        id existsClass = [[sharedCRPSeatClass getClasses] objectForKey:sharedCRPSeatClass];
        
        if (existsClass != nil && [self.seatClasses indexOfObject:seatClass] == NSNotFound) {
            [self.seatClasses addObject:seatClass];
        }
    }
    
    return nil;
}

@end
