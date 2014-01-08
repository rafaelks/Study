//
//  CRPAirport.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPAirport.h"

@implementation CRPAirport

- (id)initWithCode:(NSString *)code andName:(NSString *)name
{
    self = [super init];

    if (self) {
        if (code.length != 3) {
            NSLog(@"O tamanho %i é inválido para nome do Aeroporto. Deve ser exatamente 3 caracteres.", (int) [code length]);
            return nil;
        }
        
        _code = code;
        _name = name;
        
        return self;
    }
    
    return nil;
}

@end
