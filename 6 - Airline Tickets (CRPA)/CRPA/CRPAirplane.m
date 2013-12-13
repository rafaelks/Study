//
//  CRPAirplane.m
//  CRPA
//
//  Created by Rodrigo Nascimento on 12/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPAirplane.h"

@implementation CRPAirplane

@synthesize sections=_sections;

- (id)initWithCode:(NSString *)code withSections:(NSArray *)sections andAirline:(CRPAirline *)airline
{
    self = [super init];
    
    if (self) {
        _code = code;
        _airline = airline;
        self.sections = sections;
    }
    return self;
}

//Only add CRPSection itens
- (void)setSections:(NSArray *)sections
{
    NSMutableArray *__sections = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [sections count]; i++) {
        if ([[sections objectAtIndex:i] isKindOfClass:[CRPSection class]]) {
            [__sections addObject:[sections objectAtIndex:i]];
        }
    }
    
    _sections = [[NSMutableArray alloc] initWithArray:[__sections copy]];
}

@end
