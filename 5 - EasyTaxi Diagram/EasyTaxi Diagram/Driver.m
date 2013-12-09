//
//  Driver.m
//  EasyTaxi Diagram
//
//  Created by Txai Wieser on 05/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "Driver.h"
#import "Car.h"

@implementation Driver
{
    NSString *_licence;
    Car *_car;
}

- (void)setLicence:(NSString *)licence
{
    _licence = licence;
}

- (void)setCar:(Car *)car
{
    _car = car;
}


- (NSString *)getLicence
{
    return _licence;
}

-(Car *)getCar
{
    return _car;
}

@end
