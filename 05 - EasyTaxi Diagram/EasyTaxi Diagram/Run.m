//
//  Run.m
//  EasyTaxi Diagram
//
//  Created by fabioschneider on 06/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "Run.h"
#import "Payment.h"
#import "Driver.h"
#import "Person.h"

@implementation Run
{
    Driver    *_driver;
    Person    *_person;
    Payment   *_payment;
    float     _distance;
    float     _price;
    NSInteger *_rate;
    NSDate    *_date;
    
}

- (void)setDriver:(Driver *)driver
{
    _driver = driver;
}

- (void)setPerson:(Person *)person
{
    _person = person;
}

- (void)setPayment:(Payment *)payment
{
    _payment = payment;
}

- (void)setDistance:(float)distance
{
    _distance = distance;
}

- (void)setPrice:(float)price
{
    _price = price;
}

- (void)setRate:(NSInteger *)rate
{
    _rate = rate;
}
- (void)setDate:(NSDate *)date
{
    _date = date;
}

- (Driver *)getDriver
{
    return _driver;
}

- (Person *)getPerson
{
    return _person;
}

- (Payment *)getPayment
{
    return _payment;
}

- (float)getDistance
{
    return _distance;
}

- (float)getPrice
{
    return _price;
}

- (NSInteger *)getRate
{
    return _rate;
}

- (NSDate *)getDate
{
    return _date;
}

@end
