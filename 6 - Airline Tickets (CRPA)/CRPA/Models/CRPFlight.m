//
//  CRPFlight.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPFlight.h"

@implementation CRPFlight;

- (id)initWithAirplane:(CRPAirplane *)airplane
           withOrigin:(CRPAirport *)origin
          withDestiny:(CRPAirport *)destiny
             withDate:(NSDate     *)date
             withCode:(NSString   *)code
{
    self = [super init];

    
    if (self) {
        if (origin == destiny) {
            NSLog(@"O destino não pode ser a origem!");
            return nil;
        }
        
        self.airplane = airplane;
        self.origin   = origin;
        self.destiny  = destiny;
        self.date     = date;
        self.code     = code;
    }
    
    return self;
}

- (void)setAirplane:(CRPAirplane *)airplane
{
    _airplane = airplane;
    _classes = [[NSMutableDictionary alloc] init];

    NSArray *sections = [airplane sections];
    NSString *columns = @"ABCDEF";
    
    for (CRPSection *section in sections) {
        NSMutableArray *seats = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < section.rows; i++) {
            for (int j = 0 ; j < section.cols; j++) {
                NSString *seatName = [NSString stringWithFormat:@"%d%c", i, [columns characterAtIndex:j]];
                CRPSeat *seat = [[CRPSeat alloc] initWithId:seatName];
                
                [seats addObject:seat];
            }
        }
        
        [_classes setObject:seats forKey:[section seatClass]];
    }
}

- (NSInteger)countOfAvailableSeats
{
    NSInteger count = 0;
    
    for (NSString *class in self.classes) {
        for (CRPSeat *seat in self.classes[class]) {
            if (seat.isFree) {
                count++;
            }
        }
    }
    
    return count;
}

- (NSInteger)countAllFlights
{
    NSInteger count = 0;
    
    for (NSString *class in self.classes) {
        count = count + [self.classes[class] count];
    }
    
    return count;
}

@end
