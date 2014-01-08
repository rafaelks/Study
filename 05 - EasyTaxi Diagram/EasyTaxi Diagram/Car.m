//
//  Car.m
//  EasyTaxi Diagram
//
//  Created by fabioschneider on 06/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//


#import "Car.h"
#import "Payment.h"


@implementation Car
{    
    NSString *_licence;
    NSString *_model;
    BOOL _bigtrunk;
    BOOL _active;
    Payment  *_payment;
    CLLocationCoordinate2D *_position;
}

- (void)setLicence:(NSString *)licence
{
    _licence = licence;
}

-(void)setModel:(NSString *)model
{
    _model = model;
}

-(void)setActive:(BOOL)active
{
    _active = active;
}

-(void)setBigTrunk:(BOOL)bigtrunk
{
    _bigtrunk = bigtrunk;
}

-(void)setPayment:(Payment *)payment
{
    _payment = payment;
}

- (void)setPosition:(CLLocationCoordinate2D *)position
{
    _position = position;
}

- (NSString *)getLicence
{
    return _licence;
}

- (NSString *)getModel
{
    return _model;
}

- (BOOL)getBigTrunk
{
    return _bigtrunk;
}

- (BOOL)getActive
{
    return _active;
}

- (Payment *)getPayment
{
    return _payment;
}

- (CLLocationCoordinate2D *)getPosition
{
    return _position;
}

@end
