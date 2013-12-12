//
//  CRPSeatClass.m
//  CRPA
//
//  Created by Rodrigo Nascimento on 11/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//  CRPSeatClass *sharedCRPSeatClass = [CRPSeatClass sharedManager];

#import "CRPSeatClass.h"

static NSDictionary *classes;

@implementation CRPSeatClass;


+ (NSDictionary *)getClasses {
    if (classes == nil) {
        classes = @{
            @"first-class": @"Primeira Classe",
            @"executive": @"Executiva",
            @"economic": @"Econômica"
        };
    }
    
    return classes;
}

@end
