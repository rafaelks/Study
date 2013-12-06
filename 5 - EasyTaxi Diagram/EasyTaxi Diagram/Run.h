//
//  Run.h
//  EasyTaxi Diagram
//
//  Created by fabioschneider on 06/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Run : NSObject

- (void)setDriver:(Driver *)driver;
- (void)setPerson:(Person *)person;
- (void)setDistance:(float)distance;
- (void)setDate:(NSDate *)date;
- (void)setRate:(NSInteger *)rate;
- (void)setPayment:(Payment *)payment;

- (Driver *)getDriver;
- (Person *)getPerson;
- (float)getDistance;
- (NSDate *)getDate;
- (NSInteger *)getRate;
- (Payment *)getPayment;

@end
