//
//  CRPSeatClass.m
//  CRPA
//
//  Created by Rodrigo Nascimento on 11/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//  CRPSeatClass *sharedCRPSeatClass = [CRPSeatClass sharedManager];

#import "CRPSeatClass.h"

@implementation CRPSeatClass {
    NSDictionary *classes;
}

+ (id)sharedManager {
    static CRPSeatClass *sharedCRPSeatClass = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCRPSeatClass = [[self alloc] init];
    });
    return sharedCRPSeatClass;
}

- (id)init {
    self = [super init];

    if (self) {
        classes = @{
            @"first-class": @"Primeira Classe",
            @"executive": @"Executiva",
            @"economic": @"Econômica"
        };
    }

    return self;
}


- (NSDictionary *)getClasses {
    return classes;
}

@end
