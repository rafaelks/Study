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
    self.seatClasses = [[NSMutableArray alloc] init];
    
    for (int i=0; i < [seatClasses count]; i++) {
        NSString *seatClass = [[seatClasses objectAtIndex:i] stringValue];
        id existsClass = [[CRPSeatClass getClasses] objectForKey:seatClass];
        
        if (existsClass != nil && [self.seatClasses indexOfObject:seatClass] == NSNotFound) {
            [_seatClasses addObject:seatClass];
        }
    }
    
    return nil;
}

- (id)initWithAirline:(CRPAirline *)airLine
           withOrigin:(CRPAirport *)origin
          withDestiny:(CRPAirport *)destiny
             withDate:(NSDate     *)date
             withCode:(NSString   *)code
{
    self = [super init];

    
    if (self) {
        if (origin == destiny){
            NSLog(@"O destino não pode ser a origem!");
            return nil;
        } else {
            self.airLine = airLine;
            self.origin  = origin;
            self.destiny = destiny;
            self.date    = date;
            self.code    = code;
        }
    }
    
    return self;
}

@end
