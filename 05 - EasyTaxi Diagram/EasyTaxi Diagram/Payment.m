//
//  Payment.m
//  EasyTaxi Diagram
//
//  Created by fabioschneider on 06/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "Payment.h"

@implementation Payment
    NSInteger *_codpayment;
    NSString  *_description;

- (void)setCodPayment:(NSInteger *)codpayment
{
    _codpayment = codpayment;
}

- (void)setDescription:(NSString *)descryption
{
    _description = descryption;
}

- (NSInteger *)getCodPayment
{
    return _codpayment;
}

- (NSString *)getDescription
{
    return _description;
}
@end
