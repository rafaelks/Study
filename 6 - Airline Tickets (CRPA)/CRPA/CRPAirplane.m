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

- (id)initWithCode:(NSString *)code andSections:(NSMutableArray *)sections
{
    self = [super init];
    
    if (self) {
        _code = code;
        self.sections = sections;
    }
    return self;
}

//Only add CRPSection itens
- (void) setSections:(NSMutableArray *)sections
{
    _sections = [[NSMutableArray alloc] init];
    
    for (int i=0; [sections count]; i++) {
        if ([[sections objectAtIndex:i] isKindOfClass:[CRPSection class]]) {
            [_sections addObject:[sections objectAtIndex:i]];
        }
    }
}

- (NSMutableArray *) sections
{
    return _sections;
}

@end
