//
//  CRPSeat.m
//  CRPA
//
//  Created by Rafael Kellermann Streit on 12/11/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "CRPSeat.h"

@implementation CRPSeat

#warning ADICIONAR VALIDAÇÃO ALFANUMERICA PARA IDENTIFICADOR DE ASSENTO.
- (id)initWithId:(NSString *)seatId
{
    if (self == nil) {
        if (seatId.length != 2) {
            NSLog(@"O tamanho é %ld inválido para nome do Aeroporto. Deve ser exatamente 2 caracteres.", seatId.length);
            return nil;
        }
        
        _seatId = seatId;
        _seatStatus = true;
        
        return self;
    }
    
    return nil;
}


@end
