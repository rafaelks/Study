//
//  CRPSystemManager.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPSystemManager.h"
#import "CRPAirport.h"

@implementation CRPSystemManager {
    NSMutableArray *airports;
}

- (instancetype)init
{
    airports = [[NSMutableArray alloc] init];

    return self;
}

# pragma Airport

- (void)addAirportWithCode:(NSString *)code andName:(NSString *)name {
    CRPAirport *airport = [[CRPAirport alloc] initWithCode:code andName:name];
    
    if (airport != nil) {
        [airports addObject:airport];
    }
}

- (NSMutableArray *)getAllAirports
{
    return airports;
}

@end
