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
             withYear:(int)year
            withMonth:(int)month
              withDay:(int)day
             withCode:(NSString *)code
{
    self = [super init];

    if (self) {
        self.airLine = airLine;
        self.origin = origin;
        self.destiny = destiny;
        self.year = year;
        self.month = month;
        self.day = day;
        self.code = code;
    }
    
    return self;
}

@end
