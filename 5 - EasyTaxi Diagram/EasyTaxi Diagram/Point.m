//
//  Point.m
//  EasyTaxi Diagram
//
//  Created by Txai Wieser on 05/12/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import "Point.h"

@implementation Point
{
    double _latitude;
    double _longitude;
}

- (void)setLatitude:(double)latitude
{
    _latitude = latitude;
}

- (void)setLongitude:(double)longitude
{
    _longitude = longitude;
}

- (double)setLongitude
{
    return _longitude;
}

- (double)setLatitude
{
    return _latitude;
}

@end
