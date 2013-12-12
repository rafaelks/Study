//
//  CRPAirplane.m
//  CRPA
//
//  Created by Rodrigo Nascimento on 12/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPAirplane.h"

@implementation CRPAirplane

- (id)initWithCode:(NSString *)code andSections:(NSMutableArray *)sections {
    self = [super init];
    
    if (self) {
        _code = code;
        _sections = sections;
    }
    return self;
}

@end
