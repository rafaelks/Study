//
//  Payment.h
//  EasyTaxi Diagram
//
//  Created by fabioschneider on 06/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Payment : NSObject
- (void)setCodPayment:(NSInteger *)codpayment;
- (void)setDescription:(NSString *)descryption;

- (NSInteger *)getCodPayment;
- (NSString *)getDescription;
@end
