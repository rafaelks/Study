//
//  Driver.m
//  EasyTaxi Diagram
//
//  Created by Txai Wieser on 05/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "Driver.h"

@implementation Driver
{
    NSString *_licence;
    NSString *_car;
}

- (void)setLicence:(NSString *)licence
{
    _licence = licence;
}

- (void)setCar:(NSString *)car
{
    _car = car;
}


- (NSString *)getLicence
{
    return _licence;
}

-(NSString *)getCar
{
    return _car;
}

@end
