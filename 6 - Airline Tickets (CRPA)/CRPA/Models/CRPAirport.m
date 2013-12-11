//
//  CRPAirport.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPAirport.h"

@implementation CRPAirport

- (id)initWithName:(NSString *)name
{
    if (self == nil) {
        if (name.length != 3) {
            NSLog(@"O tamanho é %ld inválido para nome do Aeroporto. Deve ser exatamente 3 caracteres.", name.length);
            return nil;
        }
        
        _name = name;
        
        return self;
    }
    
    return nil;
}

@end
