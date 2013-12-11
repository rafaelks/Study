//
//  CRPAirline.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPAirline.h"

@implementation CRPAirline

- (id)initWithName:(NSString *)name {

    if (self == nil){
        if (name.length > 6){
            NSLog(@"Nome inválido. O nome deve ter no máximo 6 caracteres!");
            return nil;
        }
        _name = name;
        return self;
    }
    return nil;
}

@end
